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

import 'bloc/profile_detail_background_image_bloc.dart';
import 'bloc/profile_detail_background_image_event.dart';
import 'bloc/profile_detail_background_image_state.dart';

class WidgetProfileDetailBackgroundImage extends StatefulWidget {
  final String backgroundImageUrl;

  const WidgetProfileDetailBackgroundImage(
      {Key key, @required this.backgroundImageUrl})
      : super(key: key);

  @override
  _WidgetProfileDetailBackgroundImageState createState() =>
      _WidgetProfileDetailBackgroundImageState();
}

class _WidgetProfileDetailBackgroundImageState
    extends State<WidgetProfileDetailBackgroundImage> {
  final _picker = ImagePicker();
  PickedFile backgroundImageFile;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileDetailBackgroundImageBloc,
        ProfileDetailBackgroundImageState>(
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
      child: BlocBuilder<ProfileDetailBackgroundImageBloc,
          ProfileDetailBackgroundImageState>(builder: (context, state) {
        return Stack(
          children: [
            Container(
              child: AspectRatio(
                aspectRatio: 3.0,
                child: WidgetCachedImage(
                  url: widget.backgroundImageUrl,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: GestureDetector(
                onTap: _onPickBackgroundImage,
                child: Container(
                  width: 40,
                  height: 40,
                  child: WidgetCircleAvatar(
                    border: 3,
                    padding: EdgeInsets.all(6.0),
                    image: Image.asset(
                      'assets/images/img_camera2.png',
                      fit: BoxFit.fitWidth,
                    ),
                    backgroundColor: Color(0xFFD6D5D5),
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  Future<Null> _onPickBackgroundImage() async {
    backgroundImageFile = null;
    backgroundImageFile = await _picker.getImage(source: ImageSource.gallery);
    if (backgroundImageFile != null) {
      File croppedFile = await ImageCropper.cropImage(
          sourcePath: backgroundImageFile.path,
          compressQuality: 50,
          compressFormat: ImageCompressFormat.png,
          aspectRatio: AppValue.CROP_BACKGROUND_IMAGE_RATIO,
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: true),
          iosUiSettings:
          IOSUiSettings(title: 'Cropper', aspectRatioLockEnabled: true));
      if (croppedFile != null) {
        BlocProvider.of<ProfileDetailBackgroundImageBloc>(context).add(
            ProfileDetailBackgroundImageUploadEvent(
                backgroundImageFile: croppedFile));
      }
    }
  }
}
