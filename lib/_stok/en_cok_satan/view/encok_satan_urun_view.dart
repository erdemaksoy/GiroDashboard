import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girodashboard/core/extension/date_extension.dart';

import '../../../_tanim/rapor_kolon_tanim/view_model/rapor_kolon_tanim_view_model.dart';
import '../../../classNav.dart';
import '../../../core/components/table/build_table_row.dart';
import '../model/en_cok_satan_model.dart';
import '../viewmodel/en_cok_satan_view_model.dart';

part "encok_satan_urun_view.g.dart";

class SatanUrun extends StatefulWidget {
  const SatanUrun({Key? key}) : super(key: key);

  @override
  State<SatanUrun> createState() => _SatanUrunState();
}

class _SatanUrunState extends State<SatanUrun> {
  bool load = false;
  bool showInputs = true;
  RaporKolonViewModel kolonViewModel = RaporKolonViewModel();

  final EnCokSatanViewModel viewModel = EnCokSatanViewModel();
  MyDataSource? dataSource;
  List<EnCokSatanModel> models = [];
  String hintTextTarih = 'dd.mm.yyyy';

  Future<void> _generateReport() async {
    models = await viewModel.listEnCokSatan();
    setState(() {
      load = true;
      showInputs = false;
      dataSource = MyDataSource(models);
    });
    kolonViewModel.models
        .removeWhere((element) => element.kolonBaslik == "Sıra");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kolonViewModel.listRaporKolon("03-001");
    setState(() {
      hintTextTarih =
          viewModel.tarih != null ? viewModel.tarih.toFormatEdit : 'dd.mm.yyyy';
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('En Çok Satan Ürünler'),
        ),
        drawer: const NavBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 15),
          child: Center(
            child: Column(
              children: [
                if (showInputs)
                  Table(
                    defaultColumnWidth: const FlexColumnWidth(1.0),
                    children: [
                      buildTableRow(
                        'Şube Kodu',
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                          ),
                          borderRadius: BorderRadius.circular(25),
                          items: const [
                            DropdownMenuItem<String>(
                              value: '1',
                              child: Text('POSTA CADDESİ'),
                            ),
                          ],
                          onChanged: viewModel.updateSubeKodu,
                          hint: const Text('Şube Kodu Seçiniz'),
                        ),
                      ),
                      buildTableRow(
                        'Tarih',
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: hintTextTarih,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onChanged: (value) {
                                  viewModel.updateTarih(DateTime.parse(value));
                                }),
                            IconButton(
                              onPressed: () async {
                                showCupertinoModalPopup<DateTime>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 300,
                                      color: Colors.white,
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.date,
                                        initialDateTime: DateTime.now(),
                                        minimumDate: DateTime(2000),
                                        maximumDate: DateTime(2101),
                                        onDateTimeChanged: (DateTime newTime) {
                                          setState(() {
                                            viewModel.updateTarih(newTime);
                                            hintTextTarih = viewModel.tarih !=
                                                    null
                                                ? viewModel.tarih.toFormatEdit
                                                : 'dd.mm.yyyy';
                                          });
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.calendar_month),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                if (!showInputs)
                  IconButton(
                    icon: const Icon(
                      Icons.expand_circle_down_outlined,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        showInputs = true;
                      });
                    },
                  ),
                if (!showInputs)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      onChanged: (value) async {
                        viewModel.updateSearchText(value);
                        models = await viewModel.getFilteredData();
                        setState(() {
                          dataSource = MyDataSource(models);
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Rapor Ara',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                if (showInputs)
                  Center(
                    child: ElevatedButton(
                      onPressed: _generateReport,
                      child: const Text('Rapor'),
                    ),
                  ),
                load
                    ? PaginatedDataTable(
                        rowsPerPage: 8,
                        columns: _buildDataColumns(),
                        source: dataSource ?? MyDataSource([]),
                        sortColumnIndex: dataSource!.sortColumnIndex,
                        sortAscending: dataSource!.sortAscending,
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<DataColumn> _buildDataColumns() {
    return [
      DataColumn(label: Text("Sıra")),
      ...kolonViewModel.models.map((kolonBaslik) => DataColumn(
            label: Text("${kolonBaslik.kolonBaslik}"),
            onSort: (columnIndex, ascending) {
              setState(() {
                switch (kolonBaslik.kolonBaslik) {
                  case "Stok Adı":
                    return dataSource?.sort(
                        columnIndex, (d) => d.stokAdi!, ascending);
                  case "Satış Tutar":
                    return dataSource?.sort(
                        columnIndex, (d) => d.satisTutari!, ascending);
                  case "Satış Miktar":
                    return dataSource?.sort(
                        columnIndex, (d) => d.satisMiktari!, ascending);
                  case "Stok Kodu":
                    dataSource?.sort(
                        columnIndex, (d) => d.stokKodu!, ascending);

                  case "Sıra":
                    return;
                  default:
                    return;
                }
              });
            },
          )),
    ];
  }
}
