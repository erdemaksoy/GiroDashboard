import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girodashboard/core/extension/date_extension.dart';

import '../../../classNav.dart';
import '../../../core/components/table/build_table_row.dart';
import '../model/kasiyer_acik_model.dart';
import '../view_model/kasiyer_acik_view_model.dart';

part "kasiyer_acik_view.g.dart";

class KasiyerPage extends StatefulWidget {
  const KasiyerPage({Key? key}) : super(key: key);

  @override
  State<KasiyerPage> createState() => _KasiyerPageState();
}

class _KasiyerPageState extends State<KasiyerPage> {
  bool load = false;
  String selected1 = 'Seçim Yapınız';
  bool showInputs = true;
  MyDataSource? dataSource;
  String hintTextTarihBas = "dd.mm.yyyy";
  String hintTextTarihBit = "dd.mm.yyyy";
  final KasiyerAcikViewModel viewModel = KasiyerAcikViewModel();

  Future<void> _generateReport() async {
    await viewModel.listKasiyeracik();
    load = true;
    showInputs = false;
    setState(() {
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
            "Kasiyer Açığı",
          ),
        ),
        // drawer: const NavBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (showInputs)
                  Table(
                    defaultColumnWidth: const FlexColumnWidth(1.0),
                    children: [
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
                                  hintTextTarihBas = viewModel.basTarih != null
                                      ? viewModel.basTarih.toFormatEdit
                                      : 'dd.mm.yyyy';
                                });
                              },
                            ),
                            IconButton(
                              onPressed: () async => {
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
                                ),
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
                                viewModel.updateBitTarih(DateTime.parse(value));
                              },
                            ),
                            IconButton(
                              onPressed: () async => {
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
                                ),
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
                          hint: const Text("Seçim Yapınız"),
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
                            label: const Text('Personel No'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(columnIndex,
                                    (d) => d.personelNo!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Tarih'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.tarih!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Açık'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.acik!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('fazla'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.fazla!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Kasiyer Adı'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(columnIndex,
                                    (d) => d.kasiyerAdi!, ascending);
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
