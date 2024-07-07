
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../classNav.dart';
import '../../../core/auth/auth_manager.dart';
import '../../../core/components/table/build_table_row.dart';
import '../../../service/rol/rol_service.dart';
import '../../rol_listesi/model/rol_listesi_model.dart';
import '../model/kullanici_ekle_model.dart';
import '../viewmodel/kullanici_ekle_viewmodel.dart';

class KullaniciEklePage extends StatefulWidget {
  KullaniciEklePage({Key? key, this.veri}) : super(key: key);
  KullaniciEkleModel? veri;

  @override
  State<KullaniciEklePage> createState() => _KullaniciEklePageState();
}

class _KullaniciEklePageState extends State<KullaniciEklePage> {
  List<RolListeModel> rolModels = [];
  String? myRol;
  final KullaniciEkleViewModel viewModel = KullaniciEkleViewModel();
  AuthenticationManager get readAuthManager =>
      context.read<AuthenticationManager>();
  String selectedDashboard = 'Seçim Yapınız';
  void openFiles() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles();
    if (resultFile != null) {
      PlatformFile file = resultFile.files.first;
      print(file.bytes);
      print(file.extension);
      print(file.path);
    } else {
      print("error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rolIsim();
  }

  Future<void> rolIsim() async {
    IRolSercvice rolSercvice = RolService();
    final response = await rolSercvice.getRoles();
    if (response.isSucced) {
      rolModels = response.body;
    }
    if (widget.veri != null) {
      print(widget.veri!.kullRolid);
      RolListeModel model = rolModels
          .singleWhere((element) => element.rolId == widget.veri!.kullRolid);
      myRol = model.rolAciklama;
    }
    print(myRol);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Kullanıcı Ekle",
          ),
        ),
        drawer: const NavBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 15),
          child: Center(
            child: Column(
              children: [
                Table(
                  defaultColumnWidth: const FlexColumnWidth(1),
                  children: [
                    buildTableRow(
                        'Kullanıcı Kodu :',
                        TextFormField(
                            decoration: InputDecoration(
                              hintText: widget.veri != null
                                  ? widget.veri!.kullKodu.toString()
                                  : "Kullanıcı Kodunu Giriniz",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              if (widget.veri != null && value.isNotEmpty) {
                                widget.veri!.kullKodu = value;
                              }
                              viewModel.updateKullKod(value);
                            })),
                    buildTableRow(
                        'Parola :',
                        TextFormField(
                            decoration: InputDecoration(
                              hintText: widget.veri != null
                                  ? widget.veri!.kullParola
                                  : "Parola",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              if (widget.veri != null && value.isNotEmpty) {
                                widget.veri!.kullParola = value;
                              }
                              viewModel.updateKullParola(value);
                            })),
                    buildTableRow(
                        'Kullanıcı Adı :',
                        TextFormField(
                            decoration: InputDecoration(
                              hintText: widget.veri != null
                                  ? widget.veri!.kullAdi
                                  : "Kullanıcı Adınızı Giriniz",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              if (widget.veri != null && value.isNotEmpty) {
                                widget.veri!.kullAdi = value;
                              }

                              viewModel.updateKullAdi(value);
                            })),
                    buildTableRow(
                        'Rol :',
                        DropdownButtonFormField(
                            hint: myRol != null
                                ? Text(myRol!)
                                : Text("Rol Seçiniz"),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 10,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(25),
                            items: [
                              DropdownMenuItem<String>(
                                value: "1",
                                child: Text("Yönetici"),
                              ),
                              DropdownMenuItem<String>(
                                value: "6",
                                child: Text("Depo"),
                              ),
                              DropdownMenuItem<String>(
                                value: "7",
                                child: Text("Plasiyer"),
                              ),
                              DropdownMenuItem<String>(
                                value: "8",
                                child: Text("Muhasebe"),
                              ),
                              DropdownMenuItem<String>(
                                value: "9",
                                child: Text("Supervizör"),
                              ),
                            ],
                            onChanged: (value) {
                              if (widget.veri != null && value != null) {
                                widget.veri!.kullRolid = int.parse(value);
                              }
                              viewModel.updateKullRolid(value);
                            })),
                    buildTableRow(
                        'E-Posta :',
                        TextFormField(
                            decoration: InputDecoration(
                              hintText: widget.veri != null
                                  ? widget.veri!.kullEposta
                                  : "E-posta Giriniz",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              if (widget.veri != null && value.isNotEmpty) {
                                widget.veri!.kullEposta = value;
                              }

                              viewModel.updateKullEposta(value);
                            })),
                    buildTableRow(
                        'Telefon :',
                        TextFormField(
                            decoration: InputDecoration(
                              hintText: widget.veri != null
                                  ? widget.veri!.kullTelefon
                                  : "Telefon Giriniz",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              if (widget.veri != null && value.isNotEmpty) {
                                widget.veri!.kullTelefon = value;
                              }
                              viewModel.updateKullTelefon(value);
                            })),
                    buildTableRow(
                        'Açık Şubeler :',
                        TextFormField(
                            decoration: InputDecoration(
                              hintText: widget.veri != null
                                  ? widget.veri!.acikSubeler
                                  : "Açık Şubeleri Giriniz",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              if (widget.veri != null && value.isNotEmpty) {
                                widget.veri!.acikSubeler = value;
                              }
                              viewModel.updateAcikSubeler(value);
                            })),
                    buildTableRow(
                        'Şifre Değişti Mi? :',
                        DropdownButtonFormField(
                          hint: const Text("seçim yapın"),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(25),
                          items: const [
                            DropdownMenuItem<String>(
                              value: "E",
                              child: Text("Evet"),
                            ),
                            DropdownMenuItem<String>(
                              value: "H",
                              child: Text("Hayır"),
                            ),
                          ],
                          onChanged: viewModel.updateSifreDegistiMi,
                        )),
                    buildTableRow(
                        'Dashboard Yetkisi Var Mı? :',
                        DropdownButtonFormField(
                          hint: const Text("seçim yapın"),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(25),
                          items: const [
                            DropdownMenuItem<String>(
                              value: "E",
                              child: Text("Evet"),
                            ),
                            DropdownMenuItem<String>(
                              value: "H",
                              child: Text("Hayır"),
                            ),
                          ],
                          onChanged: viewModel.updateDashboardYetki,
                        )),
                    buildTableRow(
                      'Varsayılan Rapor ID :',
                      DropdownButtonFormField(
                          hint: const Text("seçim yapın"),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 5,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(25),
                          items: const [
                            DropdownMenuItem<String>(
                              value: "Anasayfa",
                              child: Text("Anasayfa"),
                            ),
                            DropdownMenuItem<String>(
                              value: "Gimsa",
                              child: Text("Gimsa"),
                            ),
                            DropdownMenuItem<String>(
                              value: "Encok",
                              child: Text("En Çok Satan Ürünler"),
                            ),
                            DropdownMenuItem<String>(
                              value: "Stokhareket",
                              child: Text("Stok Hareket İzleme"),
                            ),
                            DropdownMenuItem<String>(
                              value: "Saatliksatis",
                              child: Text("Saatlik Satis Dağılım"),
                            ),
                            DropdownMenuItem<String>(
                              value: "Kasiyerper",
                              child: Text("Kasiyer Performans"),
                            ),
                            DropdownMenuItem<String>(
                              value: "Raportanım",
                              child: Text("Rapor Tanımları"),
                            ),
                          ],
                          onChanged: (value) {
                            viewModel.updateVarsayilanRaporId(value!);
                          }),
                    ),
                    buildTableRow(
                      'Profil Fotoğrafı :',
                      IconButton(
                        onPressed: () => {openFiles()},
                        icon: const Icon(Icons.image, size: 40),
                      ),
                    ),
                  ],
                ),
                widget.veri != null
                    ? Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: ElevatedButton(
                          onPressed: () =>
                              viewModel.editUser(context, widget.veri!),
                          child: Container(
                            child: Text(
                              "Kullanıcı Güncelle",
                            ),
                          ),
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: ElevatedButton(
                          onPressed: () => viewModel.addUser(context),
                          child: Container(
                            child: Text(
                              "Kullanıcı Ekle",
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
