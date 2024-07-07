import 'package:flutter/material.dart';

import '../../../classNav.dart';
import '../view_model/rapor_filtre_tanim_view_model.dart';

class RaporFlitreEkleView extends StatefulWidget {
  const RaporFlitreEkleView({super.key, required this.raporKodu});
  final String raporKodu;
  @override
  State<RaporFlitreEkleView> createState() => _RaporFlitreEkleViewState();
}

class _RaporFlitreEkleViewState extends State<RaporFlitreEkleView> {
  final RaporFiltreViewModel viewModel = RaporFiltreViewModel();
  int siraValue = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text("Rapor Filtre Ekle")),
        drawer: NavBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              const SizedBox(height: 40),
              const Text(
                'Filtre Kodu',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Kodu Giriniz",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: viewModel.updateFiltreKodu,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Filtre Başlık',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Başlık Giriniz",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: viewModel.updateFiltreBaslik,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Filtre tipi:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                alignment: Alignment.center,
                width: 200,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: 'Filtre Tipi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                  ),
                  borderRadius: BorderRadius.circular(25),
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'Input',
                      child: Text('Input'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'rehber',
                      child: Text('Rehber'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'gorunmez',
                      child: Text('Görünmez'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'liste',
                      child: Text('Liste'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'tarih',
                      child: Text('Tarih'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'barkod',
                      child: Text('Barkod'),
                    ),
                  ],
                  onChanged: viewModel.updateFiltreTipi,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Filtre Değer',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_upward),
                      onPressed: () {
                        setState(() {
                          siraValue++;
                        });
                      },
                    ),
                    SizedBox(
                      width: 100,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: siraValue.toString(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_downward),
                      onPressed: () {
                        setState(() {
                          if (siraValue > 0) {
                            siraValue--;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Save button
              ElevatedButton(
                onPressed: () async {
                  await viewModel.addFiltre(context, widget.raporKodu, 1);
                },
                child: const Text('Kaydet'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
