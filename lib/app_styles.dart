import 'package:flutter/cupertino.dart';
import 'package:onboarding_ui/size_configs.dart';

const Color kPurpleColor = Color(0xff5041ff);
const Color kYellowColor = Color(0xffffB41c);
const Color kDarkWhiteColor = Color(0xffebedf1);
const Color kBlackColor = Color(0xff172B4d);
const Color kLightBlackColor = Color(0xff434f65);

final kTitleOnboarding = TextStyle(
  fontSize: SizeConfig.blockSizeHorizontal! * 7,
  color: kBlackColor,
  fontWeight: FontWeight.bold,
);

final kSubtitleOnboarding = TextStyle(
    fontSize: SizeConfig.blockSizeHorizontal! * 4,
    color: kLightBlackColor,
    overflow: TextOverflow.ellipsis);

final kTextButton = TextStyle(
  color: kPurpleColor,
  fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
  fontWeight: FontWeight.bold,
);
