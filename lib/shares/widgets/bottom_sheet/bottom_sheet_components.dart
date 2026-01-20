import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';

class BottomSheetComponents {
  static Widget buildItemBottom({
    required String icon,
    required String title,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Column(
        children: [
          SvgPicture.asset(icon),
          title != ""
              ? TextUtils(
                  text: title,
                  availableStyle: StyleEnum.bodyVerySmall,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
