import 'dart:io';
import 'dart:typed_data';

import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';

import '../../cores/cores_src.dart';

class ImageWidget {
  static Widget imageSvg(
    String assetName, {
    final double? width,
    final double? height,
    final Color? color,
  }) {
    return SvgPicture.asset(
      assetName,
      fit: BoxFit.contain,
      height: height,
      colorFilter: color != null
          ? ColorFilter.mode(
              color,
              BlendMode.srcIn,
            )
          : null,
      width: width,
    );
  }

  static Widget svgImgShadow(
    String imageUrl, {
    final double? width,
    final double? height,
    final Color? color,
    final Color? colorBackground,
    final double? widthBackground,
    final double? heightBackground,
  }) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 2.0),
              blurRadius: AppDimens.radius20,
            )
          ],
          color: colorBackground ?? AppColors.lightPrimaryColor,
          borderRadius:
              const BorderRadius.all(Radius.circular(AppDimens.radius8))),
      width: widthBackground ?? AppDimens.sizeImage,
      height: height ?? AppDimens.sizeImage,
      child: imageSvg(
        imageUrl,
        width: width,
        height: height,
        color: color ?? AppColors.white,
      ).paddingAll(AppDimens.size4),
    );
  }

  static Widget imgBase64BE({
    required String imgBase64,
    final double? width,
    final double? height,
    final Color? colorBackground,
    final double? widthBackground,
    final double? heightBackground,
    final BoxFit? fit,
  }) {
    if (imgBase64.isEmpty) {
      return const SizedBox();
    }
    return Container(
      decoration: BoxDecoration(
          color: colorBackground ?? AppColors.lightPrimaryColor,
          borderRadius:
              const BorderRadius.all(Radius.circular(AppDimens.radius8))),
      width: widthBackground ?? AppDimens.sizeImage,
      height: heightBackground ?? AppDimens.sizeImage,
      child: Image.memory(
        ImageUtils.uriBase64ToData(imgBase64),
        fit: fit,
        width: width,
        height: height,
      ).paddingAll(AppDimens.size4),
    );
  }

  static Widget imgUnit8List({
    required Uint8List? imageData,
    final double? width,
    final double? height,
    final Color? colorBackground,
    final double? widthBackground,
    final double? heightBackground,
    final BoxFit? fit,
  }) {
    if (imageData == null) {
      return const SizedBox();
    }
    try {
      return Container(
        decoration: BoxDecoration(
            // boxShadow: const [
            //   BoxShadow(
            //     color: Colors.black26,
            //     offset: Offset(0.0, 2.0),
            //     blurRadius: AppDimens.radius20,
            //   )
            // ],
            color: colorBackground ?? AppColors.lightPrimaryColor,
            borderRadius:
                const BorderRadius.all(Radius.circular(AppDimens.radius8))),
        width: widthBackground ?? AppDimens.sizeImage,
        height: heightBackground ?? AppDimens.sizeImage,
        child: Image.memory(
          imageData,
          fit: fit,
          width: width,
          height: height,
        ).paddingAll(AppDimens.size4),
      );
    } catch (e) {
      return const SizedBox();
    }
  }

  static Widget imageUserAvt(
    String imageData, {
    double? width,
    double? height,
  }) {
    try {
      return ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimens.radius100),
        ),
        child: Image.memory(
          ImageUtils.uriBase64ToData(imageData),
          fit: BoxFit.fill,
          height: height ?? AppDimens.sizeImageBig,
          width: width ?? AppDimens.sizeImageBig,
        ),
      );
    } catch (e) {
      return ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimens.radius100),
        ),
        child: Image.asset(
          Assets.ASSETS_IMAGES_ICON_ICON_PNG_IMAGE_DEFAULT_JPG,
          fit: BoxFit.fill,
          height: height ?? AppDimens.sizeImageBig,
          width: width ?? AppDimens.sizeImageBig,
        ),
      );
    }
  }
}

class ImageUtils {
  static Future<String> dataToUriBase64(
    XFile image,
  ) async {
    var bytes = await image.readAsBytes();

    return uint8ListToUriBase64(bytes);
  }

  static String uint8ListToUriBase64(
    Uint8List image,
  ) {
    return Uri.dataFromBytes(
      image,
    ).data!.toString();
  }

  static Uint8List uriBase64ToData(
    String base64,
  ) {
    var result = Uri.parse(base64).data!;

    return result.contentAsBytes();
  }

  static Future<String> uint8ListToTempPath(Uint8List data) async {
    // Lấy thư mục tạm
    final tempDir = await getTemporaryDirectory();

    // Tạo tên file tạm
    final file = File(
        '${tempDir.path}/temp_image_${DateTime.now().millisecondsSinceEpoch}.png');

    // Ghi dữ liệu ảnh vào file
    await file.writeAsBytes(data);

    // Trả về path
    return file.path;
  }
}

class ImageAppExt {
  static Widget imageIconAndNameApp() {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.ASSETS_ECERT_ICONAPP_SVG,
          height: AppDimens.iconSmall.h,
        ).paddingOnly(
          right: AppDimens.defaultPadding,
        ),
        // TextUtils(
        //   text: LocaleKeys.app_name,
        //   fontWeight: FontWeight.w700,
        //   color: AppColors.lightPrimaryColor,
        // ),
      ],
    );
  }
}
