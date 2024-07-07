import 'package:flutter/material.dart';

import '../../../classNav.dart';
import '../view_model/rapor_kolon_tanim_view_model.dart';

class RaporKolonEkleView extends StatefulWidget {
  const RaporKolonEkleView(
      {super.key, required this.id, required this.raporKodu});
  final int id;
  final String raporKodu;
  @override
  State<RaporKolonEkleView> createState() => _RaporKolonEkleViewState();
}

class _RaporKolonEkleViewState extends State<RaporKolonEkleView> {
  final RaporKolonViewModel viewModel = RaporKolonViewModel();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(title: const Text("Rapor Kolon Ekle")),
          drawer: const NavBar(),
          body: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                const SizedBox(height: 40),
                const Text('Kolon',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  width: 250,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Kolonu Giriniz",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: viewModel.updateKolon,
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Kolon Başlık',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  width: 250,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Kolon Başlığı Giriniz",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: viewModel.updateKolonBaslik,
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Kolon Tipi:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  alignment: Alignment.center,
                  width: 200,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: 'Tip Seçiniz',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                    ),
                    borderRadius: BorderRadius.circular(25),
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'Metin',
                        child: Text('Metin'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Sayisal',
                        child: Text('Sayısal'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Fiyat',
                        child: Text('Fiyat'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Miktar',
                        child: Text('Miktar'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Tutar',
                        child: Text('Tutar'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Tarih',
                        child: Text('Tarih'),
                      ),
                    ],
                    onChanged: viewModel.updateKolonTipi,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(' Alt Toplam Hesaplansın Mı?:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  alignment: Alignment.center,
                  width: 200,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: 'seçin',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                    ),
                    borderRadius: BorderRadius.circular(
                        25), // Update the value property to selectedAltToplam
                    items: const [
                      DropdownMenuItem<String>(
                        value: "E",
                        child: Text('Evet'),
                      ),
                      DropdownMenuItem<String>(
                        value: "H",
                        child: Text('Hayır'),
                      ),
                    ],
                    onChanged: viewModel.updateAltToplamHesaplansinMi,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      await viewModel.addKolon(
                          context, widget.raporKodu, widget.id);
                    },
                    child: const Text('Rapor'),
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
