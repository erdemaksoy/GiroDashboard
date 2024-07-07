import 'package:flutter/material.dart';

import '../../../classNav.dart';
import '../model/rapor_grup_tanim_model.dart';
import '../view_model/rapor_grup_tanim_view_model.dart';

class Grup extends StatefulWidget {
  const Grup({Key? key}) : super(key: key);

  @override
  _GrupState createState() => _GrupState();
}

class _GrupState extends State<Grup> {
  final RaporGrupViewModel viewModel = RaporGrupViewModel();
  List<RaporGrupTanimModel> models = [];
  Future<void> getData() async {
    models = await viewModel.listRaporGrup();
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

  void duzenleVeSil(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Güncelle'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Sil'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rapor Grup Tanımları'),
        ),
        drawer: const NavBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Grup Kodu:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 45),
                          Text(
                            'Grup Açıklama:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 230,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: viewModel.guncelle != null
                                    ? viewModel.guncelle!.grupKodu
                                    : "Grup Kodu Giriniz",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onChanged: (value) {
                                if (viewModel.guncelle != null) {
                                  viewModel.guncelle!.grupKodu = value;
                                }
                                viewModel.updateGrupKodu(value);
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 230,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: viewModel.guncelle != null
                                    ? viewModel.guncelle!.grupAciklama
                                    : "Grup Açıklaması Giriniz",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onChanged: (value) {
                                if (viewModel.guncelle != null) {
                                  viewModel.guncelle!.grupAciklama = value;
                                }
                                viewModel.updateGrupAciklama(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                viewModel.guncelle != null
                    ? ElevatedButton(
                        onPressed: () async {
                          await viewModel.editGrup(context);
                          models = await viewModel.listRaporGrup();

                          setState(() {
                            viewModel.resetGuncelle();
                          });
                        },
                        child: const Text('Güncelle'),
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          await viewModel.addGrup(context);
                          models = await viewModel.listRaporGrup();
                          setState(() {});
                        },
                        child: const Text('Kaydet'),
                      ),
                const SizedBox(height: 20),
                viewModel.loading
                    ? const CircularProgressIndicator()
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              onChanged: (value) async {
                                viewModel.updateSearchText(value);
                                models = await viewModel.getFilteredData();
                                setState(() {});
                              },
                              decoration: const InputDecoration(
                                labelText: 'Grup Ara',
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'İşlemler',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          DataTable(
                            columns: const [
                              DataColumn(label: Text('Grup Kodu')),
                              DataColumn(label: Text('Grup Açıklama')),
                              DataColumn(label: Text('İşlemler')),
                            ],
                            rows: models
                                .asMap()
                                .map(
                                  (index, veri) => MapEntry(
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
                                        DataCell(Text(veri.grupKodu!)),
                                        DataCell(Text(veri.grupAciklama!)),
                                        DataCell(
                                          PopupMenuButton<String>(
                                            iconSize: 35.0,
                                            itemBuilder:
                                                (BuildContext context) =>
                                                    <PopupMenuEntry<String>>[
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
                                              await viewModel
                                                  .actionsValueSelect(
                                                      value, veri, context);
                                              models = await viewModel
                                                  .listRaporGrup();
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .values
                                .toList(),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
