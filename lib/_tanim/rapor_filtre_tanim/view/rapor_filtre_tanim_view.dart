import 'package:flutter/material.dart';
import '../../../classNav.dart';
import '../view_model/rapor_filtre_tanim_view_model.dart';
import 'rapor_filtre_ekle_view.dart';

class Filtre extends StatefulWidget {
  const Filtre({Key? key, required this.raporKodu}) : super(key: key);
  final String raporKodu;
  @override
  State<Filtre> createState() => _FiltreState();
}

class _FiltreState extends State<Filtre> {
  final RaporFiltreViewModel viewModel = RaporFiltreViewModel();
  int siraValue = 0;
  Future<void> getData() async {
    await viewModel.listRaporFlitre(widget.raporKodu);
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rapor Filtre Tanımları'),
        ),
        drawer: const NavBar(),
        body: Center(
          child: Column(
            children: [
              viewModel.loading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('Sıra')),
                            DataColumn(label: Text('Filtre Kodu')),
                            DataColumn(label: Text('Filtre Başlık')),
                            DataColumn(label: Text('Filtre Tip')),
                            DataColumn(label: Text('Filtre Değer')),
                            DataColumn(label: Text('İşlemler')),
                          ],
                          rows: List<DataRow>.generate(
                            viewModel.models.length,
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
                                DataCell(Text(
                                    viewModel.models[index].filtreBaslik ??
                                        "")),
                                DataCell(Text(
                                    viewModel.models[index].filtreKodu ?? "")),
                                DataCell(Text(
                                    viewModel.models[index].filtreBaslik ??
                                        "")),
                                DataCell(Text(
                                    viewModel.models[index].filtreTipi ?? "")),
                                DataCell(Text(
                                    viewModel.models[index].filtreDeger ?? "")),
                                DataCell(IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () async {
                                    await viewModel.deleteFiltre(
                                        viewModel.models[index], context);
                                    await viewModel
                                        .listRaporFlitre(widget.raporKodu);
                                    setState(() {});
                                  },
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) =>
                      RaporFlitreEkleView(raporKodu: widget.raporKodu)),
            );
          },
          child: Icon(Icons.add_circle),
        ),
      ),
    );
  }
}
