import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/presentation/menu/profile/bloc/profile_bloc.dart';
import 'package:flutter_app_cchat/presentation/menu/profile/bloc/profile_event.dart';
import 'package:flutter_app_cchat/presentation/menu/profile/bloc/profile_state.dart';
import 'package:flutter_app_cchat/presentation/menu/profile_detail/phone_form/bloc/phone_form_bloc.dart';
import 'package:flutter_app_cchat/presentation/menu/profile_detail/phone_form/widget_phone_form.dart';
import 'package:flutter_app_cchat/presentation/menu/profile_detail/widget_profile_detail_appbar.dart';
import 'package:flutter_app_cchat/presentation/menu/profile_detail/widget_profile_detail_image.dart';
import 'package:flutter_app_cchat/utils/common/common_utils.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'avatar/bloc/profile_detail_avatar_bloc.dart';
import 'background_image/bloc/profile_detail_background_image_bloc.dart';
import 'birthday_form/bloc/birthday_form_bloc.dart';
import 'birthday_form/widget_birthday_form.dart';
import 'bloc/profile_detail_bloc.dart';
import 'bloc/profile_detail_event.dart';
import 'bloc/profile_detail_state.dart';
import 'email_form/bloc/email_form_bloc.dart';
import 'email_form/widget_email_form.dart';
import 'name_form/bloc/name_form_bloc.dart';
import 'name_form/widget_name_form.dart';

class ProfileDetailScreen extends StatefulWidget {
  @override
  _ProfileDetailScreenState createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen>
    with AutomaticKeepAliveClientMixin<ProfileDetailScreen> {
  PanelController _panelController = new PanelController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NameFormBloc(userRepository: userRepository),
        ),
        BlocProvider(
          create: (context) => PhoneFormBloc(userRepository: userRepository),
        ),
        BlocProvider(
          create: (context) => EmailFormBloc(userRepository: userRepository),
        ),
        BlocProvider(
          create: (context) =>
              BirthdayFormBloc(userRepository: userRepository),
        ),
        BlocProvider(
          create: (context) =>
              ProfileDetailAvatarBloc(userRepository: userRepository),
        ),
        BlocProvider(
          create: (context) => ProfileDetailBackgroundImageBloc(
              userRepository: userRepository),
        ),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(child: _buildContent(state)),
          ),
        );
      }),
    );
  }

  _buildContent(ProfileState state) {
    if (state is ProfileLoaded) {
      return Column(
        children: [
          _buildAppbar(),
          Expanded(
              child: SlidingUpPanel(
                controller: _panelController,
                body: _buildMenu(state),
                panel: _buildPanel(state),
                minHeight: 0,
                maxHeight: 250,
                backdropEnabled: true,
                renderPanelSheet: false,
//                color: Colors.red,
//            padding: EdgeInsets.all(10),
//            borderRadius: BorderRadius.only(
//                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ))
        ],
      );
    } else if (state is ProfileLoading) {
      return Center(
        child: WidgetCircleProgress(),
      );
    } else if (state is ProfileNotLoaded) {
      return Center(
        child: Text('${state.error}'),
      );
    } else {
      return Center(
        child: Text('Unknown state'),
      );
    }
  }

  Widget _buildAppbar() => WidgetProfileDetailAppbar();

  Widget _buildPanel(ProfileLoaded profileState) {
    return BlocBuilder<ProfileDetailBloc, ProfileDetailState>(
        builder: (context, state) {
          if (state is ProfileDetailFullnameFormOpened) {
            return WidgetNameForm(
              name: profileState.user.name,
              onCloseTap: () {
                _panelController.close();
                AppCommonUtils.disposeKeyboard();
              },
            );
          }
          if (state is ProfileDetailPhoneFormOpened) {
            return WidgetPhoneForm(
              phone: profileState.user.phoneNumber,
              onCloseTap: () {
                _panelController.close();
                AppCommonUtils.disposeKeyboard();
              },
            );
          }
          if (state is ProfileDetailEmailFormOpened) {
            return WidgetEmailForm(
              email: profileState.user.email,
              onCloseTap: () {
                _panelController.close();
                AppCommonUtils.disposeKeyboard();
              },
            );
          }
          if (state is ProfileDetailBirthdayFormOpened) {
            return WidgetBirthdayForm(
              birthDay: profileState.user.dateOfBirth,
              onCloseTap: () {
                _panelController.close();
              },
            );
          }
          return WidgetSpacer(
            height: 0,
          );
        });
  }

  Widget _buildMenu(ProfileLoaded state) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
        await Future.delayed(Duration(seconds: 3));
        return true;
      },
      color: AppColor.PRIMARY_COLOR,
//      backgroundColor: AppColor.PRIMARY_COLOR,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            WidgetProfileDetailImage(
              backgroundUrl: state.user.backgroundImage,
              avatarUrl: state.user.avatar,
            ),
            WidgetProfileDetailRow(
              title: AppLocalizations.of(context)
                  .translate('profile_detail.fullname'),
              content: state.user.name ??
                  AppLocalizations.of(context).translate('profile.no_setup'),
              onTap: () {
                _panelController.open();
                BlocProvider.of<ProfileDetailBloc>(context)
                    .add(OpenFullnameForm());
              },
            ),
            WidgetProfileDetailRow(
              title: AppLocalizations.of(context)
                  .translate('profile_detail.phone'),
              content: state.user.phoneNumber ??
                  AppLocalizations.of(context).translate('profile.no_setup'),
              onTap: () {
                _panelController.open();
                BlocProvider.of<ProfileDetailBloc>(context)
                    .add(OpenPhoneForm());
              },
            ),
            WidgetProfileDetailRow(
              title: AppLocalizations.of(context)
                  .translate('profile_detail.email'),
              content: state.user.email ??
                  AppLocalizations.of(context).translate('profile.no_setup'),
              onTap: () {
                _panelController.open();
                BlocProvider.of<ProfileDetailBloc>(context)
                    .add(OpenEmailForm());
              },
            ),
            WidgetProfileDetailRow(
              title: AppLocalizations.of(context)
                  .translate('profile_detail.birthday'),
              content: state.user.dateOfBirth ??
                  AppLocalizations.of(context).translate('profile.no_setup'),
              onTap: () {
                _panelController.open();
                BlocProvider.of<ProfileDetailBloc>(context)
                    .add(OpenBirthdayForm());
              },
            ),
            Container(
              height: 300,
              width: double.maxFinite,
              color: AppColor.PRIMARY_COLOR,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
