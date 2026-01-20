class AppStr {
  static const String appName = 'EasyDocs';
  static const String emptyList = "Danh Sách trống";
  static const String cancel = "Hủy";
  static const String confirm = "Xác nhận";
  static const String reject = "Từ chối";
  static const String approve = "Phê duyệt";
  static const String edit = "Sửa";
  static const String save = "Lưu";
  static const String empty = "Trống";
  static const String delete = "Xoá";

  static const String accept = "Đồng ý";
  static const String close = "Đóng";
  static const String notification = "Thông báo";
  static const String overview = "Biểu đồ";
  static const String document = "Hồ sơ";
  static const String complete = "Hoàn thành";

  static const List<String> listWeekdayLabels = [
    "CN",
    "T2",
    "T3",
    "T4",
    "T5",
    "T6",
    "T7"
  ];

  //error
  static const String errorConnectFailedStr =
      'Không thể kết nối tới máy chủ\nQuý khách vui lòng kiểm tra lại kết nối mạng.';
  static const String errorConnectTimeOut =
      'Không có phản hồi từ hệ thống, Quý khách vui lòng thử lại sau';
  static const String errorInternalServer =
      'Lỗi xử lý hệ thống\nQuý khách vui lòng thử lại sau!!!';
  static const String error502 =
      'Server đang bảo trì. Quý khách vui lòng quay lại sau.';
  static const String error503 =
      'Server đang bảo trì. Quý khách vui lòng quay lại sau một vài phút.';
  static const String error400 = 'Dữ liệu gửi đi không hợp lệ!';
  static const String error404 =
      'Không tìm thấy đường dẫn này, xin vui lòng liên hệ Admin';
  static const String error401 =
      'Phiên đăng nhập đã hết hạn. Quý khách vui lòng đăng nhập lại';
  static const String authenticationTitle = "Vui lòng quét vân tay";
  static const String cancelButton = "Huỷ";
  static const String setting = "Cài đặt";
  static const String authenticationContent = "Vui lòng cài đặt vân tay";
  static const String lockout = "Vui lòng kích hoạt bảo mật vân tay";
  static const String authentication = "Xác thực";
  static const String authenticationSuccess = "Xác thực thành công";
  static const String authenticationError = "Vân tay không hợp lệ";
  static const String noAuthenticationError =
      "Quý khách chưa cài đặt phương thức xác thực nào! Vui lòng cài đặt phương thức xác thực để tiếp tục sử dụng.Vân tay không hợp lệ";
  static const String msgUnavailable =
      "Quý khách vui lòng thoát ứng dụng và đặt mật khẩu máy hoặc vân tay để dùng chức năng lưu mật khẩu!";
  static const String msgLimit =
      "Quý khách đã xác thực sai quá nhiều lần. Xin vui lòng thử lại sau!";
  static const String noteSettingBiometricFace =
      "Quý khách chưa cài đặt đăng nhập bằng khuôn mặt. Vui lòng đăng nhập vào tài khoản bằng mật khẩu và cài đặt xác thực khuôn mặt trong phần cài đặt";
  static const String noteSettingBiometricFingerprint =
      "Quý khách chưa cài đặt đăng nhập bằng vân tay. Vui lòng đăng nhập vào tài khoản bằng mật khẩu và cài đặt xác thực vân tay trong phần cài đặt";

  //base input
  static const String inputEmpty = " không được bỏ trống!";
  static const String errorIdentityCard =
      "Căn cước công dân là số có 9-12 chữ số";
  static const String errorPhoneNumberType =
      "Số điện thoại phải từ 10 số";
  static const String errorTaxCodeCount = "Mã số thuế gồm 10-13 chữ số";
  static const String errorEmail = "Email không hợp lệ";
}
