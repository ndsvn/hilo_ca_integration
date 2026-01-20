import 'package:ecert/shares/shares_src.dart';

import 'list_cts_model.dart';

class ListCtsModelView {
  final ListCtsModel listCtsModel;
  final IssuerName issuerName;
  final DistinguishedName distinguishedName;

  ListCtsModelView({
    required this.listCtsModel,
    required this.issuerName,
    required this.distinguishedName,
  });

  factory ListCtsModelView.fromListCtsModel(ListCtsModel listCtsModel) {
    return ListCtsModelView(
      listCtsModel: listCtsModel,
      issuerName: IssuerName.fromDnString(listCtsModel.issuer),
      distinguishedName: DistinguishedName.fromDnString(listCtsModel.subject),
    );
  }
}
