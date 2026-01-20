class ChipFilterModel {
  String title;
  int? value;
  String fromDate;
  String toDate;
  ChipFilterModel({
    required this.title,
    this.value,
    this.fromDate = '',
    this.toDate = '',
  });
}
