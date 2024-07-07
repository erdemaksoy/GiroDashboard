import '../../rol_listesi/model/rol_listesi_model.dart';
import '../model/yetki_model.dart';
import '../viewmodel/yetki_viewmodel.dart';
import 'package:flutter/material.dart';


import '../../../classNav.dart';

class YetkiPage extends StatefulWidget {
  YetkiPage({Key? key, required this.model}) : super(key: key);
  final RolListeModel model;

  @override
  State<YetkiPage> createState() => _YetkiPageState();
}

class _YetkiPageState extends State<YetkiPage> {
  List<YetkiModel> models = [];

  final viewmodel = YetkiViewModel();

  Future<void> getData() async {
    models = await viewmodel.getYetki(widget.model);
    setState(() {});
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yetki Yönetimi'),
      ),
      drawer: const NavBar(),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Menü Adı')),
              DataColumn(label: Text('Yetki')),
              /*DataColumn(label: Text('Kayıt Yetkisi')),
              DataColumn(label: Text('Silme Yetkisi')),
              DataColumn(label: Text('Güncelleme Yetkisi')),*/
            ],
            rows: models
                .map(
                  (veri) => DataRow(
                    cells: [
                      DataCell(Text(veri.menuAdi ?? "")),
                      DataCell(Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return veri.izlemeYetki!
                                ? Colors.green
                                : Colors.red;
                          }),
                          onChanged: (value) async {
                            await viewmodel.updateIzlemeYetki(
                                value!, veri.yetkiId, context);
                            models = viewmodel.listYetki;
                            setState(() {});
                          },
                          value: veri.izlemeYetki ?? false)),
                      /*DataCell(Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return veri.kayitYetki!
                                ? Colors.green
                                : Colors.red;
                          }),
                          onChanged: (value) async {
                            await viewmodel.updateKayitYetki(
                                value!, veri.yetkiId, context);
                            models = viewmodel.listYetki;
                            setState(() {});
                          },
                          value: veri.kayitYetki ?? false)),
                      DataCell(Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return veri.silYetki! ? Colors.green : Colors.red;
                          }),
                          onChanged: (value) async {
                            await viewmodel.updateSilYetki(
                                value!, veri.yetkiId, context);
                            models = viewmodel.listYetki;
                            setState(() {});
                          },
                          value: veri.silYetki ?? false)),
                      DataCell(Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return veri.guncelleYetki!
                                ? Colors.green
                                : Colors.red;
                          }),
                          onChanged: (value) async {
                            await viewmodel.updateGuncelleYetki(
                                value!, veri.yetkiId, context);
                            models = viewmodel.listYetki;
                            setState(() {});
                          },
                          value: veri.guncelleYetki ?? false)),*/
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
