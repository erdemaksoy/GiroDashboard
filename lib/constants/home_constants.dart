import 'package:flutter/material.dart';

class HomeConstants {
  static const String title = 'Dashboard Example';
  static const String varlik3Label = 'Mavi - Varlık 3';
  static const String varlik4Label = 'Sarı - Varlık 4';
  static const String varlik5Label = 'Turuncu - Varlık 5';
  static const String varlik6Label = 'Mor - Varlık 6';
  static const String varlik7Label = 'Yeşil - Varlık 7';
  static const String varlik8Label = 'Pembe - Varlık 8';
  static const String dashboardTitle = 'Dashboard';
  static const String yeniPieChartEkle = 'Yeni PieChart Ekle';
  static const String label = 'Label';
  static const String yuzdelikDeger = 'Yüzdelik Değer (%)';
  static const String pieChartDetaylari = 'PieChart Detayları';
  static const String kapat = 'Kapat';
  static const String kullaniciAdi = "Kullanıcı Adı";
}

final appTheme = ThemeData(
  listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18)),
  textTheme: TextTheme(),
  appBarTheme: AppBarTheme(
    titleTextStyle: const TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
    iconTheme: const IconThemeData(color: Colors.black),
    color: Color(int.parse('0xFF212A3E')),
  ),
  scaffoldBackgroundColor: Color(int.parse('0xFFF6F5F5')),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.red,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          return Color(0xFF212A3E); // Metin rengini burada ayarlayın
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          return Colors.white; // Change this to the color you want
        },
      ),
    ),
  ),
);
