// Flutter imports:
import 'package:flutter/material.dart';
import 'package:trinity/utils/r.dart';

// Project imports:
// import 'package:employee_forums/resources/r.dart';
import 'colors.dart';

class ResourceStyles {
  final colors = ResourceColors();

  TextStyle get formHeader =>
      TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xFF5F5F5F));
  TextStyle get fontMosse => TextStyle(fontFamily: 'Mosse', color: colors.black);
  TextStyle get fontNunito => TextStyle(fontFamily: 'Nunito', color: colors.black);
  TextStyle get fontPoppins => TextStyle(fontFamily: 'Poppins', color: colors.black);
  TextStyle get fontLato => TextStyle(fontFamily: 'Lato', color: colors.black);

  final TextStyle fontColorWhite = TextStyle(color: Colors.white);
  TextStyle get fontColorPrimary => TextStyle(color: colors.primaryColor);
  TextStyle get fontColorSecondary => TextStyle(color: colors.secondaryColor);
  TextStyle get fontColorTertiary => TextStyle(color: colors.tertiaryColor);

  TextStyle get fontColorWebBlue => TextStyle(color: colors.webBlue);
  TextStyle get fontColorBrightBlue => TextStyle(color: colors.brightBlue);
  TextStyle get fontColorVibrantBlue => TextStyle(color: colors.vibrantBlue);

  TextStyle get fontColorGreen => TextStyle(color: colors.green);

  TextStyle get fontColorDarkGrey => TextStyle(color: colors.darkGrey);
  TextStyle get fontColorAshGrey => TextStyle(color: colors.ashGrey);
  TextStyle get fontColorMidGrey => TextStyle(color: colors.midGrey);
  TextStyle get fontColorLightGrey => TextStyle(color: colors.lightGrey);
  TextStyle get fontColorBlack => TextStyle(color: colors.black);

  TextStyle get fontColorRed => TextStyle(color: colors.red);
  TextStyle get darkfontColorBlack => TextStyle(color: R.darkColors.blackshade50);
  TextStyle get darkfontColorGrey => TextStyle(color: R.darkColors.tertiary500);
  TextStyle get fontColorChatGrey => TextStyle(color: R.colors.chatGrey);
