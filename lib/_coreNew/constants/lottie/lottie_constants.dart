class LottieConstants {
  static LottieConstants? _instance;
  static LottieConstants get instance {
    _instance ??= LottieConstants._init();
    return _instance!;
  }

  LottieConstants._init();

  String get themeLottie => toJson("deneme4");
  String toJson(String name) => "assets/lottie/$name.json";
}
