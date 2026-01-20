class DocumentFiles {
  /// Ảnh mặt trước CCCD
  String frontCardFileId;

  /// Ảnh mặt sau CCCD
  String backCardFileId;

  /// Ảnh chân dung
  String bodyFileId;

  /// Ảnh ký tay
  String handSignFileId;

  /// Ảnh đăng ký kinh doanh
  String businessRegistrationFileId;

  DocumentFiles({
    this.frontCardFileId = "",
    this.backCardFileId = "",
    this.bodyFileId = "",
    this.handSignFileId = "",
    this.businessRegistrationFileId = "",
  });

  Map<String, dynamic> toJson() {
    // return {
    //   "frontCardFileId": "fc2a2776-21cd-4cba-9a58-341d6c6187dd.jpg",
    //   "backCardFileId": "fc2a2776-21cd-4cba-9a58-341d6c6187dd.jpg",
    //   "bodyFileId": "fc2a2776-21cd-4cba-9a58-341d6c6187dd.jpg",
    //   "handSignFileId": "699579d0-29ad-4a0d-b61e-18d5700aff24.jpg",
    //   "businessRegistrationFileId": "899a9b17-c370-4a94-9e21-f0bf5b6118d8.jpg",
    // };
    return {
      'frontCardFileId': frontCardFileId,
      'backCardFileId': backCardFileId,
      'bodyFileId': bodyFileId,
      'handSignFileId': handSignFileId,
      'businessRegistrationFileId': businessRegistrationFileId,
    };
  }

    Map<String, dynamic> toJsonPersonal() {
    return {
      'frontCardFileId': frontCardFileId,
      'backCardFileId': backCardFileId,
      'bodyFileId': bodyFileId,
      'handSignFileId': handSignFileId,
    };
  }



  setFrontCardFileId(String frontCardFileId) {
    this.frontCardFileId = frontCardFileId;
  }

  setBackCardFileId(String backCardFileId) {
    this.backCardFileId = backCardFileId;
  }

  setBodyFileId(String bodyFileId) {
    this.bodyFileId = bodyFileId;
  }

  setHandSignFileId(String handSignFileId) {
    this.handSignFileId = handSignFileId;
  }

  setBusinessRegistrationFileId(String businessRegistrationFileId) {
    this.businessRegistrationFileId = businessRegistrationFileId;
  }
}
