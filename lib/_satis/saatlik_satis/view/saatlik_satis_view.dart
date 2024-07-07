import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girodashboard/core/extension/date_extension.dart';

import '../../../classNav.dart';
import '../../../core/components/table/build_table_row.dart';
import '../model/saatlik_satis_model.dart';
import '../viewmodel/saatlik_satis_viewmodel.dart';

part "saatlik_satis_view.g.dart";

class SaatlikSatis extends StatefulWidget {
  const SaatlikSatis({Key? key}) : super(key: key);

  @override
  _SaatlikSatisState createState() => _SaatlikSatisState();
}

class _SaatlikSatisState extends State<SaatlikSatis> {
  bool load = false;
  bool showInputs = true;
  final SaatlikSatisViewModel viewModel = SaatlikSatisViewModel();
  MyDataSource? dataSource;
  List<SaatlikSatisModel> models = [];
  String hintTextTarih = 'dd.mm.yyyy';
  Future<void> getData() async {
    models = await viewModel.listSaatlikSatis(context);
  }

  Future<void> _generateReport() async {
    await getData();
    load = true;
    setState(() {
      dataSource = MyDataSource(models);
      showInputs = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
          title: const Text('Saatlik Satış Dağılımı'),
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
                        'Şube',
                        DropdownButtonFormField(
                          borderRadius: BorderRadius.circular(25),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                          ),
                          items: const [
                            DropdownMenuItem<String>(
                              value: '1',
                              child: Text('POSTA CADDESİ'),
                            ),
                          ],
                          onChanged: viewModel.updateSubeKodu,
                          hint: const Text('Şube Seçiniz'),
                        ),
                      ),
                      buildTableRow(
                        'Tarih',
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: hintTextTarih,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
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
                const SizedBox(
                  height: 20,
                ),
                if (showInputs)
                  ElevatedButton(
                    onPressed: _generateReport,
                    child: Container(
                      child: Text(
                        "Rapor",
                      ),
                    ),
                  ),
                load
                    ? PaginatedDataTable(
                        rowsPerPage: 8,
                        columns: [
                          const DataColumn(
                            label: Text('Sıra'),
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
                            label: const Text('Saat'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.saat!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Müşteri Sayısı'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.musSay!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Sepet Ort'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.sepetOrt!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Ciro'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.ciro!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Yemek Çeki'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(columnIndex,
                                    (d) => d.yemekKarti!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Toplam Ciro'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(columnIndex,
                                    (d) => d.toplamSepet!, ascending);
                              });
                            },
                          ),
                        ],
                        source: dataSource!,
                        sortColumnIndex: dataSource!.sortColumnIndex,
                        sortAscending: dataSource!.sortAscending,
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
