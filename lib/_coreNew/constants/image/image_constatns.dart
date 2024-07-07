class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance {
    _instace ??= ImageConstants._init();
    return _instace!;
  }

  ImageConstants._init();

  String get logo => toJpeg("posbacklogo");
  String get posbacklogo => toPng("posbacklogotransparent");
  String get hotDog => toPng("hotdogs");

  String toPng(String name) => "assets/images/$name.png";
  String toJpeg(String name) => "assets/images/$name.jpeg";
  String toJpg(String name) => "assets/images/$name.jpg";
}
