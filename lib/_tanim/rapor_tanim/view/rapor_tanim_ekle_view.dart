import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:girodashboard/core/extension/string_extension.dart';

import '../../../classNav.dart';
import '../../../service/tanim/tanim_grup_service.dart';
import '../../../service/tanim/tanim_service.dart';
import '../../rapor_grup_tanim/model/rapor_grup_tanim_model.dart';
import '../model/rapor_tanim_model.dart';
import '../view_model/rapor_tanim_view_model.dart';

class RaporEkleView extends StatefulWidget {
  const RaporEkleView({super.key});

  @override
  State<RaporEkleView> createState() => _RaporEkleViewState();
}

class _RaporEkleViewState extends State<RaporEkleView> {
  String? selectedSubeKodu = 'Stok'; // Set an initial branch code
  String? selectedAltToplam = 'Grid'; //
  String raporkoduHint = "Rapor Kodu";
  List<RaporGrupTanimModel> grups = [];
  ITanimService raporservice = TanimService();
  ITanimGrupService grupService = TanimGrupService();
  Future<void> raporKodHintChange() async {
    final response = await raporservice.getRapor();
    List<RaporTanimModel> rModels = response.body;
    RaporTanimModel? model = rModels
        .where((element) => element.grupKodu == viewModel.grupKodu)
        .lastOrNull;
    if (model != null) {
      int i = model.raporKodu!.tolastNumberget;
      raporkoduHint = model.raporKodu!.toReplaceLastValue(++i);
    } else {
      raporkoduHint = "${viewModel.grupKodu}-001";
    }

    setState(() {});
  }

  Future<void> getData() async {
    final response = await grupService.getRaporGrup();
    if (response.isSucced) {
      grups = response.body;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  final RaporViewModel viewModel = RaporViewModel();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(title: Text("Rapor Ekle")),
          drawer: const NavBar(),
          body: SingleChildScrollView(
              padding: const EdgeInsets.all(
                  20), // Add padding to the SingleChildScrollView
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'Grup Kodu:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      padding: const EdgeInsets.only(top: 15),
                      decoration: InputDecoration(
                        hintText: 'Seçiniz',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                      ),
                      onChanged: (value) async {
                        viewModel.updateGrupKodu(value);
                        await raporKodHintChange();
                      },
                      items: [
                        for (var grup
                            in grups) // Assuming raporGruplar is a list of RaporGrupTanimModel
                          DropdownMenuItem(
                            value: grup.grupKodu!,
                            child: Text('${grup.grupAciklama}'),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Rapor Kodu',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      width: 250,
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: raporkoduHint,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: viewModel.updateRaporKodu,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Rapor Adı',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Adı Giriniz",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: viewModel.updateRaporAdi,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'SQL Procedure Adı',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "SQL Procedure Adı Giriniz(EXEC yazmayın)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: viewModel.updateSQLProsedurAdi,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Filtre',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Filtreyi Giriniz",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: viewModel.updateFiltre,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Gösterim Tipi:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: 'Seçiniz',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                      ),
                      onChanged: viewModel.updateGosterimTipi,
                      items: const [
                        'Grid',
                        'Kırılımlı Grid',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        await viewModel.addRapor(context);
                        setState(() {});
                      },
                      child: const Text('Kaydet'),
                    )
                  ]))),
    );
  }
}
