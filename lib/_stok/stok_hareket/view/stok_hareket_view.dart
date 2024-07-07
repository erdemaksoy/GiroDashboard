import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:girodashboard/core/extension/date_extension.dart';

import '../../../_tanim/rapor_kolon_tanim/view_model/rapor_kolon_tanim_view_model.dart';
import '../../../classNav.dart';
import '../../../core/components/table/build_table_row.dart';
import '../model/stok_hareket_model.dart';
import '../viewmodel/stok_hareket_view_model.dart';

part "stok_hareket_view.g.dart";

class StokIzleme extends StatefulWidget {
  const StokIzleme({Key? key}) : super(key: key);

  @override
  State<StokIzleme> createState() => _StokIzlemeState();
}

class _StokIzlemeState extends State<StokIzleme> {
  bool load = false;
  bool showInputs = true;
  String _barcodeResult = 'Barkodu giriniz';
  MyDataSource? dataSource;
  List<StokHareketModel> models = [];
  RaporKolonViewModel kolonViewModel = RaporKolonViewModel();
  final StokHareketViewModel viewModel = StokHareketViewModel();

  Future<void> _generateReport() async {
    load = true;
    models = await viewModel.listStokHareket();
    setState(() {
      showInputs = false;
      dataSource = MyDataSource(models);
      viewModel.updateLoad();
    });
    kolonViewModel.models
        .removeWhere((element) => element.kolonBaslik == "Sıra");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kolonViewModel.listRaporKolon("03-002");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Stok Hareket Izleme'),
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
                                onPressed: () async {
                                  await viewModel.scanBarcode();
                                  _barcodeResult = viewModel.barkod!;
                                  setState(() {});
                                }),
                          ],
                        ),
                      ),
                      buildTableRow(
                        'Şube Kodu',
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            hintText: 'Şube Seçiniz',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                          ),
                          borderRadius: BorderRadius.circular(25),
                          items: const [
                            DropdownMenuItem<String>(
                              value: '1',
                              child: Text('Şube 1'),
                            ),
                            DropdownMenuItem<String>(
                              value: '2',
                              child: Text('Şube 2'),
                            ),
                            DropdownMenuItem<String>(
                              value: '3',
                              child: Text('Şube 3'),
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
                        viewModel.updateSearchText(value);
                        models = await viewModel.getFilteredData();
                        setState(() {
                          dataSource = MyDataSource(models);
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Kullanıcı Ara',
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
                        columns: [
                          const DataColumn(
                            label: Text('Sıra'),
                          ),
                          DataColumn(
                            label: const Text('Şube Kodu'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.subeKodu!, ascending);
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
                            label: const Text('Belge No'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.belgeNo!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Evrak No'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.evrakNo!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Belge Tipi'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(columnIndex,
                                    (d) => d.belgeTipi!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Belge Adı'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.belgeAdi!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Giren Miktar'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(columnIndex,
                                    (d) => d.girenMiktar!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Çıkan Miktar'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(columnIndex,
                                    (d) => d.cikanMiktar!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Har_Bakiye'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(columnIndex,
                                    (d) => d.harBakiye!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Cari Adı'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.cariAdi!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Stok NF'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.stokNF!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Net Tutar'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.netTutar!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Stok BF'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.stokBF!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('KDV Oranı'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.kdvOrani!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('StokHr RecNo'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(columnIndex,
                                    (d) => d.stokHr_Recno!, ascending);
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
