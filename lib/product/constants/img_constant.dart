import 'package:flutter/material.dart';

enum ImgLogoConstant {
  appLogo('logo');

  final String value;
  const ImgLogoConstant(this.value);

  String get toPng => "assets/logo/$value.png";
  Image get toImg => Image.asset(toPng);
}

enum ImgIMGConstant {
  appCloseImg('undraw_Location_search_re_ttoj'),
  appErrorImg('undraw_into_the_night_vumi'),

  appSliderImg1('undraw_To_do_list_re_9nt7'),
  appSliderImg2('undraw_Checking_boxes_re_9h8m'),
  appSliderImg3('undraw_Time_management_re_tk5w'),
  appSliderImg4('undraw_Messages_re_qy9x'),
  appSliderImg5('undraw_swipe_options_2e4v'),
  appSliderImg6('undraw_Reminder_re_fe15'),
  appSliderImg7('undraw_Online_calendar_re_wk3t'),

  appSliderEndImg(
      '3d-casual-life-notebook-with-sticky-notes-notepad-and-phone'),

  appRegisterImg('icons8-email-96'),
  appRegisterSucImg('icons8-check-96'),

  appPasswordImg('icons8-email-96'),
  appPasswordTrueImg('emailtrue'),

  appLoginUserNotImg('notuser'),
  appLoginErrPassImg('icons8-password-96'),
  appLoginTooManyRequestImg('icons8-banned-120'),
  appLoginEmailNotVerified('icons8-verified-96');

  final String value;
  const ImgIMGConstant(this.value);

  String get toPng => "assets/images/app_start_img/$value.png";
  Image get toImg => Image.asset(toPng);

  String get toPng2 => "assets/images/app_slider/$value.png";
  Image get toImg2 => Image.asset(toPng2);

  String get toPng3 => "assets/icon/log_reg_pas_ico/register_icon/$value.png";
  Image get toImg3 => Image.asset(toPng3);

  String get toPng4 => "assets/icon/log_reg_pas_ico/password_icon/$value.png";
  Image get toImg4 => Image.asset(toPng4);

  String get toPng5 => "assets/icon/log_reg_pas_ico/login_icon/$value.png";
  Image get toImg5 => Image.asset(toPng5);
}