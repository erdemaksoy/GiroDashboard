extension EditFormatDate on DateTime? {
  String get toFormatEdit {
    String? Day = this?.day.toString().padLeft(2, '0');
    String? Month = this?.month.toString().padLeft(2, '0');
    String? Year = this?.year.toString();
    String sTarih = "${Day}.${Month}.${Year}";
    return sTarih;
  }
}
