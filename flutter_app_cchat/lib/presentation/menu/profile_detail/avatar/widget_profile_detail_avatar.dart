import 'dart:io';

import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/presentation/menu/profile/bloc/profile_bloc.dart';
import 'package:flutter_app_cchat/presentation/menu/profile/bloc/profile_event.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'bloc/profile_detail_avatar_bloc.dart';
import 'bloc/profile_detail_avatar_event.dart';
import 'bloc/profile_detail_avatar_state.dart';


class WidgetProfileDetailAvatar extends StatefulWidget {
  final String avatarUrl;

  const WidgetProfileDetailAvatar({Key key, @required this.avatarUrl}) : super(key: key);
  @override
  _WidgetProfileDetailAvatarState createState() => _WidgetProfileDetailAvatarState();
}

class _WidgetProfileDetailAvatarState extends State<WidgetProfileDetailAvatar> {
  final _picker = ImagePicker();
  PickedFile avatarFile;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileDetailAvatarBloc, ProfileDetailAvatarState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }

        if (state.isSuccess) {
          BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
          await HttpHandler.resolve(status: state.status);
        }

        if (state.isFailure) {
          await HttpHandler.resolve(status: state.status);
        }
      },
      child: BlocBuilder<ProfileDetailAvatarBloc, ProfileDetailAvatarState>(
          builder: (context, state) {
            return Container(
              child: Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: FractionallySizedBox(
                    widthFactor: 0.3,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        children: [
                          Hero(
                            tag: 'avatar',
                            child: WidgetCircleAvatar(
                              image: WidgetCachedImage(
                                url: widget.avatarUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: _onPickAvatar,
                                child: FractionallySizedBox(
                                  widthFactor: 0.3,
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: WidgetCircleAvatar(
                                      border: 2,
                                      padding: EdgeInsets.all(6.0),
                                      image: Image.asset(
                                        'assets/images/img_camera2.png',
                                        fit: BoxFit.fitWidth,
                                      ),
                                      backgroundColor: Color(0xFFD6D5D5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Future<Null> _onPickAvatar() async {
    avatarFile = null;
    avatarFile = await _picker.getImage(source: ImageSource.gallery);
    if (avatarFile != null) {
      File croppedFile = await ImageCropper.cropImage(
          sourcePath: avatarFile.path,
          compressQuality: 50,
          compressFormat: ImageCompressFormat.png,
          aspectRatio: AppValue.CROP_AVATAR_RATIO,

          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: true),
          iosUiSettings: IOSUiSettings(
              title: 'Cropper',
              aspectRatioLockEnabled: true
          ));
      if(croppedFile!=null){
        BlocProvider.of<ProfileDetailAvatarBloc>(context)
            .add(ProfileDetailAvatarUploadEvent(avatarFile: croppedFile));
      }
    }
  }
}

