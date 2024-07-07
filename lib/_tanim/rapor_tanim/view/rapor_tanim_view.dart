import 'package:flutter/material.dart';


import '../../../classNav.dart';
import '../model/rapor_tanim_model.dart';
import '../view_model/rapor_tanim_view_model.dart';
import 'rapor_tanim_ekle_view.dart';

class Rapor extends StatefulWidget {
  const Rapor({Key? key}) : super(key: key);

  @override
  State<Rapor> createState() => _RaporState();
}

class _RaporState extends State<Rapor> {
  final RaporViewModel viewModel = RaporViewModel();
  List<RaporTanimModel> filterDataList = [];
  Future<void> getData() async {
    filterDataList = await viewModel.listRapor();
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

  int? sortColumnIndex;
  bool sortAscending = true;

  void sort<T>(Comparable<T> Function(RaporTanimModel d) getField,
      int columnIndex, bool ascending) {
    filterDataList.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    setState(() {
      sortColumnIndex = columnIndex;
      sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rapor Tanımları'),
        ),
        drawer: const NavBar(),
        body: viewModel.loading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 1000, // Set the width to a finite value
                        child: TextField(
                          onChanged: (value) async {
                            viewModel.updateSearchText(value);
                            filterDataList = await viewModel.getFilteredData();
                            setState(() {});
                          },
                          decoration: const InputDecoration(
                            labelText: 'Rapor Ara',
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      DataTable(
                        sortColumnIndex: sortColumnIndex,
                        sortAscending: sortAscending,
                        columns: [
                          DataColumn(
                            label: const Text('Grup Kodu'),
                            onSort: (columnIndex, ascending) {
                              sort<String>((d) => d.grupKodu ?? "", columnIndex,
                                  ascending);
                            },
                          ),
                          DataColumn(
                            label: const Text('Rapor Kodu'),
                            onSort: (columnIndex, ascending) {
                              sort<String>((d) => d.raporKodu ?? "",
                                  columnIndex, ascending);
                            },
                          ),
                          DataColumn(
                            label: const Text('Rapor Adı '),
                            onSort: (columnIndex, ascending) {
                              sort<String>((d) => d.raporAdi ?? "", columnIndex,
                                  ascending);
                            },
                          ),
                          DataColumn(
                            label: const Text('SQL Procedure Adı'),
                            onSort: (columnIndex, ascending) {
                              sort<String>((d) => d.sQLProsedurAdi ?? "",
                                  columnIndex, ascending);
                            },
                          ),
                          DataColumn(
                            label: const Text('Filtre'),
                            onSort: (columnIndex, ascending) {
                              sort<String>((d) => d.filtre ?? "", columnIndex,
                                  ascending);
                            },
                          ),
                          DataColumn(
                            label: const Text('Gösterim Tipi'),
                            onSort: (columnIndex, ascending) {
                              sort<String>((d) => d.gosterimTipi ?? "",
                                  columnIndex, ascending);
                            },
                          ),
                          const DataColumn(label: Text('İşlemler')),
                        ],
                        rows: List<DataRow>.generate(
                          filterDataList.length,
                          (index) => DataRow.byIndex(
                            index: index,
                            color: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                return index % 2 == 0
                                    ? Colors.grey.shade400
                                    : null;
                              },
                            ),
                            cells: [
                              DataCell(
                                  Text(filterDataList[index].grupKodu ?? "")),
                              DataCell(
                                  Text(filterDataList[index].raporKodu ?? "")),
                              DataCell(
                                  Text(filterDataList[index].raporAdi ?? "")),
                              DataCell(Text(
                                  filterDataList[index].sQLProsedurAdi ?? "")),
                              DataCell(
                                  Text(filterDataList[index].filtre ?? "")),
                              DataCell(Text(
                                  filterDataList[index].gosterimTipi ?? "")),
                              DataCell(
                                PopupMenuButton<String>(
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<String>>[
                                          const PopupMenuItem<String>(
                                            value: 'Kolon Tanımları',
                                            child: Text('Kolon Tanımları'),
                                          ),
                                          const PopupMenuItem<String>(
                                            value: 'Filtre Tanımları',
                                            child: Text('Filtre Tanımları'),
                                          ),
                                          const PopupMenuItem<String>(
                                            value: 'delete',
                                            child: Text('Sil'),
                                          ),
                                        ],
                                    onSelected: (String value) async {
                                      await viewModel.actionsValueSelect(value,
                                          filterDataList[index], context);
                                      filterDataList =
                                          await viewModel.listRapor();
                                      setState(() {});
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {});
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const RaporEkleView()),
              );
            },
            child: const Icon(
              Icons.add,
              color: Colors.red,
              size: 30.0,
            )),
      ),
    );
  }
}
