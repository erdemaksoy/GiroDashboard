import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '_auth/login/view/login_view.dart';
import '_home/dashboard/view/home_view.dart';
import '_kullanici_yonetimi/kullanici_ekle/view/kullanici_ekle_view.dart';
import '_kullanici_yonetimi/kullanici_listesi/model/kullanici_listesi_model.dart';
import '_kullanici_yonetimi/kullanici_listesi/view/kullanici_listesi_view.dart';
import '_kullanici_yonetimi/rol_ekle/view/rol_ekle_view.dart';
import '_kullanici_yonetimi/rol_listesi/view/rol_listesi_view.dart';
import '_kullanici_yonetimi/yetki/model/yetki_model.dart';
import '_muhasebe/kasiyer_acik/view/kasiyer_acik_view.dart';
import '_muhasebe/kasiyer_performans/view/kasiyer_performans_view.dart';
import '_satis/odeme_tipi/view/odeme_tipi_view.dart';
import '_satis/saatlik_satis/view/saatlik_satis_view.dart';
import '_satis/urun_satis/view/urun_satis_view.dart';
import '_stok/en_cok_satan/view/encok_satan_urun_view.dart';
import '_stok/gimsa_satis/view/gimsa_satis_view.dart';
import '_stok/stok_hareket/view/stok_hareket_view.dart';
import '_tanim/dashboard_tanim/view/dashboard_tanim.dart';
import '_tanim/rapor_grup_tanim/view/rapor_grup_tanim_view.dart';
import '_tanim/rapor_tanim/view/rapor_tanim_ekle_view.dart';
import '_tanim/rapor_tanim/view/rapor_tanim_view.dart';
import 'core/auth/auth_manager.dart';
import 'core/auth/cache_manager.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with CacheManager {
  late KullaniciListesiModel? user;
  List<YetkiModel> yetkiModels = [];

  @override
  void initState() {
    super.initState();
    user = context.read<AuthenticationManager>().model;
    yetkiModels = context.read<AuthenticationManager>().yetkiModel;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPictureSize: Size(270, 100),
              decoration: const BoxDecoration(
                color: Color(0xFF212A3E),
                gradient: LinearGradient(
                  transform: GradientRotation(4),
                  colors: [Color(0xFF212A3E), Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.45, 1],
                  tileMode: TileMode.clamp,
                ),
              ),
              currentAccountPicture: Image.asset(
                "assets/images/posbacklogotransparent.png",
              ),
              accountName: Padding(padding: EdgeInsets.only(top: 10)),
              accountEmail: Text(
                "${user?.kullaniciIsim}",
                style: TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            yetkiModels.isEmpty
                ? SizedBox()
                : Column(children: [
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomeView()),
                        );
                      },
                      title: const Text(
                        "Ana sayfa",
                      ),
                    ),
                    yetkiModels
                            .singleWhere((element) => element.menuAdi == "Stok")
                            .izlemeYetki!
                        ? ExpansionTile(
                            title: const Text(
                              "Stok",
                            ),
                            children: [
                              yetkiModels
                                      .singleWhere((element) =>
                                          element.menuAdi ==
                                          "En Çok Satan Ürünler")
                                      .izlemeYetki!
                                  ? ListTile(
                                      leading: const Icon(Icons.arrow_forward),
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SatanUrun()),
                                        );
                                      },
                                      title: const Text(
                                        "En Çok Satan Ürünler",
                                      ),
                                    )
                                  : Container(),
                              yetkiModels
                                      .singleWhere((element) =>
                                          element.menuAdi ==
                                          "Stok Hareket İzleme")
                                      .izlemeYetki!
                                  ? ListTile(
                                      leading: const Icon(Icons.arrow_forward),
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const StokIzleme()),
                                        );
                                      },
                                      title: const Text(
                                        "Stok Hareket İzleme",
                                      ),
                                    )
                                  : Container(),
                              yetkiModels
                                      .singleWhere((element) =>
                                          element.menuAdi == "Gimsa Satış")
                                      .izlemeYetki!
                                  ? ListTile(
                                      leading: const Icon(Icons.arrow_forward),
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const GimsaSatis()),
                                        );
                                      },
                                      title: const Text(
                                        "Gimsa Satış",
                                      ),
                                    )
                                  : Container()
                            ],
                          )
                        : Container(),
                    yetkiModels
                            .singleWhere(
                                (element) => element.menuAdi == "Satış")
                            .izlemeYetki!
                        ? ExpansionTile(
                            title: const Text(
                              "Satış",
                            ),
                            children: [
                              yetkiModels
                                      .singleWhere((element) =>
                                          element.menuAdi ==
                                          "Saatlik Satış Dağılım")
                                      .izlemeYetki!
                                  ? ListTile(
                                      leading: const Icon(Icons.arrow_forward),
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SaatlikSatis()),
                                        );
                                      },
                                      title: const Text(
                                        "Saatlik Satış Dağılım",
                                      ),
                                    )
                                  : Container(),
                              yetkiModels
                                      .singleWhere((element) =>
                                          element.menuAdi ==
                                          "Ödeme Tipli Satış")
                                      .izlemeYetki!
                                  ? ListTile(
                                      leading: const Icon(Icons.arrow_forward),
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const OdemeTipli()),
                                        );
                                      },
                                      title: const Text(
                                        "Ödeme Tipli Satış",
                                      ),
                                    )
                                  : Container(),
                              yetkiModels
                                      .singleWhere((element) =>
                                          element.menuAdi ==
                                          "Ürün Satış Belgeleri")
                                      .izlemeYetki!
                                  ? ListTile(
                                      leading: const Icon(Icons.arrow_forward),
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SatisBelge()),
                                        );
                                      },
                                      title: const Text(
                                        "Ürün Satış Belgeleri",
                                      ),
                                    )
                                  : Container(),
                            ],
                          )
                        : Container(),
                    yetkiModels
                            .singleWhere(
                                (element) => element.menuAdi == "Muhasebe")
                            .izlemeYetki!
                        ? ExpansionTile(
                            title: const Text(
                              "Muhasebe",
                            ),
                            children: [
                              yetkiModels
                                      .singleWhere((element) =>
                                          element.menuAdi ==
                                          "Kasiyer Açık Fazla")
                                      .izlemeYetki!
                                  ? ListTile(
                                      leading: const Icon(Icons.arrow_forward),
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const KasiyerPage()),
                                        );
                                      },
                                      title: const Text(
                                        "Kasiyer Açık Fazla",
                                      ),
                                    )
                                  : Container(),
                              // ListTile(
                              //   leading: Icon(Icons.arrow_forward),
                              //   onTap: () {
                              //     Navigator.pop(context);
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(builder: (context) => KDVPage()),
                              //     );
                              //   },
                              //   title: Text(
                              //     "KDV Durumu",
                              //     style: GoogleFonts.roboto(
                              //       textStyle:
                              //           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              //     ),
                              //   ),
                              // ),
                              // ListTile(
                              //   leading: Icon(Icons.arrow_forward),
                              //   onTap: () {
                              //     Navigator.pop(context);
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => const DenemePage()),
                              //     );
                              //   },
                              //   title: Text(
                              //     "DENEME",
                              //     style: GoogleFonts.roboto(
                              //       textStyle:
                              //           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              //     ),
                              //   ),
                              // ),
                              yetkiModels
                                      .singleWhere((element) =>
                                          element.menuAdi ==
                                          "Kasiyer Performans")
                                      .izlemeYetki!
                                  ? ListTile(
                                      leading: const Icon(Icons.arrow_forward),
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const KasiyerPerformansPage()),
                                        );
                                      },
                                      title: const Text(
                                        "Kasiyer Performans",
                                      ),
                                    )
                                  : Container(),
                            ],
                          )
                        : Container(),
                    yetkiModels
                            .singleWhere(
                                (element) => element.menuAdi == "Tanımlar")
                            .izlemeYetki!
                        ? ExpansionTile(
                            title: const Text(
                              "Tanımlar",
                            ),
                            children: [
                              yetkiModels
                                      .singleWhere((element) =>
                                          element.menuAdi ==
                                          "Rapor Grup Tanımları")
                                      .izlemeYetki!
                                  ? ListTile(
                                      leading: const Icon(Icons.arrow_forward),
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Grup()),
                                        );
                                      },
                                      title: const Text(
                                        "Rapor Grup Tanımları",
                                      ),
                                    )
                                  : Container(),
                              ListTile(
                                leading: const Icon(Icons.arrow_forward),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Dashboard()),
                                  );
                                },
                                title: const Text(
                                  "Dashboard Tanımları",
                                ),
                              ),
                              yetkiModels
                                      .singleWhere((element) =>
                                          element.menuAdi == "Rapor Tanımları")
                                      .izlemeYetki!
                                  ? ListTile(
                                      leading: const Icon(Icons.arrow_forward),
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Rapor()),
                                        );
                                      },
                                      title: const Text(
                                        "Rapor Tanımları",
                                      ),
                                    )
                                  : Container(),
                              yetkiModels
                                      .singleWhere((element) =>
                                          element.menuAdi == "Rapor Tanımları")
                                      .izlemeYetki!
                                  ? ListTile(
                                      leading: const Icon(Icons.arrow_forward),
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RaporEkleView()),
                                        );
                                      },
                                      title: const Text(
                                        "Rapor Tanımı Ekle",
                                      ),
                                    )
                                  : Container(),
                            ],
                          )
                        : Container(),
                    yetkiModels
                            .singleWhere((element) =>
                                element.menuAdi == "Kullanıcı Yönetimi")
                            .izlemeYetki!
                        ? ExpansionTile(
                            title: const Text(
                              "Kullanıcı Yönetimi",
                            ),
                            children: [
                              yetkiModels
                                      .singleWhere((element) =>
                                          element.menuAdi == "Kullanıcı Ekle")
                                      .izlemeYetki!
                                  ? ListTile(
                                      leading: const Icon(Icons.arrow_forward),
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  KullaniciEklePage()),
                                        );
                                      },
                                      title: const Text(
                                        "Kullanıcı Ekle",
                                      ),
                                    )
                                  : Container(),
                              yetkiModels
                                      .singleWhere((element) =>
                                          element.menuAdi ==
                                          "Kullanıcı Listesi")
                                      .izlemeYetki!
                                  ? ListTile(
                                      leading: const Icon(Icons.arrow_forward),
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const KullaniciListesiPage()),
                                        );
                                      },
                                      title: const Text(
                                        "Kullanıcı Listesi",
                                      ),
                                    )
                                  : Container(),
                              yetkiModels
                                      .singleWhere((element) =>
                                          element.menuAdi == "Rol Ekle")
                                      .izlemeYetki!
                                  ? ListTile(
                                      leading: const Icon(Icons.arrow_forward),
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RolEklePage()),
                                        );
                                      },
                                      title: const Text(
                                        "Rol Ekle",
                                      ),
                                    )
                                  : Container(),
                              yetkiModels
                                      .singleWhere((element) =>
                                          element.menuAdi == "Rol Listesi")
                                      .izlemeYetki!
                                  ? ListTile(
                                      leading: const Icon(Icons.arrow_forward),
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RolListesiPage()),
                                        );
                                      },
                                      title: const Text(
                                        "Rol Listesi",
                                      ),
                                    )
                                  : Container(),
                            ],
                          )
                        : Container(),
                  ]),
            const SizedBox(
              height: 40,
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_sharp,
                color: Colors.red,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              title: const Text(
                "logout",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
