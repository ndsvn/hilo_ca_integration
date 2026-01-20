import 'dart:typed_data';

import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/modules/modules_src.dart';
import 'package:ecert/routes/routes.dart';
import 'package:ecert/shares/shares_src.dart';

import '../../../generated/locales.g.dart';

abstract class FileOcrCtrl extends BaseGetxController {
  late final RepositoryFile repositoryFile = RepositoryFile(this);

  Future<void> upFilesAndOCR(Uint8List image) async {
    try {
      showLoadingOverlay();
      BaseResponseBECert<FileInfoData> response =
          await repositoryFile.upFileAndOCR(image);
      // BaseResponseBECert<FileInfoData> response =
      //     BaseResponseBECert<FileInfoData>.fromJson(
      //   {
      //     "status": true,
      //     "timestamp": "2025-07-13 20:49:26",
      //     "transId": "0a496a06-0ec6-474b-99dc-71d10f987fbb",
      //     "data": {
      //       "fileInfo": {
      //         "size": 165168,
      //         "filename": "2551b55e-88fe-4933-a7c1-3efc2f936273.jpg"
      //       },
      //       "info": {
      //         "department": "UBND HUYỆN YÊN MỸ PHÒNG TÀI CHÍNH - KẾ HOẠCH",
      //         "businessNumber": "8938532561-001",
      //         "businessRegistration": "05D8006817",
      //         "businessRegistrationDate": "23/05/2025",
      //         "businessHouseholdName": "HỘ KINH DOANH NGÔ THỊ HANH 1974",
      //         "businessPhone": "0819513688",
      //         "businessAddress":
      //             "Thôn Ống Tố, Thị trấn Yên Mỹ, Huyện Yên Mỹ, Tỉnh Hưng Yên, Việt Nam",
      //         "businessEntity": "Cá nhân",
      //         "ownerDob": "31/08/1974",
      //         "ownerAddress":
      //             "Thôn Trai Trang, Thị trấn Yên Mỹ, Huyện Yên Mỹ, Tỉnh Hưng Yên Việt Nam",
      //         "ownerIssueDate": "25/08/2021",
      //         "ownerCitizenNumber": "033174013595",
      //         "ownerFullName": "NGÔ THỊ HANH"
      //       }
      //     }
      //   },
      //   func: (x) => FileInfoData.fromJson(x),
      // );

      if (response.status) {
        // if (response.data?.info?.ownerCitizenNumber !=
        //     AppInfoCert.instance.cusInfo.code) {
        //   showFlushNoti(
        //     LocaleKeys.eCert_DKKD_invalidCCCDTitle.tr,
        //     content: LocaleKeys.eCert_DKKD_invalidCCCDContent.tr,
        //     isSuccess: false,
        //   );
        //   return;
        // }
        FileInfoData? fileInfoData = response.data;

        AppInfoCert.instance.setFileInfoData(fileInfoData);

        Get.offAndToNamed(AppRoutes.routeResultOcrView,
            arguments: fileInfoData?.info);
      } else {
        showFlushNoti(
          LocaleKeys.eCert_DKKD_invalidCCCDTitle.tr,
          content: response.errors?.firstOrNull?.message?.vn ?? "",
          isSuccess: false,
        );
      }
    } finally {
      hideLoadingOverlay();
    }
  }
}
