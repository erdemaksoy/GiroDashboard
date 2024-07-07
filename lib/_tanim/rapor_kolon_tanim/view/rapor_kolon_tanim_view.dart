import 'package:flutter/material.dart';

import '../../../classNav.dart';
import '../model/rapor_kolon_tanim_model.dart';
import '../view_model/rapor_kolon_tanim_view_model.dart';
import 'rapor_kolon_ekle_view.dart';

class Kolon extends StatefulWidget {
  Kolon({Key? key, required this.raporKodu, required this.id})
      : super(key: key);
  final String raporKodu;
  final int id;
  List<RaporKolonModel> filteredData = [];
  @override
  State<Kolon> createState() => _KolonState();
}

class _KolonState extends State<Kolon> {
  final RaporKolonViewModel viewModel = RaporKolonViewModel();
  Future<void> getData() async {
    await viewModel.listRaporKolon(widget.raporKodu);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rapor Kolon Tanımları'),
        ),
        drawer: const NavBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              /*SizedBox(
                width: 600, // Set the width to a finite value
                child: TextField(
                  onChanged: (value) async {
                    viewModel.updateSearchText(value);

                    setState(() {
                      viewModel.getFilteredData();
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Kolon Ara',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 20),*/
              DataTable(
                columns: const [
                  DataColumn(label: Text('Kolon')),
                  DataColumn(label: Text('Kolon Başlık')),
                  DataColumn(label: Text('Kolon Tipi')),
                  DataColumn(label: Text('altToplamHesaplansinMi')),
                  DataColumn(label: Text('İşlemler')),
                ],
                rows: List<DataRow>.generate(
                  viewModel.models.length,
                  (index) => DataRow.byIndex(
                    index: index,
                    color: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        return index % 2 == 0 ? Colors.grey.shade400 : null;
                      },
                    ),
                    cells: [
                      DataCell(Text(viewModel.models[index].kolon ?? "")),
                      DataCell(Text(viewModel.models[index].kolonBaslik ?? "")),
                      DataCell(Text(viewModel.models[index].kolonTipi ?? "")),
                      DataCell(Text(
                          viewModel.models[index].altToplamHesaplansinMi ??
                              "")),
                      DataCell(IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await viewModel.deleteKolon(
                              context, viewModel.models[index]);
                          await viewModel.listRaporKolon(widget.raporKodu);
                          setState(() {});
                        },
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {});
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => RaporKolonEkleView(
                          id: widget.id,
                          raporKodu: widget.raporKodu,
                        )),
              );
            },
            child: const Icon(Icons.add_circle_outlined)));
  }
}
