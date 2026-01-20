import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecert/base_utils/controllers_base/base/base_controller.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class UtilWidget {
  static DateTime? _dateTime;
  static int _oldFunc = 0;

  static Widget buildLoading({Color? colorIcon}) => CupertinoActivityIndicator(
        color: colorIcon ?? AppColors.colorBlueX,
      );

  /// Loading cho child
  static Widget baseShowLoadingChild({
    required WidgetCallback child,
    required bool isShowLoading,
    Color? colorIcon,
  }) {
    return isShowLoading ? Center(child: buildLoading()) : child();
  }

  static Future<void> funcOpenBottomSheet(Widget child) async {
    Get.bottomSheet(baseBottomSheet(
      title: "",
      body: child,
      noHeader: true,
    ));
  }

  /// Loading cho child
  static Widget baseShowLoadingChildSize({
    required WidgetCallback child,
    required bool isShowLoading,
    Color? colorIcon,
    required double width,
    required double height,
  }) {
    return isShowLoading
        ? SizedBox(
            width: width,
            height: height,
            child: Center(
              child: buildLoading(colorIcon: colorIcon),
            ),
          )
        : child();
  }

  static Widget baseBorder({
    required Widget child,
    Color? colorBorder,
    Color? colorBox,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      // height: height ?? AppDimens.btnMediumMax,
      margin: margin ??
          const EdgeInsets.symmetric(
            vertical: AppDimens.defaultPadding,
          ),
      decoration: BoxDecoration(
          color: colorBox ?? AppColors.colorWhite,
          borderRadius:
              const BorderRadius.all(Radius.circular(AppDimens.paddingMedium)),
          border:
              Border.all(color: colorBorder ?? AppColors.colorBlueX, width: 1)),
      child: child,
    );
  }

  /// Icon trống của app
  static Widget baseEmpty({String? icon, String? textEmpty}) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
              icon ?? Assets.ASSETS_IMAGES_ICON_ICON_SVG_IC_EMPTY_SVG),
          sizedBox5,
          TextUtils(
            text: textEmpty ?? LocaleKeys.eCert_utils_empty.tr,
            availableStyle: StyleEnum.titleSmall,
            color: AppColors.colorBorderInput,
          )
        ],
      ),
    );
  }

  static Widget buildShimmerLoading() {
    const padding = AppDimens.defaultPadding;
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: ListView.separated(
                itemBuilder: (context, index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 24.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    sizedBox10,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 16.0,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Container(
                            height: 16.0,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBox10,
                  ],
                ),
                separatorBuilder: (context, index) => const Divider(
                  height: 15,
                ),
                itemCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // SizedBox dọc
  static const Widget sizedBox3 = SizedBox(height: 3);
  static const Widget sizedBox5 = SizedBox(height: 5);
  static const Widget sizedBox4 = SizedBox(height: 4);
  static const Widget sizedBox7 = SizedBox(height: 7);
  static const Widget sizedBox10 = SizedBox(height: 10);
  static const Widget sizedBox15 = SizedBox(height: 15);
  static const Widget sizedBox20 = SizedBox(height: 20);
  static const Widget sizedBox32 = SizedBox(height: 32);
  static const Widget sizedBox25 = SizedBox(height: 25);
  static const Widget sizedBox45 = SizedBox(height: 45);
  static const Widget sizedBox50 = SizedBox(height: 50);

  // SizedBox ngang
  static const Widget sizedBoxWidth3 = SizedBox(width: 3);
  static const Widget sizedBoxWidth5 = SizedBox(width: 5);
  static const Widget sizedBoxWidth7 = SizedBox(width: 7);
  static const Widget sizedBoxWidth10 = SizedBox(width: 10);
  static const Widget sizedBoxWidth15 = SizedBox(width: 15);
  static const Widget sizedBoxWidth25 = SizedBox(width: 25);
  static const Widget sizedBoxWidth52 = SizedBox(width: 52);

  static const Widget dividerDefault = Divider(height: 3);
  static const Widget sizedBoxPaddingHuge =
      SizedBox(height: AppDimens.paddingHuge);
  static const Widget sizedBoxPadding =
      SizedBox(height: AppDimens.defaultPadding);

  static Widget buildButton(
    String btnTitle,
    Function function, {
    Color? backgroundColor,
    bool isLoading = false,
    bool showLoading = true,
    bool isCenterButton = true,
    IconData? icon,
    Color? iconColor,
    double? iconSize,
    double? width,
    double? height,
    Color? colorText,
    BorderRadiusGeometry? borderRadius,
    Border? border,
  }) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? AppDimens.btnMedium,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border ?? const Border(),
        // gradient:
        //     backgroundColor != null ? null : LinearGradient(colors: colors),
        borderRadius: borderRadius ?? BorderRadius.circular(AppDimens.radius5),
      ),
      child: ElevatedButton(
        onPressed: () => onTapButton(isLoading: isLoading, onTap: function),
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          foregroundColor: AppColors.colorTransparent,
          backgroundColor: AppColors.colorTransparent,
          shadowColor: AppColors.colorTransparent,
          shape: RoundedRectangleBorder(
              borderRadius:
                  borderRadius ?? BorderRadius.circular(AppDimens.radius5)),
        ),
        child: Stack(
          children: [
            if (icon != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  icon,
                  size: iconSize,
                  color: iconColor,
                ),
              ),
            (isCenterButton && isLoading && showLoading)
                ? const SizedBox()
                : Center(
                    child: TextUtils(
                      text: btnTitle,
                      availableStyle: StyleEnum.subBold,
                      color: colorText ?? AppColors.white,
                    ),
                  ),
            Align(
              alignment:
                  isCenterButton ? Alignment.center : Alignment.centerRight,
              child: Visibility(
                visible: isLoading && showLoading,
                child: const SizedBox(
                  height: AppDimens.btnSmall,
                  width: AppDimens.btnSmall,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: AppColors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.colorPrimary1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).paddingOnly(
      bottom: GetPlatform.isAndroid ? 0 : AppDimens.paddingSmaller,
    );
  }

  static void onTapButton({required Function onTap, required bool isLoading}) {
    if (!isLoading) {
      DateTime now = DateTime.now();
      if (_dateTime == null ||
          now.difference(_dateTime ?? DateTime.now()) > 2.seconds ||
          onTap.hashCode != _oldFunc) {
        _dateTime = now;
        _oldFunc = onTap.hashCode;
        onTap();
      }
    }
  }

  /// Sử dụng để tránh trường hợp click liên tiếp khi thực hiện function
  static Widget baseOnAction({
    required Function onTap,
    required Widget child,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        DateTime now = DateTime.now();
        if (_dateTime == null ||
            now.difference(_dateTime ?? DateTime.now()) > 2.seconds ||
            onTap.hashCode != _oldFunc) {
          _dateTime = now;
          _oldFunc = onTap.hashCode;
          onTap();
        }
      },
      child: child,
    );
  }

  static PreferredSizeWidget buildAppBar(String title,
      {Color? textColor,
      Color? actionsIconColor,
      Color? backButtonColor,
      Color? backgroundColor,
      bool centerTitle = true,
      double fontSize = 16,
      FontWeight fontWeight = FontWeight.w400,
      Function()? funcLeading,
      bool leading = true,
      List<Widget>? actions,
      bool isColorGradient = false,
      List<Color>? colorTransparent,
      TabBar? widget,
      Widget? titleWidget,
      bool statusBarIconBrightness = false}) {
    return AppBar(
      bottom: widget,
      surfaceTintColor: AppColors.colorPrimary3,
      actionsIconTheme:
          IconThemeData(color: actionsIconColor ?? AppColors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness:
            statusBarIconBrightness ? Brightness.dark : Brightness.light,
        statusBarIconBrightness:
            statusBarIconBrightness ? Brightness.light : Brightness.dark,
      ),
      title: titleWidget ??
          UtilWidget.buildAppBarTitle(
            title,
            textColor: textColor ?? AppColors.colorTextBlack,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      leading: !leading
          ? null
          : UtilWidget.baseOnAction(
              onTap: () {
                if (funcLeading != null) {
                  funcLeading();
                } else {
                  Get.back();
                }
              },
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.chevron_left,
                  color: backButtonColor ?? AppColors.colorTextBlack,
                  size: AppDimens.iconMedium,
                ),
              ),
            )
      /*BackButton(
              color: backButtonColor ?? AppColors.textColorDefault,
              onPressed: funcLeading,
            )*/
      ,
      flexibleSpace: isColorGradient
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: colorTransparent ??
                      <Color>[
                        AppColors.colorBlueX,
                        AppColors.colorBlueX,
                      ],
                ),
              ),
            )
          : null,
      actions: actions,
      backgroundColor:
          isColorGradient ? null : backgroundColor ?? AppColors.colorPrimary3,
      titleSpacing: titleWidget == null ? null : 0,
    );
  }

  static PreferredSizeWidget buildAppBarSearch(
    TextEditingController textEditingController, {
    Color? textColor,
    Color? actionsIconColor,
    Color? backButtonColor,
    Color? backgroundColor,
    bool centerTitle = false,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w400,
    required Function() funcLeading,
    bool leading = true,
    List<Widget>? actions,
    bool isColorGradient = false,
    List<Color>? colorTransparent,
    TabBar? widget,
    VoidCallback? functionSearch,
    Widget? titleWidget,
  }) {
    return AppBar(
      bottom: widget,
      actionsIconTheme:
          IconThemeData(color: actionsIconColor ?? AppColors.colorTextWhite),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      title: BuildInputText(
        InputTextModel(
          borderRadius: AppDimens.radiusMedium,
          isShowCounterText: false,
          maxLengthInputForm: AppDimens.btnMediumFont,
          controller: textEditingController,
          fillColor: AppColors.colorSearch,
          hintTextSize: AppDimens.sizeTextSmall,
          hintTextColor: AppColors.colorHintText,
          colorBorder: AppColors.colorSearchBorder,
          floatingLabelStyle: AppTextStyle.labelStyle(
            size: AppDimens.sizeTextLarge,
          ),
          autoFocus: true,
          textInputType: TextInputType.text,
          contentPadding: const EdgeInsets.all(AppDimens.paddingSmall),
          isDense: true,
          isSearch: true,
          colorFocusedBorder: AppColors.colorSearchBorder,
          functionSearch: functionSearch,
          iconNextTextInputAction: TextInputAction.done,
          onEditingComplete: functionSearch,
        ),
      ),
      leading: !leading
          ? null
          : UtilWidget.baseOnAction(
              onTap: funcLeading,
              child: IconButton(
                onPressed: null,
                icon: SvgPicture.asset(
                  Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_CANCEL_SVG,
                  colorFilter: const ColorFilter.mode(
                    AppColors.colorWhite,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
      /*BackButton(
              color: backButtonColor ?? AppColors.textColorDefault,
              onPressed: funcLeading,
            )*/
      flexibleSpace: isColorGradient
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight,
                    colors: colorTransparent ??
                        <Color>[AppColors.colorBlueX, AppColors.colorBlueX]),
              ),
            )
          : null,
      actions: actions,
      backgroundColor:
          isColorGradient ? null : backgroundColor ?? AppColors.colorBlueX,
      titleSpacing: titleWidget == null ? null : 0,
    );
  }

  static buildAppBarTitle(
    String title, {
    bool? textAlignCenter,
    Color? textColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    textAlignCenter = textAlignCenter ?? GetPlatform.isAndroid;
    return TextUtils(
      text: title.tr,
      availableStyle: StyleEnum.titleLarge,
      textAlign: textAlignCenter ? TextAlign.center : TextAlign.left,
      fontWeight: fontWeight,
      size: fontSize,
      color: textColor,
    );
  }

  static Widget buildDropdownCustomBorder(
    Map<dynamic, String> mapData, {
    required Rx<dynamic> item,
    double height = 30,
    Color fillColor = AppColors.colorBackgroundWhite,
    double paddingLeft = AppDimens.paddingSmall,
    Color colorText = AppColors.colorBackgroundWhite,
    String? svgImage,
    Function(dynamic)? onChanged,
  }) {
    return Obx(
      () => DropdownButtonHideUnderline(
        child: DropdownButtonFormField2<dynamic>(
          selectedItemBuilder: (BuildContext context) {
            return mapData.values.map<Widget>((val) {
              return Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    svgImage != null
                        ? SvgPicture.asset(
                            svgImage,
                          ).paddingOnly(right: AppDimens.paddingSize5)
                        : const SizedBox(),
                    UtilWidget.sizedBoxWidth7,
                    Expanded(
                      child: TextUtils(
                        text: val,
                        availableStyle: StyleEnum.bodySmall,
                        maxLine: 2,
                        color: colorText,
                      ),
                    ),
                  ],
                ),
              );
            }).toList();
          },
          hint: TextUtils(
            text: LocaleKeys.personalInfo_hintDropdown.tr,
            availableStyle: StyleEnum.bodySmall,
            color: AppColors.colorBasicGrey,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
                color: AppColors.colorWhite,
                borderRadius: BorderRadius.circular(
                  AppDimens.paddingMedium,
                )),
            maxHeight: Get.height / 2.5,
            offset: const Offset(-0, -5),
            scrollbarTheme: ScrollbarThemeData(
              // radius: const Radius.circular(40),
              thickness: WidgetStateProperty.all<double>(6),
              thumbVisibility: WidgetStateProperty.all<bool>(true),
            ),
          ),
          isExpanded: true,
          decoration: InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.paddingMedium),
              borderSide: BorderSide(
                color: fillColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.paddingMedium),
              borderSide: BorderSide(
                color: fillColor,
              ),
            ),
            contentPadding: const EdgeInsets.all(0),
            fillColor: AppColors.colorWhite,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.paddingMedium),
            ),
          ),
          items: mapData
              .map((key, value) {
                return MapEntry(
                  key,
                  DropdownMenuItem<dynamic>(
                    value: key,
                    child: TextUtils(
                      text: mapData[key] ?? "",
                      availableStyle: StyleEnum.bodySmall,
                      maxLine: 2,
                      color: item.value == key
                          ? AppColors.colorPrimary1
                          : colorText,
                    ),
                  ),
                );
              })
              .values
              .toList(),
          value: item.value,
          onChanged: onChanged,
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(
              right: AppDimens.defaultPadding,
            ),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: AppColors.colorNeutral2,
            ),
          ),
        ),
      ).paddingOnly(left: paddingLeft).paddingOnly(
            bottom: AppDimens.paddingTitleAndTextForm,
          ),
    );
  }

  static Future<DateTime?> buildDateTimePicker({
    required DateTime dateTimeInit,
    DateTime? minTime,
    DateTime? maxTime,
  }) async {
    DateTime? newDateTime = await showRoundedDatePicker(
      context: Get.context!,
      height: 340,
      initialDate: dateTimeInit,
      firstDate: minTime ?? DateTime.utc(DateTime.now().year - 10),
      lastDate: maxTime,
      // barrierDismissible: true,
      theme: ThemeData(
        primaryColor: AppColors.white,
        dialogBackgroundColor: AppColors.colorWhite,
        disabledColor: AppColors.colorBasicGrey,
        focusColor: AppColors.lightPrimaryColor,
        textTheme: TextTheme(
          bodySmall: Get.textTheme.bodyLarge!
              .copyWith(color: AppColors.colorBasicGrey),
          bodyMedium: Get.textTheme.bodyLarge,
        ),
        colorScheme: const ColorScheme.light(
          primary: AppColors.lightPrimaryColor, // Selected day bg color
        ),
      ),
      styleDatePicker: MaterialRoundedDatePickerStyle(
        // paddingMonthHeader: const EdgeInsets.all(AppDimens.paddingVerySmall),
        textStyleMonthYearHeader: Get.textTheme.bodyLarge,
        colorArrowNext: AppColors.colorBasicGrey,
        colorArrowPrevious: AppColors.colorBasicGrey,
        textStyleButtonNegative:
            Get.textTheme.bodyLarge!.copyWith(color: AppColors.colorBasicGrey),
        textStyleButtonPositive: Get.textTheme.bodyLarge!
            .copyWith(color: AppColors.lightPrimaryColor),
        textStyleCurrentDayOnCalendar: Get.textTheme.bodyLarge!
            .copyWith(color: AppColors.lightPrimaryColor),
      ),
    );
    return newDateTime;
  }

  static Widget buildButtonSecond(
    String btnTitle,
    Function function, {
    bool isLoading = false,
    double? width,
    double radius = AppDimens.radius5,
    Color? backgroundColor,
  }) {
    return UtilWidget.buildButton(
      btnTitle,
      function,
      backgroundColor: AppColors.white,
      borderRadius: BorderRadius.circular(radius),
      colorText: backgroundColor ?? AppColors.lightPrimaryColor,
      height: 52.h,
      width: width,
      border: Border.all(
          color: backgroundColor ?? AppColors.lightPrimaryColor, width: 1),
      isLoading: isLoading,
    );
  }

  static Widget buildButtonPrimary(
    String btnTitle,
    Function function, {
    bool isLoading = false,
    Color? backgroundColor,
    double radius = AppDimens.radius5,
  }) {
    return UtilWidget.buildButton(
      btnTitle.tr,
      function,
      backgroundColor: backgroundColor ?? AppColors.lightPrimaryColor,
      borderRadius: BorderRadius.circular(radius),
      height: 52.h,
      isLoading: isLoading,
    );
  }

  /// Base elevated button
  static Widget buildSolidButtonIcon({
    required void Function() onPressed,
    required String title,
    TextStyle? titleStyle,
    String? svgPath,
    Color svgIconColor = AppColors.colorWhite,
    Widget? icon,
    Color backgroundColor = AppColors.colorBlueX,
    double radius = 20,
    Size? fixedSize,
    Size? minSize,
    Size? maxSize,
    Color? foregroundColor,
    Color? colorText,
    bool isLoading = false,
    bool showLoading = true,
    BorderSide? border,
  }) {
    return ElevatedButton.icon(
      onPressed: isLoading
          ? () {}
          : () {
              DateTime now = DateTime.now();
              if (_dateTime == null ||
                  now.difference(_dateTime ?? DateTime.now()) > 2.seconds ||
                  onPressed.hashCode != _oldFunc) {
                _dateTime = now;
                _oldFunc = onPressed.hashCode;
                onPressed();
              }
            },
      icon: isLoading && showLoading
          ? const Center(
              child: SizedBox(
                height: AppDimens.btnSmall,
                width: AppDimens.btnSmall,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  backgroundColor: AppColors.colorBlueX,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.white,
                  ),
                ),
              ),
            )
          : (svgPath != null
              ? SvgPicture.asset(
                  svgPath,
                  colorFilter: ColorFilter.mode(
                    svgIconColor,
                    BlendMode.srcIn,
                  ),
                )
              : icon ?? Container()),
      label: Visibility(
        visible: !isLoading,
        child: TextUtils(
          text: title,
          availableStyle: StyleEnum.titleSmall,
          color: colorText ?? Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        side: border,
        backgroundColor: backgroundColor,
        disabledBackgroundColor: backgroundColor,
        disabledForegroundColor: foregroundColor ?? Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        fixedSize: fixedSize,
        minimumSize: minSize,
        maximumSize: maxSize,
        textStyle: titleStyle ?? FontStyleUtils.fontStyleSans(),
      ),
    );
  }

  static Widget svgAssetColored(
    String path, {
    Color? color,
    double? width,
    double? height,
  }) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      colorFilter: color != null
          ? ColorFilter.mode(
              color,
              BlendMode.srcIn,
            )
          : null,
    );
  }

  static Widget buildSmartRefresher({
    required RefreshController refreshController,
    required Widget child,
    ScrollController? scrollController,
    Function()? onRefresh,
    Function()? onLoadMore,
    bool enablePullDown = true,
    bool enablePullUp = false,
  }) {
    return SmartRefresher(
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      scrollController: scrollController,
      header: const MaterialClassicHeader(
        color: AppColors.colorBlueX,
      ),
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoadMore,
      footer: buildSmartRefresherCustomFooter(),
      child: child,
    );
  }

  static Widget buildSmartRefresherCustomFooter() {
    return CustomFooter(
      builder: (context, mode) {
        if (mode == LoadStatus.loading) {
          return const CupertinoActivityIndicator(
            color: AppColors.colorBlueX,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  /// URL launcher
  static Future<void> launchInBrowser(String url) async {
    Uri uri;
    if (url.contains('https') || url.contains('http')) {
      uri = Uri.parse(url);
    } else {
      if (url.contains('@')) {
        uri = Uri(
          scheme: 'mailto',
          path: url,
        );
      } else {
        uri = Uri(
          scheme: 'tel',
          path: url,
        );
      }
    }
    if (await launchUrl(uri)) {
      /*bool resultLaunch = */ await launchUrl(uri,
          mode: LaunchMode.externalApplication);
    }
    /* if(!resultLaunch){
        if(Get.isDialogOpen == true){
          Get.back();
        }
      }
    } else {
      if(Get.isDialogOpen == true){
        Get.back();
      }
    }*/
  }

  /// Base for bottom sheet
  static Widget baseBottomSheet({
    required String title,
    required Widget body,
    Widget? iconTitle,
    bool isSecondDisplay = false,
    Widget? actionArrowBack,
    double? padding,
    bool noHeader = false,
    Color? backgroundColor,
    TextAlign? textAlign,
    double? height,
  }) {
    return SafeArea(
      bottom: false,
      minimum: EdgeInsets.only(
          top: Get.mediaQuery.padding.top + (isSecondDisplay ? 100 : 20)),
      child: Container(
        height: height,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.bottomSheet(),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(AppDimens.defaultPadding),
          ),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                height: AppDimens.paddingSmallest,
                width: AppDimens.iconLarge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppDimens.defaultPadding)),
                  color: AppColors.colorComment,
                ),
              ).paddingSymmetric(vertical: AppDimens.paddingSmaller),
            ),
            noHeader
                ? const SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      actionArrowBack ??
                          const BackButton(
                            color: AppColors.colorGrey,
                          ),
                      Expanded(
                        child: Text(
                          title.tr,
                          textAlign: textAlign ?? TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FontStyleUtils.fontStyleSans(
                            fontSize: AppDimens.sizeTextMedium,
                          ),
                        ),
                      ),
                      iconTitle ??
                          const SizedBox(
                            width: 48, //size of Back Button
                          ),
                    ],
                  ),
            body,
          ],
        ).paddingSymmetric(horizontal: padding ?? AppDimens.defaultPadding),
      ),
    );
  }

  static Widget baseBottomSheetFilter({
    required String title,
    required Widget body,
    Widget? iconTitle,
    bool isSecondDisplay = false,
  }) {
    return SafeArea(
      bottom: false,
      minimum: EdgeInsets.only(
          top: Get.mediaQuery.padding.top + (isSecondDisplay ? 100 : 20)),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: AppColors.bottomSheet(),
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 80,
                height: 6,
                margin: const EdgeInsets.all(AppDimens.paddingSmall),
                decoration: BoxDecoration(
                    color: AppColors.iconHomeColor(),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(title.tr,
                          textAlign: iconTitle == null
                              ? TextAlign.center
                              : TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Get.textTheme.titleLarge
                              ?.copyWith(color: AppColors.textColor()))
                      .paddingSymmetric(vertical: AppDimens.paddingSmall),
                ),
                iconTitle ?? const SizedBox(),
              ],
            ),
            Expanded(child: body),
          ],
        ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
      ),
    );
  }

  openLoadingDialog() {
    return const Material(
      color: DefaultTheme.transparent,
      child: Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CupertinoActivityIndicator(
            radius: 30,
            color: DefaultTheme.white,
          ),
        ),
      ),
    );
  }

  /// Logo nền chữ ký
  static Widget buildImgBackground({
    required double sizeLogo,
    required double opacity,
    double ratio = 1,
    Uint8List? logoImg,
  }) {
    return SizedBox(
      // width: sizeLogo * ratio,
      // height: sizeLogo * ratio,
      child: /*logoImg == null
          ? Image.asset(
              Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_SIGNING_SVG,
              opacity: AlwaysStoppedAnimation(opacity),
              fit: BoxFit.cover,
              width: sizeLogo * ratio,
            )
          : */
          Image.memory(
        logoImg!,
        opacity: AlwaysStoppedAnimation(opacity),
        fit: BoxFit.cover,
        width: sizeLogo * ratio,
      ),
    );
  }

  /// Base row of 2 buttons
  static Widget buildTwoButtons({
    String? titleButtonLeft,
    String? titleButtonRight,
    Function()? onTapLeft,
    Function()? onTapRight,
    double radius = AppDimens.radius5,
    Color? backgroundColorRight,
  }) {
    return Row(
      children: [
        Expanded(
          child: buildButtonSecond(
            titleButtonLeft ?? LocaleKeys.pdfPage_buttonLeft.tr,
            onTapLeft ?? () {},
            radius: radius,
            backgroundColor: backgroundColorRight,
          ),
        ),
        UtilWidget.sizedBoxWidth10,
        Expanded(
          child: buildButtonPrimary(
            titleButtonRight ?? LocaleKeys.pdfPage_buttonRight.tr,
            onTapRight ?? () {},
            radius: radius,
            backgroundColor: backgroundColorRight,
          ),
        ),
      ],
    );
  }

  /// Base for checkbox
  static Widget buildCheckBox(
    String title,
    RxBool isChecked,
  ) {
    return GestureDetector(
      onTap: () => isChecked.toggle(),
      child: Row(
        children: [
          Obx(
            () => isChecked.value
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_CHECKBOX_SVG,
                      ),
                      SvgPicture.asset(
                        Assets
                            .ASSETS_IMAGES_ICON_ICON_SVG_ICON_CHECKBOX_TICK_SVG,
                      ),
                    ],
                  )
                : SvgPicture.asset(
                    Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_CHECKBOX_EMPTY_SVG,
                  ),
          ),
          UtilWidget.sizedBoxWidth10,
          Expanded(
            child: TextUtils(
              text: title,
              availableStyle: StyleEnum.bodySmall,
              maxLine: 3,
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildPdfRejectOrApprove({
    required String label,
    required String hintText,
    required String titleButtonLeft,
    required String titleButtonRight,
    required TextEditingController textEditingController,
    required VoidCallback onTapCancel,
    required VoidCallback onTapConfirm,
    FocusNode? currentNode,
    GlobalKey<FormState>? formKey,
    String? errorValidator,
    FocusNode? nextMode,
    bool isPassword = false,
    TextInputType textInputType = TextInputType.text,
  }) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            UtilWidget.sizedBox5,
            buildInputField(
              label: label,
              hintText: hintText,
              textEditingController: textEditingController,
              errorValidator: errorValidator,
              isPass: isPassword,
            ).paddingSymmetric(horizontal: AppDimens.paddingSmallest),
            UtilWidget.sizedBox15,
            UtilWidget.buildTwoButtons(
              titleButtonLeft: titleButtonLeft,
              titleButtonRight: titleButtonRight,
              onTapLeft: onTapCancel,
              onTapRight: onTapConfirm,
            ),
          ],
        ),
      ),
    );
  }

  /// Base for input field
  static Widget buildInputField({
    required String label,
    required TextEditingController textEditingController,
    String? hintText,
    String? errorValidator,
    String? Function()? validationFunc,
    TextInputType? textInputType,
    bool isPass = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextUtils(
          text: label,
          availableStyle: StyleEnum.titleSmall,
          color: AppColors.colorBasicGrey,
        ),
        UtilWidget.sizedBox5,
        BuildInputText(
          InputTextModel(
            controller: textEditingController,
            textInputType: textInputType ?? TextInputType.text,
            textColor: AppColors.colorBasicBlack,
            hintText: hintText,
            hintTextColor: AppColors.colorBasicGrey2,
            hintTextSize: AppDimens.sizeTextSmall,
            colorBorder: AppColors.colorBasicGrey2,
            fillColor: AppColors.colorWhite,
            obscureText: isPass,
            validator: (value) =>
                value.isNullOrEmpty ? errorValidator : validationFunc?.call(),
          ),
        ),
        UtilWidget.sizedBox5,
      ],
    ).paddingSymmetric(vertical: AppDimens.paddingSmallest);
  }

  static Widget buildInkwellBsOption({
    required BaseGetxController controller,
    required String title,
    required Function() function,
    String? icon,
  }) {
    RxBool isChosen = false.obs;

    return InkWell(
      onTap: () {
        function.call();
      },
      child: Obx(
        () => Container(
          alignment: Alignment.center,
          width: Get.width,
          height: Get.height / 17,
          decoration: BoxDecoration(
            color: isChosen.value
                ? AppColors.colorBackgroundOption
                : AppColors.colorBackgroundWhite,
            borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!icon.isNullOrEmpty)
                SvgPicture.asset(
                  icon ?? '',
                  color: AppColors.colorTitleAppbar,
                ),
              icon == null ? const SizedBox() : UtilWidget.sizedBoxWidth5,
              TextUtils(
                text: title,
                availableStyle: StyleEnum.titleSmall,
              ),
            ],
          ).paddingAll(AppDimens.paddingVerySmall),
        ).paddingSymmetric(vertical: AppDimens.paddingSmallest),
      ),
    );
  }

  static Widget buildInkwelleCertBsColumn({
    required String title,
    required Function() function,
    String? icon,
  }) {
    return InkWell(
      onTap: () {
        function.call();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!icon.isNullOrEmpty)
            SvgPicture.asset(
              icon ?? '',
            ),
          icon == null ? const SizedBox() : sizedBox7,
          TextUtils(
            text: title,
            availableStyle: StyleEnum.titleSmall,
            fontWeight: FontWeight.w600,
            color: AppColors.colorNeutral2,
          ),
        ],
      )
          .paddingAll(AppDimens.paddingVerySmall)
          .paddingSymmetric(vertical: AppDimens.paddingSmallest),
    );
  }

  static Widget buildInkwellBsColumn({
    required BaseGetxController controller,
    required String title,
    required Function() function,
    String? icon,
  }) {
    return InkWell(
      onTap: () {
        function.call();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!icon.isNullOrEmpty)
            SvgPicture.asset(
              icon ?? '',
            ),
          icon == null ? const SizedBox() : sizedBox7,
          TextUtils(
            text: title,
            availableStyle: StyleEnum.titleSmall,
            fontWeight: FontWeight.w600,
            color: AppColors.colorNeutral2,
          ),
        ],
      )
          .paddingAll(AppDimens.paddingVerySmall)
          .paddingSymmetric(vertical: AppDimens.paddingSmallest),
    );
  }

  // static Widget buildDocHistory(DocumentDetailController controller) {
  //   DocumentHistoryModelResponse documentHistoryModel =
  //       controller.documentHistoryModel.value!;
  //
  //   List<HistoryActivityData> historyActivityData =
  //       List.from(documentHistoryModel.historyActivityDatas.reversed);
  //   return SingleChildScrollView(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         UtilWidget.sizedBox5,
  //         const TextUtils(
  //           text: DocumentManagementDetailStr.history,
  //           availableStyle: StyleEnum.titleSmall,
  //           color: AppColors.colorBasicGrey,
  //         ),
  //         UtilWidget.sizedBox10,
  //         TextUtils(
  //           text: controller.titleDocument,
  //           availableStyle: StyleEnum.titleSmall,
  //           maxLine: AppDimens.size5,
  //         ),
  //         UtilWidget.sizedBox10,
  //         const TextUtils(
  //           text: DocumentManagementDetailStr.activityHistory,
  //           availableStyle: StyleEnum.titleSmall,
  //           color: AppColors.colorBasicGrey,
  //         ),
  //         UtilWidget.sizedBox10,
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Expanded(
  //               child: _buildBoldNormalText(
  //                 title: '${DocumentManagementDetailStr.from}: ',
  //                 content: '${documentHistoryModel.contractData!.createdBy}',
  //               ),
  //             ),
  //           ],
  //         ),
  //         UtilWidget.sizedBox10,
  //
  //         // Lịch sử người nhận
  //         // Column(
  //         //   children: List.generate(
  //         //     documentHistoryModel.historyActivityDatas.length,
  //         //     (index) => _buildDocHistoryContent(
  //         //       controller,
  //         //       historyActivityData[index],
  //         //       index,
  //         //     ),
  //         //   )
  //         //       .reversed
  //         //       .toList(), // Duyệt lịch sử từ lúc tạo tài liệu đến gần đây
  //         // ),
  //       ],
  //     ),
  //   );
  // }

  // static Widget _buildDocHistoryContent(
  //   DocumentDetailController controller,
  //   HistoryActivityData historyData,
  //   int index,
  // ) {
  //   Color colorStatus =
  //       EnumStatusDocumentMap.mapColorHistory[historyData.action] ??
  //           AppColors.colorBasicBlack;
  //
  //   return Stack(
  //     children: [
  //       Container(
  //         decoration: BoxDecoration(
  //           // color: Colors.red,
  //           border: Border(
  //             left: BorderSide(
  //               color: index == 0
  //                   ? AppColors.transparent
  //                   : AppColors.colorBasicBlack, // Màu cạnh trái
  //               width: AppDimens.radiusMin, // Độ dày cạnh trái
  //             ),
  //           ),
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             _buildBoldNormalText(
  //               title: controller.isDocumentCreated(historyData.action!)
  //                   ? '${DocumentManagementDetailStr.creator}: '
  //                   : '${DocumentManagementDetailStr.to}: ',
  //               content: '${historyData.fullName} (${historyData.email})',
  //               color: colorStatus,
  //             ).paddingOnly(
  //                 right: AppDimens.paddingSize5, left: AppDimens.paddingSmall),
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: TextUtils(
  //                     text: controller.isDocumentCreated(historyData.action!)
  //                         ? DocumentHistoryEnum.sent
  //                         : EnumStatusDocumentMap
  //                                 .mapDocumentHistory[historyData.action] ??
  //                             '',
  //                     availableStyle: StyleEnum.titleVerySmall,
  //                     color: colorStatus,
  //                   ).paddingOnly(left: AppDimens.paddingTextHis),
  //                 ),
  //                 Expanded(
  //                   child: Align(
  //                     alignment: Alignment.centerRight,
  //                     child: TextUtils(
  //                       text: convertDateToString(
  //                         historyData.createdDate,
  //                         pattern10,
  //                       ),
  //                       availableStyle: StyleEnum.bodyVerySmall,
  //                       color: colorStatus,
  //                     ),
  //                   ).paddingOnly(right: AppDimens.paddingSize5),
  //                 ),
  //               ],
  //             ),
  //             Visibility(
  //               visible: controller.isDocumentCancelled(historyData.action!),
  //               child: _buildBoldNormalText(
  //                 title: '${DocumentManagementDetailStr.reason}: ',
  //                 content: controller.cancelledReason(
  //                     historyData.action!, historyData.detail!),
  //                 fontSize: AppDimens.sizeTextSmaller,
  //                 color: colorStatus,
  //               ),
  //             ).paddingOnly(left: AppDimens.paddingTextHis),
  //           ],
  //         ).paddingOnly(bottom: AppDimens.sizeTextSmallest),
  //       ).paddingOnly(left: 6.5, top: 1),
  //       SvgPicture.asset(
  //         Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_ELLIPSE_SVG,
  //         width: AppDimens.sizeDocHistoryCircle,
  //         height: AppDimens.sizeDocHistoryCircle,
  //         color: colorStatus,
  //       ),
  //     ],
  //   );
  // }

  static Widget buildInputData(
      {String? title,
      required TextEditingController textEditingController,
      required bool isReadOnly,
      required String hintText,
      String? errorValidator,
      FocusNode? currentNode,
      FocusNode? nextMode,
      bool isPassword = false,
      bool isTaxCode = false,
      TextInputType textInputType = TextInputType.text,
      int? maxLength,
      VoidCallback? onEditingComplete,
      TextInputAction iconNextTextInputAction = TextInputAction.next,
      IconData? iconLeading,
      int? inputFormatters,
      String? iconLeadingSVG,
      double borderRadius = AppDimens.radiusBig,
      bool visible = true,
      ValueChanged<String>? onChanged}) {
    return Visibility(
      visible: visible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: title != null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: title ?? "",
                    availableStyle: StyleEnum.titleSmall,
                    color: AppColors.colorBasicGrey,
                    maxLine: 3,
                  ),
                  UtilWidget.sizedBox5,
                ],
              )),
          BuildInputText(
            InputTextModel(
              isShowCounterText: false,
              maxLengthInputForm: maxLength ?? AppDimens.btnMediumFont,
              validator: (value) => value.isNullOrEmpty ? errorValidator : null,
              controller: textEditingController,
              fillColor: AppColors.colorFill,
              isReadOnly: isReadOnly,
              borderRadius: borderRadius,
              hintTextColor: AppColors.colorHintText,
              colorFocusedBorder: AppColors.colorBlueX,
              // hintTextSize: AppDimens.sizeTextSmall,
              // hintTextColor: AppColors.colorHintText,
              hintText: hintText,
              colorBorder: AppColors.colorBorder,
              floatingLabelStyle: AppTextStyle.labelStyle(
                size: AppDimens.sizeTextLarge,
              ),
              obscureText: isPassword,
              currentNode: currentNode,
              nextNode: nextMode,
              textInputType: textInputType,
              iconNextTextInputAction: iconNextTextInputAction,
              onEditingComplete: onEditingComplete,
              labelText: hintText,
              iconLeading: iconLeading,
              inputFormatters:
                  inputFormatters ?? InputFormatterEnum.lengthLimitingText,
              iconLeadingSVG: iconLeadingSVG,
              onChanged: onChanged,
            ),
          ).paddingSymmetric(vertical: AppDimens.paddingSize5),
        ],
      ),
    );
  }

  static Widget _buildBoldNormalText({
    String? title,
    String? content,
    double? fontSize,
    Color? color,
  }) {
    return RichText(
      text: TextSpan(
        text: title ?? '',
        style: GoogleFonts.nunito().copyWith(
          fontSize: fontSize ?? AppDimens.sizeTextSmall,
          fontWeight: FontWeight.bold,
          color: color ?? AppColors.colorBasicBlack,
          fontStyle: FontStyle.normal,
        ),
        children: [
          TextSpan(
            text: content ?? '',
            style: GoogleFonts.nunito().copyWith(
              fontSize: fontSize ?? AppDimens.sizeTextSmall,
              fontWeight: FontWeight.normal,
              color: color ?? AppColors.colorBasicBlack,
              fontStyle: FontStyle.normal,
            ),
          ),
        ],
      ),
    );
  }

  static Widget itemCard({
    required Widget child,
    Function? onTap,
    double? vertical,
    double? horizontal,
    Color? borderColor,
    Color? color,
    double borderRadius = AppDimens.paddingMedium,
  }) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Card(
        color: color ?? AppColors.colorWhite,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor ?? AppColors.colorBorderSide2,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child.paddingSymmetric(
          horizontal: horizontal ?? AppDimens.defaultPadding,
          vertical: vertical ?? 0,
        ),
      ),
    );
  }

  static Widget buildBottomPading() {
    return GetPlatform.isAndroid ? sizedBox10 : sizedBox15;
  }
}
