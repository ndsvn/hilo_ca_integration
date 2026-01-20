part of 'qr_page.dart';

Widget _buildBody(QRController controller) {
  return Scaffold(
    backgroundColor: AppColors.colorWhite,
    body: Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              QrScannerPage(
                onScanResult: (result) {
                  controller.getData(result);
                },
              ),
              Positioned.fill(
                child: CustomPaint(
                  painter: QRScanOverlayPainter(
                    isSquare: true,
                    cutOutBorderRadius: 1,
                    overlayColor: AppColors.colorWhite,
                    borderColor: Colors.white.withOpacity(0.8),
                    borderWidth: 2.0,
                    cornerColor: AppColors.lightPrimaryColor,
                    cornerLength: 26,
                    cornerStrokeWidth: 4.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildListGuild(), // hiển thị dưới cùng
      ],
    ),
  );
}

Widget _buildListGuild() {
  return Align(
    alignment: Alignment.topCenter,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils(
          text: LocaleKeys.eCert_qr_qrTitle.tr,
          availableStyle: StyleEnum.subBold,
          color: AppColors.lightPrimaryColor,
          maxLine: 3,
        ).paddingOnly(left: AppDimens.paddingVerySmall),
        GuideComponent.builsStep(
            LocaleKeys.eCert_qr_number1, LocaleKeys.eCert_qr_qrTitle1.tr),
        const SizedBox(height: AppDimens.paddingSize5),
        GuideComponent.builsStep(
            LocaleKeys.eCert_qr_number2, LocaleKeys.eCert_qr_qrTitle2.tr),
        const SizedBox(height: AppDimens.paddingSize5),
        UtilWidget.sizedBox50,
      ],
    ).paddingSymmetric(horizontal: AppDimens.paddingSize5),
  );
}

class QRScanOverlayPainter extends CustomPainter {
  QRScanOverlayPainter({
    this.cutOutWidth,
    this.cutOutHeight,
    this.cutOutBorderRadius = 16,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 0.55),
    this.borderColor = Colors.white,
    this.borderWidth = 2.0,
    this.cornerColor,
    this.cornerLength = 28,
    this.cornerStrokeWidth = 4.0,
    this.isSquare = true,
  });

  /// Nếu không truyền, tự tính theo tỉ lệ màn hình
  final double? cutOutWidth;
  final double? cutOutHeight;
  final double cutOutBorderRadius;

  final Color overlayColor;
  final Color borderColor;
  final double borderWidth;

  final Color? cornerColor;
  final double cornerLength;
  final double cornerStrokeWidth;

  /// Nếu true -> khung vuông; false -> dùng cutOutWidth/Height
  final bool isSquare;

  @override
  void paint(Canvas canvas, Size size) {
    // ===== 1) Tính khung quét ở giữa =====
    final w = cutOutWidth ??
        min(size.width * 0.82, size.height * 0.55); // rộng mặc định
    final h = isSquare
        ? w
        : (cutOutHeight ??
            min(size.height * 0.32, size.width * 0.6)); // cao mặc định

    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: w,
      height: h,
    );
    final rrect =
        RRect.fromRectAndRadius(rect, Radius.circular(cutOutBorderRadius));

    // ===== 2) Vẽ overlay tối + khoét lỗ =====
    final overlayPath = Path()..addRect(Offset.zero & size);
    final cutoutPath = Path()..addRRect(rrect);
    final evenOdd =
        Path.combine(PathOperation.difference, overlayPath, cutoutPath);

    final overlayPaint = Paint()..color = overlayColor;
    canvas.drawPath(evenOdd, overlayPaint);

    // ===== 3) Viền khung =====
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawRRect(rrect, borderPaint);

    // ===== 4) 4 góc nổi bật (tuỳ chọn) =====
    final cColor = cornerColor ?? borderColor;
    final cornerPaint = Paint()
      ..color = cColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = cornerStrokeWidth
      ..strokeCap = StrokeCap.round;

    final l = cornerLength;
    // top-left
    canvas.drawLine(rect.topLeft, rect.topLeft + Offset(l, 0), cornerPaint);
    canvas.drawLine(rect.topLeft, rect.topLeft + Offset(0, l), cornerPaint);
    // top-right
    canvas.drawLine(rect.topRight, rect.topRight + Offset(-l, 0), cornerPaint);
    canvas.drawLine(rect.topRight, rect.topRight + Offset(0, l), cornerPaint);
    // bottom-left
    canvas.drawLine(
        rect.bottomLeft, rect.bottomLeft + Offset(l, 0), cornerPaint);
    canvas.drawLine(
        rect.bottomLeft, rect.bottomLeft + Offset(0, -l), cornerPaint);
    // bottom-right
    canvas.drawLine(
        rect.bottomRight, rect.bottomRight + Offset(-l, 0), cornerPaint);
    canvas.drawLine(
        rect.bottomRight, rect.bottomRight + Offset(0, -l), cornerPaint);
  }

  @override
  bool shouldRepaint(covariant QRScanOverlayPainter oldDelegate) => true;
}
