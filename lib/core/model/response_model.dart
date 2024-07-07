class ResponseModel<T> {
  late String messagge;
  final String title;
  final bool isSucced;
  late T? body;

  ResponseModel(this.messagge, this.title, this.isSucced, this.body);
}
