import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/presentation/menu/profile/bloc/profile_bloc.dart';
import 'package:flutter_app_cchat/presentation/menu/profile/bloc/profile_event.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/birthday_form_bloc.dart';
import 'bloc/birthday_form_event.dart';
import 'bloc/birthday_form_state.dart';

class WidgetBirthdayForm extends StatefulWidget {
  final String birthDay;
  final Function onCloseTap;

  const WidgetBirthdayForm(
      {Key key, @required this.onCloseTap, @required this.birthDay})
      : super(key: key);

  @override
  _WidgetBirthdayFormState createState() => _WidgetBirthdayFormState();
}

class _WidgetBirthdayFormState extends State<WidgetBirthdayForm> {
  BirthdayFormBloc _birthDayFormBloc;
  DateTime _dateTime;

  final underline = new UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.GREY,
    ),
  );

  @override
  void initState() {
    super.initState();
    _birthDayFormBloc = BlocProvider.of<BirthdayFormBloc>(context);
    if (widget.birthDay != null && widget.birthDay.isNotEmpty) {
      var dateArr = widget.birthDay.split('/');
      _dateTime = DateTime(
        int.parse(dateArr[2]),
        int.parse(dateArr[1]),
        int.parse(dateArr[0]),
      );
    } else {
      _dateTime = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BirthdayFormBloc, BirthdayFormState>(
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
      child: BlocBuilder<BirthdayFormBloc, BirthdayFormState>(
          builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(AppValue.APP_HORIZONTAL_PADDING),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppValue.APP_HORIZONTAL_PADDING),
                  topRight: Radius.circular(AppValue.APP_HORIZONTAL_PADDING))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)
                          .translate('profile_detail.birthday'),
                      style: AppStyle.DEFAULT_MEDIUM_BOLD,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onCloseTap,
                    child: Container(
                      width: 20,
                      height: 20,
                      child: Image.asset('assets/images/img_close_round.png'),
                    ),
                  )
                ],
              ),
              WidgetSpacer(
                height: 5,
              ),
              _buildTextFieldBirthday(),
              WidgetSpacer(
                height: 10,
              ),
              _buildButtonSubmit()
            ],
          ),
        );
      }),
    );
  }

  bool get isPopulated => true;

  bool isSubmitButtonEnabled() {
    return _birthDayFormBloc.state.isFormValid &&
        isPopulated &&
        !_birthDayFormBloc.state.isSubmitting;
  }

  _buildButtonSubmit() {
    return WidgetLoginButton(
      onTap: () {
        if (isSubmitButtonEnabled()) {
          print('${_dateTime.day}/${_dateTime.month}/${_dateTime.year}');
          var day =
              _dateTime.day >= 10 ? '${_dateTime.day}' : '0${_dateTime.day}';
          var month = _dateTime.month >= 10
              ? '${_dateTime.month}'
              : '0${_dateTime.month}';
          _birthDayFormBloc.add(BirthdayFormSubmitEvent(
              birthDay: '$day/$month/${_dateTime.year}'));
        }
      },
      isEnable: isSubmitButtonEnabled(),
      text: AppLocalizations.of(context).translate('profile_detail.update'),
    );
  }

  _buildTextFieldBirthday() {
    return Expanded(
      child: Container(
        child: CupertinoDatePicker(
            maximumDate: DateTime.now(),
            initialDateTime: _dateTime,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (dateTime) {
              _dateTime = dateTime;
            }),
      ),
    );
  }
}
