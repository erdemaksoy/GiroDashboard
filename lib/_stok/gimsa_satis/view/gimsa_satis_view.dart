import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../classNav.dart';
import '../../../core/components/table/build_table_row.dart';
import '../model/gimsa_satis_model.dart';
import '../viewmodel/gimsa_satis_view_model.dart';

part "gimsa_satis_view.g.dart";

class GimsaSatis extends StatefulWidget {
  const GimsaSatis({Key? key}) : super(key: key);

  @override
  _GimsaSatisState createState() => _GimsaSatisState();
}

class _GimsaSatisState extends State<GimsaSatis> {
  bool load = false;
  bool showInputs = true;
  String _barcodeResult = 'Barkodu giriniz';
  MyDataSource? dataSource;
  final GimsaSatisViewModel viewModel = GimsaSatisViewModel();

  Future<void> _generateReport() async {
    await viewModel.getGimsaSatis();
    load = true;
    setState(() {
      showInputs = false;
      dataSource = MyDataSource(viewModel.models);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gimsa Satış'),
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
                                    RegExp(r'[0-9]'),
                                  ),
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
                        'Ürün Kodu',
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Ürün Kodunu Giriniz",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: viewModel.updateUrunKod,
                        ),
                      ),
                      buildTableRow(
                        'Ürün Adı',
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Ürün Adını Giriniz",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: viewModel.updateUrunAdi,
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
                        await viewModel.getFilteredData();
                        setState(() {
                          dataSource = MyDataSource(viewModel.models);
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
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (viewModel.models.isNotEmpty) {
                          viewModel.models.removeAt(0);
                        }
                        await _generateReport();
                      },
                      child: const Text('Rapor'),
                    ),
                  ),
                load
                    ? PaginatedDataTable(
                        columns: [
                          DataColumn(
                            label: const Text('Stok No'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.stokNo!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Urun Kodu'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.urunKodu!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Barkod'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.barkod!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Urun Adı'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.urunAdi!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('KDV Hariç Mal'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(columnIndex,
                                    (d) => d.kdvHaricMal!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Satış Fiyatı'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(columnIndex,
                                    (d) => d.satisFiyati!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('KDV'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.kdv!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Mevcut'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.mevcut!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Brm'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.brm!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('2023'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.y2023!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('2022'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.y2022!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('2021'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.y2021!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('2020'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(
                                    columnIndex, (d) => d.y2020!, ascending);
                              });
                            },
                          ),
                          DataColumn(
                            label: const Text('Giriş2023'),
                            onSort: (columnIndex, ascending) {
                              setState(() {
                                dataSource?.sort(columnIndex,
                                    (d) => d.giris2023!, ascending);
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
