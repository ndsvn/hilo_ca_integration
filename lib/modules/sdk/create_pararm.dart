import 'package:ecert/modules/modules_src.dart';
import 'package:uuid/uuid.dart';

class CreatePararmSDK {
  static SdkRequestAPI sdkRequestAPI(
    SdkRequestModel sdkRequestModel,
    VerifyRequestModel sendNfcRequestModel,
  ) {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    String transactionId = IdGenerator.randomIKey;

    String hash = VerificationUtils.buildRequestHash(
      sdkRequestModel.merchantKey,
      sdkRequestModel.secretKey,
      transactionId,
      timestamp,
      sendNfcRequestModel.dg1DataB64 ?? "",
    );

    SdkRequestAPI sdkRequestAPI = SdkRequestAPI(
      merchantKey: sdkRequestModel.merchantKey,
      transactionId: transactionId,
      timestamp: timestamp,
      hash: hash,
    );
    return sdkRequestAPI;
  }
}

abstract class IdGenerator {
  IdGenerator._();

  static const _uuid = Uuid();

  static String generate() {
    return _uuid.v4();
  }

  static String get randomIKey {
    return _uuid.v4();
  }
}
