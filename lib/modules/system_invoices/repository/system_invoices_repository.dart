import 'package:ecert/cores/enum/enum_request_method.dart';
import 'package:ecert/cores/values/values.src.dart';

import '../../../../base_utils/base_src.dart';
import '../system_invoices.src.dart';

class RepositorySystemInvoices extends BaseRepository {
  RepositorySystemInvoices(super.controller);

  Future<BaseResponseListBECert<SystemInvoicesResponse>>
      getSystemInvoices() async {
    var response = await baseSendRequest(
      AppUrl.getSystemInvoices,
      EnumRequestMethod.get,
    );

    // var response = {
    //   "status": true,
    //   "timestamp": "2025-08-28 20:45:52",
    //   "transId": "3a9515f3-9175-4daf-80a8-c56baded8b61",
    //   "totalItem": 2,
    //   "data": [
    //     {
    //       "id": "131a5928-ca4c-4034-a16f-bf04724a8e41",
    //       "code": "HILO.INV.78",
    //       "name": "[HILO] Hệ thống hoá đơn điện tử 78",
    //       "host": "https://uat78.hilo.com.vn"
    //     },
    //     {
    //       "id": "765d65e8-7b84-4a69-b9ca-41b92ead494b",
    //       "code": "HILO.INV.9PAY",
    //       "name": "[9PAY] Hệ thống hoá đơn điện tử 9PAY",
    //       "host": "https://9payinvoice.hilo.com.vn"
    //     }
    //   ]
    // };

    return BaseResponseListBECert.fromJson(
      response,
      (x) => SystemInvoicesResponse.fromJson(x),
    );
  }
}