// R.darkColors.blackshade50
  final TextStyle fz10 = TextStyle(fontSize: 10);
  final TextStyle fz12 = TextStyle(fontSize: 12);
  final TextStyle fz13 = TextStyle(fontSize: 13);
  final TextStyle fz14 = TextStyle(fontSize: 14);
  final TextStyle fz15 = TextStyle(fontSize: 15);
  final TextStyle fz16 = TextStyle(fontSize: 16);
  final TextStyle fz18 = TextStyle(fontSize: 18);
  final TextStyle fz20 = TextStyle(fontSize: 20);
  final TextStyle fz22 = TextStyle(fontSize: 22);
  final TextStyle fz24 = TextStyle(fontSize: 24);

  TextStyle get fz10FontColorDarkGrey => fz10.merge(fontColorDarkGrey);
  TextStyle get fz10FontColorWebBlue => fz10.merge(fontColorWebBlue);

  TextStyle get fz12FontColorPrimary => fz12.merge(fontColorPrimary);
  TextStyle get fz12FontColorSecondary => fz12.merge(fontColorSecondary);
  TextStyle get fz12FontColorTertiary => fz12.merge(fontColorTertiary);
  TextStyle get fz12FontColorDarkGrey => fz12.merge(fontColorDarkGrey);
  TextStyle get fz12FontColorMidGrey => fz12.merge(fontColorMidGrey);
  TextStyle get fz12FontColorAshGrey => fz12.merge(fontColorAshGrey);
  TextStyle get fz12FontColorBlack => fz12.merge(fontColorBlack);
  TextStyle get fz12FontColorWebBlue => fz12.merge(fontColorWebBlue);
  TextStyle get fz12FontColorBrightBlue => fz12.merge(fontColorBrightBlue);
  TextStyle get fz12FontColorRed => fz12.merge(fontColorRed);
  TextStyle get fz12FontdarkColorblack => fz12.merge(darkfontColorBlack);

  TextStyle get fz13FontColorDarkGrey => fz13.merge(fontColorDarkGrey);

  TextStyle get fz14FontColorPrimary => fz14.merge(fontColorPrimary);
  TextStyle get fz14FontColorSecondary => fz14.merge(fontColorSecondary);
  TextStyle get fz14FontColorTertiary => fz14.merge(fontColorTertiary);
  TextStyle get fz14FontColorDarkGrey => fz14.merge(fontColorDarkGrey);
  TextStyle get fz14FontColorAshGrey => fz14.merge(fontColorAshGrey);
  TextStyle get fz14FontColorMidGrey => fz14.merge(fontColorMidGrey);
  TextStyle get fz14FontColorLightGrey => fz14.merge(fontColorLightGrey);
  TextStyle get fz14FontColorBlack => fz14.merge(fontColorBlack);
  TextStyle get fz14DarkFontColorBlack => fz14.merge(darkfontColorBlack);
  TextStyle get fz14FontColorWebBlue => fz14.merge(fontColorWebBlue);
  TextStyle get fz14FontColorWhite => fz14.merge(fontColorWhite);
  TextStyle get fz14FontColorRed => fz14.merge(fontColorRed);
  TextStyle get fz14FontdarkColorblack => fz14.merge(darkfontColorBlack);
  TextStyle get fz14FontdarkColorGrey => fz14.merge(darkfontColorGrey);

  TextStyle get fz15FontColorDarkGrey => fz15.merge(fontColorDarkGrey);
  TextStyle get fz15FontColorLightGrey => fz15.merge(fontColorLightGrey);

  TextStyle get fz16FontColorPrimary => fz16.merge(fontColorPrimary);
  TextStyle get fz16FontColorSecondary => fz16.merge(fontColorSecondary);
  TextStyle get fz16FontColorTertiary => fz16.merge(fontColorTertiary);
  TextStyle get fz16FontColorDarkGrey => fz16.merge(fontColorDarkGrey);
  TextStyle get fz16FontColorAshGrey => fz16.merge(fontColorAshGrey);
  TextStyle get fz16FontColorBlack => fz16.merge(fontColorBlack);
  TextStyle get fz16FontColorWebBlue => fz16.merge(fontColorWebBlue);
  TextStyle get fz16FontColorBrightBlue => fz16.merge(fontColorBrightBlue);
  TextStyle get fz16FontColorVibrantBlue => fz16.merge(fontColorVibrantBlue);
  TextStyle get fz16FontColorRed => fz16.merge(fontColorRed);
  TextStyle get fz16FontdarkColorblack => fz16.merge(darkfontColorBlack);

  TextStyle get fz18FontColorPrimary => fz18.merge(fontColorPrimary);
  TextStyle get fz18FontColorSecondary => fz18.merge(fontColorSecondary);
  TextStyle get fz18FontColorDarkGrey => fz18.merge(fontColorDarkGrey);
  TextStyle get fz18FontColorBlack => fz18.merge(fontColorBlack);
  TextStyle get fz18FontColorWhite => fz18.merge(fontColorWhite);
  TextStyle get fz18FontColorWebBlue => fz18.merge(fontColorWebBlue);
  TextStyle get fz18FontColorVibrantBlue => fz18.merge(fontColorVibrantBlue);
  TextStyle get fz18FontdarkColorblack => fz18.merge(darkfontColorBlack);

  TextStyle fw300 = TextStyle(fontWeight: FontWeight.w300);
  TextStyle fw400 = TextStyle(fontWeight: FontWeight.w400);
  TextStyle fw500 = TextStyle(fontWeight: FontWeight.w500);
  TextStyle fw600 = TextStyle(fontWeight: FontWeight.w600);
  TextStyle fw700 = TextStyle(fontWeight: FontWeight.w700);

  TextStyle get fz12Fw400 => fz12.merge(fw400);
  TextStyle get fz10Fw500 => fz10.merge(fw500);
  TextStyle get fz12Fw500 => fz12.merge(fw500);
  TextStyle get fz12Fw600 => fz12.merge(fw600);
  TextStyle get fz13Fw500 => fz13.merge(fw500);
  TextStyle get fz14Fw300 => fz14.merge(fw300);
  TextStyle get fz14Fw500 => fz14.merge(fw500);
  TextStyle get fz14Fw600 => fz14.merge(fw600);
  TextStyle get fz14Fw700 => fz14.merge(fw700);
  TextStyle get fz15Fw500 => fz15.merge(fw500);
  TextStyle get fz16Fw500 => fz16.merge(fw500);
  TextStyle get fz16Fw700 => fz16.merge(fw700);
  TextStyle get fz18Fw500 => fz18.merge(fw500);
  TextStyle get fz18Fw700 => fz18.merge(fw700);
  TextStyle get fz20Fw500 => fz20.merge(fw500);
  TextStyle get fz20Fw700 => fz20.merge(fw700);
  TextStyle get fz24Fw500 => fz24.merge(fw500);
  TextStyle get fz24Fw700 => fz24.merge(fw700);
  TextStyle get fz15Fw600 => fz15.merge(fw600);
  TextStyle get fz15Fw700 => fz15.merge(fw700);

  TextStyle get fz10Fw500FontColorRed => fz10Fw500.merge(fontColorRed);
  TextStyle get fz10Fw500FontColorBlack => fz10Fw500.merge(fontColorBlack);
  TextStyle get fz10Fw500FontColorWebBlue => fz10Fw500.merge(fontColorWebBlue);
  TextStyle get fz10Fw500FontColorWhite => fz10Fw500.merge(fontColorWhite);
  TextStyle get fz10Fw500FontColorDarkGrey => fz10Fw500.merge(fontColorDarkGrey);

  TextStyle get fz12Fw500FontColorWhite => fz12Fw500.merge(fontColorWhite);
  TextStyle get fz12Fw500FontColorWebBlue => fz12Fw500.merge(fontColorWebBlue);
  TextStyle get fz12Fw500FontColorDarkGrey => fz12Fw500.merge(fontColorDarkGrey);
  TextStyle get fz12Fw500FontColorBlack => fz12Fw500.merge(fontColorBlack);
  TextStyle get fz12Fw500FontdarkColorBlack => fz12Fw500.merge(darkfontColorBlack);

  TextStyle get fz12Fw600FontColorWebBlue => fz12Fw600.merge(fontColorWebBlue);
  TextStyle get fz12Fw600FontColorBlack => fz12Fw600.merge(fontColorBlack);
  TextStyle get fz12Fw600FontColorDarkGrey => fz12Fw600.merge(fontColorDarkGrey);
  TextStyle get fz12Fw600FontColorLightGrey => fz12Fw600.merge(fontColorLightGrey);
  TextStyle get fz12Fw600FontdarkColorBlack => fz12Fw600.merge(darkfontColorBlack);

  TextStyle get fz13Fw500FontColorBlack => fz13Fw500.merge(fontColorBlack);

  TextStyle get fz14Fw300FontColorBlack => fz14Fw300.merge(fontColorBlack);
  TextStyle get fz14Fw300FontdarkColorBlack => fz14Fw300.merge(darkfontColorBlack);

  TextStyle get fz14Fw500FontColorWhite => fz14Fw500.merge(fontColorWhite);
  TextStyle get fz14Fw500FontColorWebBlue => fz14Fw500.merge(fontColorWebBlue);
  TextStyle get fz14Fw500FontColorDarkGrey => fz14Fw500.merge(fontColorDarkGrey);
  TextStyle get fz14Fw500FontColorBlack => fz14Fw500.merge(fontColorBlack);
  TextStyle get fz14Fw500FontdarkColorBlack => fz14Fw500.merge(darkfontColorBlack);

  TextStyle get fz14Fw600FontColorDarkGrey => fz14Fw600.merge(fontColorDarkGrey);
  TextStyle get fz14Fw600FontColorBlack => fz14Fw600.merge(fontColorBlack);
  TextStyle get fz14Fw600FontColorWebBlue => fz14Fw600.merge(fontColorWebBlue);
  TextStyle get fz14Fw600FontdarkColorBlack => fz14Fw600.merge(darkfontColorBlack);

  TextStyle get fz14Fw700FontColorDarkGrey => fz14Fw700.merge(fontColorDarkGrey);
  TextStyle get fz14Fw700FontColorBlack => fz14Fw700.merge(fontColorBlack);
  TextStyle get fz14Fw700FontdarkColorBlack => fz14Fw700.merge(darkfontColorBlack);

  TextStyle get fz16Fw500FontColorBlack => fz16Fw500.merge(fontColorBlack);
  TextStyle get fz16Fw500FontColorWhite => fz16Fw500.merge(fontColorWhite);
  TextStyle get fz16Fw500FontColorDarkGrey => fz16Fw500.merge(fontColorDarkGrey);
  TextStyle get fz16Fw500FontColorRed => fz16Fw500.merge(fontColorRed);
  TextStyle get fz16Fw500FontdarkColorBlack => fz16Fw500.merge(darkfontColorBlack);

  TextStyle get fz18Fw500FontColorDarkGrey => fz18Fw500.merge(fontColorDarkGrey);

  BoxDecoration get containerShadow => BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey.shade200,
            offset: Offset(0, 2),
          )
        ],
      );

  InputBorder get enabledBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: colors.grey,
          width: 1.0,
        ),
      );

  InputBorder get focusedBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: colors.webBlue,
          width: 1.0,
        ),
      );

  InputBorder get noBorder => OutlineInputBorder(
        borderSide: BorderSide.none,
      );

  ShapeBorder get bottomSheetShape => RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      );

  ButtonStyle get roundedPrimaryButtonStyle => ElevatedButton.styleFrom(
        primary: colors.secondaryColor,
        textStyle: fz14.merge(fw700),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colors.secondaryColor,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      );

  ButtonStyle get roundedSecondaryButtonStyle => ElevatedButton.styleFrom(
        textStyle: fz14.merge(fw700),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      );

  ButtonStyle get roundedOutlinedButtonStyle => ElevatedButton.styleFrom(
        textStyle: fz14FontColorPrimary.merge(fw700),
        primary: colors.tertiaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colors.secondaryColor,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      );
}
