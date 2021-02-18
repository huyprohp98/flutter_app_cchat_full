import 'package:flutter_app_cchat/app/auth_bloc/bloc.dart';
import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/presentation/menu/profile/widget_profile_appbar.dart';
import 'package:flutter_app_cchat/presentation/menu/profile/widget_profile_infor.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import 'bloc/profile_bloc.dart';
import 'bloc/profile_event.dart';
import 'bloc/profile_state.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
  }

  var logger = Logger(
    printer: PrettyPrinter(),
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) async {
        if (state is ProfileNotLoaded) {
          await HttpHandler.resolve(status: state.error);
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
                color: AppColor.PRIMARY_COLOR,
                child: _buildContent(state)),
          ),
        );
      }),
    );
  }

  _buildContent(ProfileState state) {
    if (state is ProfileLoaded) {
      return Column(
        children: [_buildAppbar(), _buildMenu(state)],
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

  Widget _buildAppbar() => WidgetProfileAppbar();

  Widget _buildMenu(ProfileLoaded state) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
          await Future.delayed(Duration(seconds: 3));
          return true;
        },
        color: AppColor.PRIMARY_COLOR,
        backgroundColor: AppColor.THIRD_COLOR,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(21.0),
            child: Column(
              children: [
                WidgetProfileInfor(
                  name: state.user.name ??
                      AppLocalizations.of(context).translate('profile.no_name'),
                  phone: state.user.phoneNumber ??
                      AppLocalizations.of(context)
                          .translate('profile.no_setup'),
                  avatar: WidgetCachedImage(
                    url: state.user.avatar,
                  ),
                  onTap: () {
                    // AppNavigator.navigateProfileDetail();
                  },
                ),
                WidgetProfileMenu(
                  text: AppLocalizations.of(context).translate('profile.point'),
                  image: Image.asset('assets/images/img_point.png'),
                  // endText: state.user.point!=null?state.user.point.toString():'',
                  // onTap: () {
                  //   AppNavigator.navigatePoint();
                  // },
                ),
                WidgetProfileMenu(
                  text: AppLocalizations.of(context).translate('profile.rank'),
                  image: Image.asset('assets/images/img_rank.png'),
                  onTap: () {
                    // AppNavigator.navigateRank();
                  },
                ),
                WidgetProfileMenu(
                  text: AppLocalizations.of(context)
                      .translate('profile.order_history'),
                  image: Image.asset('assets/images/img_order_history.png'),
                  onTap: () {
                    // AppNavigator.navigateOrderHistory();
                  },
                ),
                WidgetProfileMenu(
                  text: AppLocalizations.of(context)
                      .translate('profile.address_book'),
                  image: Image.asset('assets/images/img_address_book.png'),
                  onTap: () {
                    // AppNavigator.navigateAddress();
                  },
                ),
                WidgetProfileMenu(
                  text:
                      AppLocalizations.of(context).translate('profile.voucher'),
                  image: Image.asset('assets/images/img_voucher.png'),
                  onTap: () {
                    // AppNavigator.navigateVoucher();
                  },
                ),
                WidgetProfileMenu(
                  text: AppLocalizations.of(context)
                      .translate('profile.favourite'),
                  image: Image.asset('assets/images/img_favourite.png'),
                  onTap: () {
                    // AppNavigator.navigateProductCollection(ProductCollectionType.FAVORITE);
                  },
                ),
                WidgetProfileMenu(
                  text: AppLocalizations.of(context)
                      .translate('profile.stylish_advice'),
                  image: Image.asset('assets/images/img_stylish_advice.png'),
                  onTap: () {
                    // AppNavigator.navigateStyleAdvice();
                  },
                ),
                WidgetProfileMenu(
                  text: AppLocalizations.of(context)
                      .translate('profile.size_advice'),
                  image: Image.asset('assets/images/img_size_advice.png'),
                  onTap: () {
                    // AppNavigator.navigateSizeAdvice();
                  },
                ),
                WidgetProfileMenu(
                  text:
                      AppLocalizations.of(context).translate('profile.contact'),
                  image: Image.asset('assets/images/img_contact.png'),
                  onTap: () {
                    // AppNavigator.navigateContact();
                  },
                ),
                WidgetProfileMenu(
                  text: AppLocalizations.of(context)
                      .translate('profile.question'),
                  image: Image.asset('assets/images/img_question.png'),
                  onTap: () {
                    // AppNavigator.navigateQuestion();
                  },
                ),
                WidgetProfileMenu(
                  text: AppLocalizations.of(context)
                      .translate('profile.term_and_policy'),
                  image: Image.asset('assets/images/img_term_and_policy.png'),
                  onTap: () {
                    // AppNavigator.navigateTerm();
                  },
                ),
                WidgetProfileMenu(
                  text: AppLocalizations.of(context)
                      .translate('profile.change_password'),
                  image: Image.asset('assets/images/img_change_password.png'),
                  onTap: () {
                    // AppNavigator.navigateChangePassword();
                  },
                ),
                WidgetProfileMenu(
                  text:
                      AppLocalizations.of(context).translate('profile.logout'),
                  image: Image.asset('assets/images/img_logout.png'),
                  onTap: () async {
                    var result = await ConfirmDialog.show(context, AppLocalizations.of(context).translate('profile.logout.confirm'), ok: 'OK', cancel: 'Huỷ');
                    if (result==true) {
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(LoggedOut());
                    }
                  },
                ),
                WidgetSpacer(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
