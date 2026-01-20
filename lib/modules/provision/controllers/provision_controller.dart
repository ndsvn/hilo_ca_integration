import 'package:ecert/base_utils/base_src.dart';

import '../../../shares/shares_src.dart';
import '../provision.src.dart';

class ProvisionECretController extends BaseGetxController {
  AppController appController = Get.find<AppController>();
  late ProvisionECertRepository provisionRepository =
      ProvisionECertRepository(this);
  String html = "";
  RxBool acceptProvision = false.obs;

  @override
  Future<void> onInit() async {
    showLoading();
    await provisionRepository.getPolicyRepository().then((value) {
      html = value.data ?? "";
    });
    hideLoading();
    super.onInit();
  }
}
