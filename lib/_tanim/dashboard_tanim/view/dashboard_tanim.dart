
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';

import '../../../classNav.dart';
import '../model/dashboard_add_model.dart';
import '../view_model/dashboard_view_model.dart'; // Bu kısmı kendi projenizin dizinine göre güncelleyin

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  final DashboardTanimViewModel viewModel = DashboardTanimViewModel();
  List<DashboardAddModel> dashModels = [];
  Future<void> getData() async {
    dashModels = await viewModel.listDashboard();
    dashModels.sort((a, b) => a.siraNo!.compareTo(b.siraNo!));
    setState(() {
      viewModel.updateLoad();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  bool aktifMiValue = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard Tanımları'),
        ),
        drawer: const NavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onChanged: (value) async {
                    viewModel.updateSearchText(value);
                    dashModels = await viewModel.getFilteredData();
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    labelText: 'Rapor Ara',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 45,
                    horizontalMargin: 16,
                    columns: const [
                      DataColumn(label: Text('Rapor Adı')),
                      DataColumn(
                        label: Text('Sıra No'),
                        numeric: true,
                      ),
                      DataColumn(label: Text('Aktif')),
                      DataColumn(label: Text('İşlemler')),
                    ],
                    rows: dashModels
                        .map(
                          (veri) => DataRow(
                            cells: [
                              DataCell(Text(veri.raporAdi!)),
                              DataCell(SizedBox(
                                width: 50,
                                child: Text(veri.siraNo.toString(),
                                    overflow: TextOverflow.ellipsis),
                              )),
                              DataCell(_buildAktifMiButton(veri)),
                              DataCell(
                                PopupMenuButton<String>(
                                  itemBuilder: (BuildContext context) {
                                    return [
                                      const PopupMenuItem<String>(
                                        value: 'update',
                                        child: Text('Güncelle'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'delete',
                                        child: Text('Sil'),
                                      ),
                                    ];
                                  },
                                  onSelected: (String value) async {
                                    await viewModel.actionsValueSelect(
                                        value, veri, context);
                                    dashModels =
                                        await viewModel.listDashboard();
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.more_vert),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  )),
            ],
          ),
        ),
        floatingActionButton: DraggableFab(
          child: FloatingActionButton(
            onPressed: () async {
              showAddDialog();
              dashModels = await viewModel.listDashboard();
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Widget _buildAktifMiButton(DashboardAddModel rowData) {
    return TextButton(
      onPressed: () {
        setState(() {
          rowData.aktifPasif = !rowData.aktifPasif;
        });
      },
      style: TextButton.styleFrom(
        foregroundColor: rowData.aktifPasif ? Colors.green : Colors.red,
      ),
      child: Text(rowData.aktifPasif ? 'Evet' : 'Hayır'),
    );
  }

  Future<void> showAddDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Yeni Rapor Ekle'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    _buildTextField('Rapor Adı', viewModel.updateRaporAdi),
                    _buildTextField(
                        'Rapor Başlık', viewModel.updateRaporBaslik),
                    _buildTextField(
                        'Rapor Procedure', viewModel.updateRaporProc),
                    _buildTextField('Açıklama', viewModel.updateAciklama),
                    Text("Gösterim tipi"),
                    DropdownButtonFormField(
                        items: const [
                          DropdownMenuItem(value: '1', child: Text('Line')),
                          DropdownMenuItem(value: '2', child: Text('Pie')),
                          DropdownMenuItem(value: '3', child: Text('Bar')),
                          DropdownMenuItem(value: '4', child: Text('Box')),
                          DropdownMenuItem(value: '5', child: Text('Tablo')),
                        ],
                        onChanged: (value) {
                          viewModel.updateRaporTipi(value);
                          setState(() {});
                        }),
                    _buildTextField('Genişlik', viewModel.updateGenislik),
                    _buildTextField('İkon', viewModel.updateIkon),
                    _buildTextField('Sıra Numarası', viewModel.updateSiraNo),
                    _buildTextField(
                        'Rapor Sıra Numarası', viewModel.updateRaporSiraNo),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Aktif Mi?'),
                          SizedBox(
                            width: 50,
                            child: Switch(
                              value: viewModel.aktifPasif,
                              onChanged: (value) {
                                viewModel.updateAktifPasif();
                                setState(() {});
                              },
                              activeTrackColor: Colors.green,
                              activeColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Vazgeç'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await viewModel.addDashboard(context);
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Eklendi'),
                      ),
                    );
                  },
                  child: const Text('Ekle'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildTextField(String label, void Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextField(onChanged: onChanged),
        ],
      ),
    );
  }
}
