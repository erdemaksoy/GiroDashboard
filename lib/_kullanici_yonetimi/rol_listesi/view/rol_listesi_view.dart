import 'package:flutter/material.dart';

import '../../../classNav.dart';
import '../model/rol_listesi_model.dart';
import '../viewmodel/rol_listesi_view_model.dart';

class RolListesiPage extends StatefulWidget {
  const RolListesiPage({Key? key}) : super(key: key);
  @override
  State<RolListesiPage> createState() => _RolListesiPageState();
}

class _RolListesiPageState extends State<RolListesiPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rol Listesi'),
        ),
        drawer: const NavBar(),
        body: DataTableWidget(),
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
  final RolListeViewModel viewModel = RolListeViewModel();
  List<RolListeModel> models = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    models = await viewModel.listRoles();
    setState(() {});
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
            const Text("Rol Kodu",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Container(
              padding: const EdgeInsets.only(top: 15),
              width: 250,
              child: TextFormField(
                  decoration: InputDecoration(
                    hintText: viewModel.rolGuncelle != null
                        ? viewModel.rolGuncelle!.rolAciklama
                        : "Rol Kodu Girin",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    if (viewModel.rolGuncelle != null) {
                      viewModel.rolGuncelle!.rolAciklama = value;
                    }
                    viewModel.updateRol(value);
                  }),
            ),
            const SizedBox(
              height: 40,
            ),
            viewModel.rolGuncelle != null
                ? ElevatedButton(
                    onPressed: () async {
                      viewModel.editRole(context);
                      models = await viewModel.listRoles();
                      viewModel.rolGuncelle = null;
                      setState(() {});
                    },
                    child: const Text('Rol Güncelle'),
                  )
                : ElevatedButton(
                    onPressed: () async {
                      viewModel.addRole(context);
                      models = await viewModel.listRoles();
                      setState(() {});
                    },
                    child: const Text('Rol Ekle'),
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
                  labelText: 'Rol Ara',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Rol Adı')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: models
                    .asMap()
                    .map((index, veri) => MapEntry(
                          index,
                          DataRow.byIndex(
                            index: index,
                            color: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                return index % 2 == 0
                                    ? Colors.grey.shade400
                                    : null;
                              },
                            ),
                            cells: [
                              DataCell(Text(veri.rolAciklama ?? "")),
                              DataCell(
                                PopupMenuButton<String>(
                                    iconSize: 35.0,
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<String>>[
                                          const PopupMenuItem<String>(
                                            value: 'Yetki',
                                            child: Text('Yetkileri düzenle'),
                                          ),
                                          const PopupMenuItem<String>(
                                            value: 'edit',
                                            child: Text('Edit'),
                                          ),
                                          const PopupMenuItem<String>(
                                            value: 'delete',
                                            child: Text('Delete'),
                                          ),
                                        ],
                                    onSelected: (String value) async {
                                      await viewModel.actionsValueSelect(
                                          context, value, veri);
                                      models = await viewModel.listRoles();
                                      setState(() {});
                                    }),
                              ),
                            ],
                          ),
                        ))
                    .values
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
