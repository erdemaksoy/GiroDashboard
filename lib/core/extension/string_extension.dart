extension LastNumberGet on String {
  int get tolastNumberget {
    int index = this.lastIndexOf("-");
    print(index);
    return int.parse(this.substring(index + 1));
  }

  String toReplaceLastValue(int i) {
    String sayi = i.toString();
    return replaceRange(this.length - sayi.length, this.length, i.toString());
  }
}
