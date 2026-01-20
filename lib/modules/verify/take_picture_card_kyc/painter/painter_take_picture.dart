import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:flutter/material.dart';

import '../../../../shares/shares_src.dart';

class CustomShapePainterTakePicture extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Lấy kích thước màn hình
    size = Get.size;
    Paint paint = Paint();

    // Tính toán các thông số cho hình chữ nhật trung tâm
    final centerX = size.width / 2; // Tâm X
    final centerY = size.height / 3.3; // Tâm Y
    final width = size.width - 50; // Chiều rộng
    final height = size.height / 3; // Chiều cao

    // Tạo Path để cắt vùng hình chữ nhật trung tâm
    Path clipPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRect(Rect.fromCenter(
          center: Offset(centerX, centerY), width: width, height: height));
    clipPath.fillType = PathFillType.evenOdd;

    // Cắt canvas theo vùng định nghĩa trong clipPath
    canvas.clipPath(clipPath);

    // Thiết lập màu nền
    paint.color = AppColors.colorBackgroundWhite;

    // Vẽ các khối màu
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), paint);

    // Tạo đường viền xung quanh hình chữ nhật trung tâm
    paint
      ..color = AppColors.colorPrimary1
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Path borderPath = Path();
    borderPath.addRect(Rect.fromCenter(
        center: Offset(centerX, centerY), width: width, height: height));
    canvas.drawPath(borderPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
