import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:girodashboard/core/extension/date_extension.dart';

import '../../../classNav.dart';
import '../../../core/components/table/build_table_row.dart';
import '../model/kasiyer_performans_model.dart';
import '../view_model/kasiyer_performans_view_model.dart';

part 'kasiyer_performans_view.g.dart';

class KasiyerPerformansPage extends StatefulWidget {
  const KasiyerPerformansPage({super.key});

  @override
  State<KasiyerPerformansPage> createState() => _KasiyerPerformansPageState();
}

class _KasiyerPerformansPageState extends State<KasiyerPerformansPage> {
  bool load = false;
  bool showInputs = true;
  String selected1 = 'Seçim Yapınız';
  String hintTextTarihBas = "dd.mm.yyyy";
  String hintTextTarihBit = "dd.mm.yyyy";
  final String _barcodeResult = 'Barkodu giriniz';
  MyDataSource? dataSource;
  final KasiyerPerformansViewModel viewModel = KasiyerPerformansViewModel();

  Future<void> _generateReport() async {
    load = true;
    await viewModel.listKasiyerPerformans(context);
    setState(() {
      showInputs = false;
      dataSource = MyDataSource(viewModel.models);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      hintTextTarihBas = viewModel.basTarih != null
          ? viewModel.basTarih.toFormatEdit
          : 'dd.mm.yyyy';
      hintTextTarihBit = viewModel.bitTarih != null
          ? viewModel.bitTarih.toFormatEdit
          : 'dd.mm.yyyy';
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Text(
            "Kasiyer Performans",
          ),
        ),
        //  drawer: const NavBar(),
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
                        'Barkod',
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: _barcodeResult,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onChanged: viewModel.updateBarkod,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.camera_alt),
                              onPressed: () async =>
                                  await viewModel.scanBarcode(),
                            ),
                          ],
                        ),
                      ),
                      buildTableRow(
                        'Başlangıç Tarihi',
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: hintTextTarihBas,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    viewModel
                                        .updateBasTarih(DateTime.parse(value));
                                    hintTextTarihBas =
                                        viewModel.basTarih != null
                                            ? viewModel.basTarih.toFormatEdit
                                            : 'dd.mm.yyyy';
                                  });
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
                                            viewModel.updateBasTarih(newTime);
                                            hintTextTarihBas =
                                                viewModel.basTarih != null
                                                    ? viewModel
                                                        .basTarih.toFormatEdit
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
                      buildTableRow(
                        'Bitiş Tarihi',
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: hintTextTarihBit,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onChanged: (value) {
                                  viewModel
                                      .updateBitTarih(DateTime.parse(value));
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
                                            viewModel.updateBitTarih(newTime);
                                            hintTextTarihBit =
                                                viewModel.bitTarih != null
                                                    ? viewModel
                                                        .bitTarih.toFormatEdit
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
                      buildTableRow(
                        'Şube',
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                          ),
                          borderRadius: BorderRadius.circular(25),
                          value: selected1,
                          items: const [
                            DropdownMenuItem<String>(
                              value: "Seçim Yapınız",
                              child: Text("Seçim Yapınız"),
                            ),
                            DropdownMenuItem<String>(
                              value: "1",
                              child: Text("POSTA CADDESİ"),
                            ),
                          ],
                          onChanged: viewModel.updateSubeKodu,
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
                        /*viewModel.updateSearchText(value);
                        models = await viewModel.getFilteredData();
                        setState(() {
                          dataSource = MyDataSource(models);
                        });*/
                      },
                      decoration: const InputDecoration(
                        labelText: 'Rapor Ara',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                if (showInputs)
                  ElevatedButton(
                    onPressed: _generateReport,
                    child: const Text(
                      "Rapor",
                    ),
                  ),
                load
                    ? PaginatedDataTable(
                        rowsPerPage: 8,
                        columns: [
                          DataColumn(
                            label: const Text('Sıra'),
                          ),
                          DataColumn(
                            label: const Text('ŞUBE KODU'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.subeKodu!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('ŞUBE ADI'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.subeAdi!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('KASİYER'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.kasiyer!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('ADSOYAD'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(columnIndex,
                                    (d) => d.adSoyad ?? '', ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('STOKAD'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(columnIndex,
                                    (d) => d.stokAd ?? '', ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('SATIŞ MİKTAR'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(columnIndex,
                                    (d) => d.satisMiktar ?? 0, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('SATIŞ TUTAR'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(columnIndex,
                                    (d) => d.satisTutar ?? 0, ascending);
                              });
                            },
                          ),
                        ],
                        source: dataSource!,
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
}
