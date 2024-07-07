import 'package:flutter/material.dart';


import '../../../classNav.dart';
import '../../kullanici_ekle/view/kullanici_ekle_view.dart';
import '../model/kullanici_listesi_model.dart';
import '../viewmodel/kullanci_listesi_viewmodel.dart';

class KullaniciListesiPage extends StatelessWidget {
  const KullaniciListesiPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kullanıcı Listesi'),
        ),
        // drawer: const NavBar(),
        body: const DataTableWidget(),
        drawer: const NavBar(),
      ),
    );
  }
}

class DataTableWidget extends StatefulWidget {
  const DataTableWidget({super.key});

  @override
  _DataTableWidgetState createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  final KullaniciListeleViewModel viewModel = KullaniciListeleViewModel();
  List<KullaniciListesiModel> models = [];
  Future<void> getData() async {
    models = await viewModel.listUser();
    setState(() {
      viewModel.updateloading();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KullaniciEklePage()),
                );
              },
              child: const Text('Kullanıcı Ekle'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) async {
                  viewModel.updateSearchText(value);
                  models = await viewModel.getFilteredData();
                  setState(() {});
                },
                decoration: const InputDecoration(
                  labelText: 'Kullanıcı Ara',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            viewModel.loading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Scrollbar(
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('ID')),
                          DataColumn(label: Text('Kullanıcı Kodu')),
                          DataColumn(label: Text('Kullanıcı Adı')),
                          DataColumn(label: Text('Rol')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: models
                            .asMap()
                            .map((index, veri) => MapEntry(
                                  index,
                                  DataRow.byIndex(
                                    index: index,
                                    color: MaterialStateProperty.resolveWith<
                                        Color?>(
                                      (Set<MaterialState> states) {
                                        return index % 2 == 0
                                            ? Colors.grey.shade400
                                            : null;
                                      },
                                    ),
                                    cells: [
                                      DataCell(
                                          Text(veri.kullaniciNo.toString())),
                                      DataCell(Text(veri.kullaniciAdi!)),
                                      DataCell(Text(veri.kullaniciIsim!)),
                                      DataCell(Text(veri.rolId.toString())),
                                      DataCell(
                                        PopupMenuButton<String>(
                                          itemBuilder: (BuildContext context) =>
                                              <PopupMenuEntry<String>>[
                                            const PopupMenuItem<String>(
                                              value: 'edit',
                                              child: Text('Düzenle'),
                                            ),
                                            const PopupMenuItem<String>(
                                              value: 'delete',
                                              child: Text('Sil'),
                                            ),
                                          ],
                                          onSelected: (String value) =>
                                              viewModel.actionsValueSelect(
                                                  value, veri, context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .values
                            .toList(),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
