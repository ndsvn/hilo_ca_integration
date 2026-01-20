import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// [isDarkMode] hiện tại để 2 Theme dark và light
ThemeData getThemeByAppTheme([bool isDarkMode = true]) {
  ThemeData base = isDarkMode ? ThemeData.dark() : ThemeData.light();
  IconThemeData buildIconTheme() {
    Color iconColor = isDarkMode ? Colors.white : Colors.black;

    return IconThemeData(
      color: iconColor,
      size: 20.0,
    );
  }

  AppBarThemeData buildAppBarTheme() {
    return base.appBarTheme.copyWith(
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.appBarColor(),
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      color: AppColors.accentColorTheme(isDarkMode),
      iconTheme: buildIconTheme(),
    );
  }

  TextTheme basicTextTheme() {
    final TextTheme textTheme = base.textTheme;

    Color textColor = isDarkMode ? Colors.white : Colors.black87;
    Color subTextColor = isDarkMode ? Colors.white54 : Colors.black54;
    return TextTheme(
      // headline
      displayMedium: textTheme.displayMedium!.copyWith(
          fontSize: 36, fontWeight: FontWeight.bold, color: textColor),
      displaySmall: textTheme.displaySmall!.copyWith(
          fontSize: 32, fontWeight: FontWeight.bold, color: textColor),
      headlineMedium: textTheme.headlineMedium!.copyWith(
          fontSize: 26, fontWeight: FontWeight.bold, color: textColor),
      headlineSmall: textTheme.headlineSmall!.copyWith(
          fontSize: 24, fontWeight: FontWeight.bold, color: textColor),
      titleLarge:
          textTheme.headlineSmall!.copyWith(fontSize: 22, color: textColor),
      titleMedium:
          textTheme.titleMedium!.copyWith(fontSize: 20, color: textColor),
      // subtitle
      titleSmall: TextStyle(fontSize: 14, color: textColor),
      bodyLarge:
          textTheme.bodyLarge!.copyWith(fontSize: 12, color: subTextColor),
      // body
      bodyMedium:
          textTheme.bodyMedium!.copyWith(fontSize: 16, color: textColor),
      bodySmall:
          textTheme.bodySmall!.copyWith(fontSize: 14, color: subTextColor),
      // caption - chú thích trong app
      labelLarge:
          textTheme.labelLarge!.copyWith(fontSize: 12, color: textColor),
      // button
      labelSmall:
          textTheme.labelSmall!.copyWith(fontSize: 14, color: textColor),
    ).apply(
      fontFamily: 'SanFranciscoDisplay',
    );
  }

  return base.copyWith(
      // themes
      textTheme: basicTextTheme(),
      iconTheme: buildIconTheme(),
      appBarTheme: buildAppBarTheme(),
      brightness: isDarkMode ? Brightness.light : Brightness.dark,
      bottomAppBarTheme: _buildBottomAppBarTheme(base),
      bottomSheetTheme: _buildBottomSheetTheme(base),
      tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: isDarkMode ? AppColors.color : Colors.white60,
        unselectedLabelColor: AppColors.colorDarkPrimary,
      ),
      buttonTheme: _buildButtonTheme(base),
      cardTheme: _buildCardTheme(base, isDarkMode: isDarkMode),
      dialogTheme: _buildDialogTheme(base),
      popupMenuTheme: PopupMenuThemeData(
        color: AppColors.colorWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius20),
        ),
      ),

      // colors
      primaryColor: isDarkMode ? AppColors.colorPrimary3 : Colors.pink[50],
      indicatorColor: Colors.grey,
      textButtonTheme: _textButtonThemeData(base),
      scaffoldBackgroundColor: AppColors.colorPrimary3,
      cardColor: isDarkMode ? AppColors.colorCard : Colors.pink[50],
      secondaryHeaderColor: isDarkMode ? AppColors.colorButton2 : Colors.grey,

      // ignore: deprecated_member_use
      // scaffoldBackgroundColor:
      //     isDarkMode ? AppColors.colorPrimary3 : AppColors.colorPrimary3,
      dialogBackgroundColor: AppColors.colorDarkPrimary);
}

ButtonThemeData _buildButtonTheme(ThemeData base) {
  return base.buttonTheme.copyWith(
      height: 50,
      minWidth: 5,
      // Them vao de context menu copy, paste tren Samsung khong bi soc vang
      buttonColor: AppColors.colorButton,
      textTheme: ButtonTextTheme.accent,
      colorScheme: base.colorScheme
          .copyWith(primary: Colors.white, secondary: Colors.white),
      // ignore: prefer_const_constructors
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ));
}

TextButtonThemeData _textButtonThemeData(ThemeData base) {
  return TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all(base.textTheme.titleMedium),
      overlayColor: WidgetStateProperty.all(Colors.white38),
    ),
  );
}

BottomAppBarThemeData _buildBottomAppBarTheme(ThemeData base) {
  return base.bottomAppBarTheme.copyWith(color: Colors.white);
}

BottomSheetThemeData _buildBottomSheetTheme(ThemeData base) {
  return base.bottomSheetTheme.copyWith(
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
  );
}

CardThemeData _buildCardTheme(ThemeData base, {bool isDarkMode = true}) {
  return base.cardTheme.copyWith(
      color: isDarkMode ? AppColors.colorDarkPrimary : Colors.grey[50],
      elevation: 0.0);
}

DialogThemeData _buildDialogTheme(ThemeData base) {
  return base.dialogTheme
      .copyWith(backgroundColor: AppColors.cardBackgroundColor());
}
