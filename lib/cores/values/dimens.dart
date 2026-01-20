import 'package:ecert/shares/shares_src.dart';
import 'package:get/get.dart';

// Tỉ lệ chiều cao so với màn hình thiết kế
double ratioHeight = Get.height / AppDimens.heightDesign;
// Tỉ lệ chiều ngang so với màn hình thiết kế
double ratioWidth = Get.width / AppDimens.widthDesign;

class AppDimens {
  /// Giá trị px màn hình Mobile design trên figma
  static const int heightDesign = 917;
  static const int widthDesign = 412;

  /// Padding
  static const double defaultPadding = 16.0;
  static const double padding14 = 14.0;
  static const double paddingSmallest = 4.0;
  static const double paddingVerySmall = 8.0;
  static const double paddingSmaller = 10.0;
  static const double paddingSmall = 12.0;
  static const double paddingHuge = 32.0;
  static const double paddingSizeAppBar = 60.0;
  static const double paddingTitleAndTextForm = 3.0;
  static const double paddingSize5 = 5.0;
  static const double paddingSize3 = 3.0;
  static const double paddingTabBar = 5.0;
  static const double paddingTextHis = 22.2;
  static const double size45 = 45;
  static const double size35 = 35;
  static const double size68 = 68;

  static const double paddingMedium = 20.0;
  static const double paddingMediumMax = 25.0;
  static const double sizeBottomNavi = 70.0;
  static const double sizeBottomNaviMax = 76.0;
  static const double sizeBorderNavi = 30.0;
  static const double paddingSmallBottomNavigation = 6.0;
  static const double paddingBottomTabBar = 18.0;
  static const double sizeBottomNavi80 = 80.0;

  /// Button size
  static const double btnSmall = 20;
  static const double btnMediumTb = 40;
  static const double btnMediumMax = 44;
  static const double btnMedium = 50;
  static const double btnMediumMaz = 55;
  static const int btnMediumFont = 50;

  /// Text size
  static const double sizeTextSmallest = 10;
  static const double sizeTextSmaller = 12;
  static const double sizeTextSmall = 15;
  static const double sizeText14 = 14;
  static const double sizeTextMediumTb = 16;
  static const double sizeTextMedium = 18;
  static const double sizeTextLarge = 20;
  static const double sizeTextSupperLarge = 28;
  static const double sizeTextAvatar = 30;
  static const double padding78 = 78;

  /// Icon size
  static const double sizeAvatar = 70.0;

  static const double iconVerySmall = 24;
  static const double iconSmall = 28;
  static const double iconMedium = 32;
  static const double iconLarge = 36;
  static const double iconLoginWidth = 77;
  static const double iconLogoWidth = 190;

  static const double radiusVerySmall = 4;
  static const double radiusSmall = 5;
  static const double radiusMedium = 8;
  static const double radiusBig = 22;
  static const double radiusLarge = 15;
  static const double radiusMin = 1;
  static const double radiusMinSize = 2;
  static const List<double> dashPattern = [4, 2];

  static const double sizeMin = 2;
  static const double sizeOptionWidth = 115;
  static const double sizeTextMax = 17;
  static const double sizeItemWidth = 128;
  static const double sizeLogoSign = 11;

  static const double sizeButtonView = 91;
  static const double iconLogoHeight = 42;
  static const double iconHeightButton = 38;
  static double iconElectronic = Get.width * 0.9;
  static double iconHeight = iconElectronic / 1.9;
  static const double size100 = 100;
  static const double size120 = 120;
  static const double size330 = 330;
  static const double size200 = 200;
  static const double size250 = 240;
  static const double size245 = 245;
  static const double size163 = 163;
  static const double sizeDialogNotiIcon = 40;
  static const double size20 = 20;
  static const double size30 = 30;

  /// Border radius
  static const double radius5 = 5;
  static const double radius8 = 8;
  static const double radius10 = 10.0;
  static const double radius12 = 12.0;
  static const double radius20 = 20.0;
  static const double radius100 = 100;

  /// Widget size
  static const double widthSizeBox = 3;
  static const int size3 = 3;
  static const double size3D = 3;
  static const double size4 = 4.0;
  static const int size2 = 2;
  static const int size5 = 5;
  static const double sizeDocHistoryCircle = 16;
  static const double sizeBlur = 1;
  static const double heightBottomSheet = 180;
  static const double heightBottomSheetSmall = 140;
  static const double heightBottomTabBar = 80;
  static const double heightBottomTabBarAndroid = 75;
  static const double sizeCustomIndicator = 50.0;
  static const double sizeImage = 50;
  static const double sizeImageBig = 100;
  static const double sizeInput = 64;

  /// Max line
  static const int lengthMin = 2;

  static double fontBig() => 18.divSF;

  static double fontSmall() => 14.divSF;

  static double fontMedium() => 16.divSF;
}

extension GetSizeScreen on num {
  /// Tỉ lệ fontSize của các textStyle
  double get divSF {
    return this / Get.textScaleFactor;
  }

  // Tăng chiều dài theo font size
  double get mulSF {
    return this * Get.textScaleFactor;
  }
}
