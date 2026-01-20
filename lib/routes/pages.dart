import 'package:dio_log_sds/dio_log_sds.dart';
import 'package:hilo_ca_integration/modules/account/resset_password/reset_password_src.dart';
import 'package:hilo_ca_integration/modules/detail_cts/detail_cts.src.dart';
import 'package:hilo_ca_integration/modules/list_cts/list_cts.src.dart';
import 'package:hilo_ca_integration/modules/modules_src.dart';
import 'package:hilo_ca_integration/modules/splash/views/splash_page.dart';
import 'package:hilo_ca_integration/modules/verify/live_ness/live_ness_kyc.src.dart';
import 'package:hilo_ca_integration/modules/verify/take_picture_card_kyc/take_picture_card_kyc.src.dart';
import 'package:hilo_ca_integration/modules/verify/update_photo_information_kyc/update_photo_information_kyc.src.dart';
import 'package:hilo_ca_integration/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class RoutePage {
  static var route = [
    GetPage(
      name: AppRoutes.routeSplash,
      page: () => const SplashPage(),
      preventDuplicates: false,
    ),
    GetPage(
      name: AppRoutes.routeLogin,
      page: () => const LoginPage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: AppRoutes.routeHome,
      page: () => const HomePage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: AppRoutes.routePasswordSecurity,
      page: () => const PasswordSecurityPage(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.routeAuthenticationNfc,
      page: () => const ScanNfcKycPage(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.routeInformationNfc,
      page: () => const NfcInformationUserPage(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.routeScanQR,
      page: () => const QRGuidePage(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.routeTakePictureCardKyc,
      page: () => const TakePictureCardKycPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeUpdatePhoToInformationKyc,
      page: () => const UpdatePhotoInformationPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeLiveNessKyc,
      page: () => const LiveNessKycPage(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.routeFaceMatchingResult,
      page: () => const FaceMatchingResultPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeSupport,
      page: () => const SupportPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeDioLog,
      page: () => const HttpLogListWidget(),
    ),
    GetPage(
      name: AppRoutes.routeResetPass,
      page: () => const ResetPasswordPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeInfoCTS,
      page: () => const InfoCTSPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeConfirmCTS,
      page: () => const ConfirmCTSPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeListCTS,
      page: () => const ListCTSPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeDetailCTS,
      page: () => const DetailCTSPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeGuideCert,
      page: () => const GuideCert(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeGuideNFC,
      page: () => const GuideNFC(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeProvisionECertPage,
      page: () => const ProvisionECertPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeGuideUploadRegistration,
      page: () => const GuideUploadRegistrationView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeGuideUploadRegistrationImgView,
      page: () => const GuideUploadRegistrationImgView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeGuideUploadRegistrationFileView,
      page: () => const GuideUploadRegistrationFileView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeResultOcrView,
      page: () => const ResultOcrView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.routeSystemInvoices,
      page: () => const SystemInvoicesPage(),
      transition: Transition.rightToLeft,
    ),
  ];
}
