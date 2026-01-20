import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _singleton = AppColors._internal();

  factory AppColors() {
    return _singleton;
  }

  AppColors._internal();

  // Hàm để trong baseTheme phải truyền giá trị vào để phân biệt giao diện
  static Color accentColorTheme(bool isDark) =>
      isDark ? color : colorLightAccent;

  // Những biến sử dụng trong app phải đảm bảo màu cho 2 giao diện sáng/tối
  static bool _isDarkMode() => false;

  static Color textColor() => _isDarkMode() ? Colors.white : Colors.black;

  static Color errorText() => _isDarkMode() ? colorErrorText : Colors.redAccent;

  static Color hintTextColor() =>
      _isDarkMode() ? Colors.white54 : Colors.black54;

  static Color appBarColor() => _isDarkMode() ? color : colorLightAccent;

  static Color splashColor() => _isDarkMode() ? color : colorLightAccent;

  static Color dateTimeColor() =>
      _isDarkMode() ? colorDarkPrimary : const Color(0xFFf7f7f7);

  static Color cardBackgroundColor() =>
      _isDarkMode() ? colorDarkPrimary : Colors.white;

  static Color inputText() =>
      _isDarkMode() ? colorDarkPrimary : colorLightAccent;

  static Color bottomSheet() => _isDarkMode() ? colorButton : Colors.white;

  static Color iconHomeColor() => _isDarkMode() ? Colors.white54 : Colors.grey;

  // Theme mặc định
  static const Color colorLightAccent = Color(0xFFf5f5f5);

  static const Color colorWhite = Color(0xFFFFFFFF);
  static const Color colorSupport = Color(0xFFFBFBFC);
  static const Color colorPrimary3 = Color(0xFFF5F9FF);
  static const Color colorPrimary3Appbar = Color(0xFFDEEFFF);
  static const Color colorPrimary1 = Color(0xFF1F41BB);
  static const Color colorPrimary2 = Color(0xFF97CEF8);
  static const Color colorPrimary4 = Color(0xFFDEEFFF);
  static const Color colorSemantic3 = Color(0xFFFA1E1E);
  static const Color colorRedBackground = Color(0xFFFFF3F2);

  static const Color colorSemantic3Bland = Color(0xFFFFDEDE);
  static const Color colorSemantic2 = Color(0xFF51B867);
  static const Color colorSuccessContent = Color(0xFF43A047);
  static const Color colorSuccessBackground = Color(0xFFE8F5E9);
  static const Color colorErrorContent = Color(0xFFF44336);
  static const Color colorErrorBackground = Color(0xFFFFEBEE);
  static const Color colorSemantic2Bland = Color(0xFFF6FFF9);
  static const Color colorGrayDark = Color(0xFFABABAB);

  // Light Theme
  static const Color lightPrimaryColor = Color(0xff2567E8);
  static const Color lightPrimaryColor2 = Color(0xffF4F7FE);
  static const Color lightButtonDone = Color(0xff1FB007);
  static const Color colorDarkPrimary = Color(0xFF3e4161);
  static const Color color = Color(0xFF25273f);
  static const Color colorSearchBorder = Color(0xFFBDC9E2);
  static const Color colorSearch = Color(0xFFF0F5FF);
  static const Color colorLoading = Color(0xFF58a0ff);
  static const Color colorBackgroundLight = Color(0xFFf7f7f7);
  static const Color colorChipDisable = Color(0xFFefefef);
  static const Color colorOrange = Color(0xFFe2530c);
  static const Color colorOrangeShade = Color(0xFFfee0d6);
  static const Color colorLightSecond = Color(0xFFeb5624);
  static const Color colorHighlight = Colors.blue;
  static const Color colorRedDark = Color(0xFFD32F2F);
  static const Color colorPastelOrange = Color(0xFFFEF0E9);

  static const Color colorFill = Color(0xFFF5F7FA);
  static const Color colorBorder = Color(0xFFEDEDED);
  static const Color colorErrorTextLogin = Colors.white;
  static const Color colorCard = Color(0xFF414465);
  static const Color colorButton = Color(0xFF25273f);
  static const Color colorButton2 = Color(0x0ff3ffff);
  static const Color colorBackground = Color(0xFF333753);
  static const Color colorErrorText = Color(0xFFFFCB12);
  static const Color colorTextWhite = Colors.white;
  static const Color colorTextBlack = Color(0xFF1D2129);
  static const Color colorBackgroundWhite = Colors.white;
  static const Color colorGrey = Colors.grey;
  static const Color colorTextDefault = Color(0xFF111111);
  static const Color colorBlue = Colors.blue;
  static const Color colorBlueAccent = Colors.blueAccent;
  static const Color colorBackgroundShowCase = Colors.white30;
  static const Color colorError = Color(0xFFff5f6d);
  static const Color colorBlack26 = Color.fromARGB(66, 0, 0, 0);

  static const Color colorGreen = Colors.green;
  static const Color colorBlueX = Color(0xff36A4F8);
  static const Color colorInput = Color(0xFFF1F4FF);

  // static const Color colorGreenBorder = Color(0xff1FB007);
  static const Color colorGreenFainter = Color(0xff499ee8);
  static const Color colorNeutral2 = Color(0xff6D737A);
  static const Color colorNeutral1 = Color(0xff2B343C);

  // Detail document
  static const Color colorTitleOption = Color(0xFF172D58);
  static const Color colorTitleAppbar = Color(0xFF2B343C);
  static const Color colorBackgroundOption = Color(0xFFEAEEF6);
  static const Color colorBlueText = Color(0xFF2951A0);
  static const Color colorBlueTextTran = Color(0xDA2951A0);
  static const Color colorGreenText = Color(0xFF3DA000);
  static const Color colorGreen5 = Color(0x0C4BC500);
  static const Color colorComment = Color(0xFFACB1B6);
  static const Color colorIconDoc = Color(0xFF6D9FFF);
  static const Color colorBorderDoc = Color(0xFF708ABF);
  static const Color colorBorderRed = Color(0xFFFF2929);
  static const Color colorRed = Color(0xFFF04438);
  static const Color color4BC500 = Color(0x0C4BC500);
  static const Color color708ABF = Color(0xFF708ABF);
  static const Color colorFF2929 = Color(0x0CFF2929);
  static const Color redAccent = Colors.redAccent;
  static const Color colorBack = Colors.black;
  static const Color colorRedAccent = Colors.redAccent;
  static const Color white = Colors.white;
  static const Color black26 = Colors.black26;
  static const Color transparent = Colors.transparent;
  static const Color orangeDisable = Color(0xffffd9c7);
  static const Color basicSuccess = Color(0xFFF5FFEC);
  static const Color basicError = Color(0xFFFFF4EC);

  // static const Color adjustedColor = darkenColor(colorGreenText, 0.05);

  static const Color basicGrey40 = Color(0xFF939393);
  // Home
  static const Color colorsOrange = Color(0xFFFF6600);
  static const Color colorsTextHomeExpire = Color(0xFFF04438);
  static const Color colorsBackgroundHomeExpire = Color(0xFFFEF3F2);
  static const Color colorsBackgroundHomeActive = Color(0xFFEFF8FF);

  // Login
  static const Color colorHintText = Color(0xFF969B9F);
  static const Color colorBorderInput = Color(0xFF9BA3B1);
  static const Color colorForgotPassword = Color(0xFFF5844E);
  static const Color colorBorderSide = Color(0xFFD6DEED);
  static const Color colorBorderSide2 = Color(0xFFECF0F6);

  // PDF view
  static const Color colorGreyBody = Color(0xFFF5F7FA);
  static const Color colorGreyTransparent = Color(0x285A5A5A);

  // Basic Color, follow figma design
  static const Color colorBasicGrey = Color(0xFF6E7A8E);
  static const Color colorBasicGrey2 = Color(0xFF9BA3B1);
  static const Color colorBasicGrey3 = Color(0xFFE9EBEE);
  static const Color colorBasicBlack = Color(0xFF2A2B2A);
  static Color colorGreyOpacity = Colors.grey.withOpacity(0.3);
  static Color colorGreyOpacity35 = Colors.grey.withOpacity(0.35);

  //  Accent
  static const Color colorAccent1 = Color(0xFFF87036);
  static const Color colorAccent2 = Color(0xFFFFDCCD);

  static const Color colorTitleStep = Color(0xFFFF0000);
  // Neutral
  static const Color colorNeutral3 = Color(0xFF969B9F);
  static const Color colorNeutral4 = Color(0xFFACB1B6);
  static const Color colorNeutral5 = Color(0xFFF5F7FA);
  static const Color colorNeutral6 = Color(0xFFFFFFFF);

  static const Color colorTextInfoNFC = Color(0xFF1479C6);
  // static Color bgInviable = Colors.white.withOpacity(0.8);

  // Semantic
  static const Color colorSemantic1 = Color(0xFFFF9F55);

  static const List<Color> colorGradientGreen = [
    Color(0xff1FB007),
    Color(0xff1FB007),
  ];

  static const List<Color> listColorChart = [
    colorGreenText,
    colorBlueAccent,
    colorsOrange,
    // lightPrimaryColor,
    colorGrey,
    Color(0xFF6B4619),
    Color(0xFFC7732A),
    Color(0xFFFBB91A),
  ];
  static const List<Color> listColorStatusChart = [
    colorErrorText,
    colorLightlue,
    colorGreenText,
    color708ABF,
    Color(0xFF6B4619),
    Color(0xFFC7732A),
    Color(0xFFFBB91A),
  ];

  // Personal Signature view
  static const Color colorLightOrange = Color(0xFFFEF0E9);

  static const Color colorLightlue = Color(0xFF92DFEF);

  // Transparent color
  static const Color colorTransparent = Color(0x00000000);
}
