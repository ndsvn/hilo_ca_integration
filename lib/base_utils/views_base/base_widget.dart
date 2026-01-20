import 'package:hilo_ca_integration/assets/strings.dart';
import 'package:hilo_ca_integration/base_utils/controllers_base/base_controller.src.dart';
import 'package:hilo_ca_integration/cores/values/values.src.dart';
import 'package:hilo_ca_integration/shares/widgets/utils_wigets.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

abstract class BaseGetWidget<T extends BaseGetxController> extends GetView<T> {
  const BaseGetWidget({super.key});

  Widget buildWidgets(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return buildWidgets(context);
  }

  Widget baseShowLoading(WidgetCallback child, {Color? colorIcon}) {
    return Obx(
      () => controller.isShowLoading.value
          ? Center(child: UtilWidget.buildLoading(colorIcon: colorIcon))
          : child(),
    );
  }

  Widget baseShimmerLoading(WidgetCallback child, {Widget? shimmer}) {
    return Obx(
      () => controller.isShowLoading.value
          ? shimmer ?? UtilWidget.buildShimmerLoading()
          : child(),
    );
  }

  Widget buildLoadingOverlay(WidgetCallback child,
      {Color? colorIcon, Widget? loadingWidget}) {
    return Obx(
      () => LoadingOverlayPro(
        progressIndicator:
            loadingWidget ?? UtilWidget.buildLoading(colorIcon: colorIcon),
        isLoading: controller.isLoadingOverlay.value,
        child: child(),
      ),
    );
  }

  static Widget listEmpty() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.circleExclamation,
          size: 30,
          color: DefaultTheme.greyText,
        ),
        Text(
          AppStr.emptyList,
          style: TextStyle(
            fontSize: 20,
            color: DefaultTheme.greyText,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
