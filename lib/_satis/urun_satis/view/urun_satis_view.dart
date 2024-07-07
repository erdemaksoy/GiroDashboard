import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../../classNav.dart';
import '../../../core/components/table/build_table_row.dart';

class SatisBelge extends StatefulWidget {
  const SatisBelge({Key? key}) : super(key: key);

  @override
  _SatisBelgeState createState() => _SatisBelgeState();
}

class _SatisBelgeState extends State<SatisBelge> {
  late DateTime selectedDate; // Declare selectedDate variable
  String _barcodeResult = 'Barkodu giriniz';
  final TextEditingController _barcodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  void dispose() {
    _barcodeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ürün Satış Belgeleri'),
        ),
        drawer: const NavBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 15),
          child: Center(
            child: Column(
              children: [
                Table(
                  defaultColumnWidth: const FlexColumnWidth(1.0),
                  children: [
                    buildTableRow(
                      'Barkod',
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _barcodeController,
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
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () => _scanBarcode(),
                          ),
                        ],
                      ),
                    ),
                    buildTableRow(
                      'Ürün Kodu',
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Ürün Kodunu Giriniz",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildTableRow(
                      'Tarih',
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: selectedDate != ""
                                  ? "${selectedDate.day}.${selectedDate.month}.${selectedDate.year}"
                                  : "gg.aa.yyyy",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => _selectDate(context),
                            icon: const Icon(Icons.calendar_month),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Rapor butonuna tıklanınca yapılacak işlemleri ekleyebilirsiniz.
                    },
                    child: const Text('Rapor'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _scanBarcode() async {
    String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'İptal',
      true,
      ScanMode.BARCODE,
    );

    // Barkod sayılarına filtre uygulayarak sadece rakamları alıyoruz.
    String numericBarcode = barcodeScanResult.replaceAll(RegExp(r'[^0-9]'), '');

    // TextFormField içeriğini güncelle
    setState(() {
      _barcodeResult = numericBarcode;
      _barcodeController.text = numericBarcode;
    });
  }
}
