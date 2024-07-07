import 'package:flutter/material.dart';

import '../../../classNav.dart';
import '../../../core/components/table/build_table_row.dart';

class OdemeTipli extends StatefulWidget {
  const OdemeTipli({Key? key}) : super(key: key);

  @override
  State<OdemeTipli> createState() => _OdemeTipliState();
}

class _OdemeTipliState extends State<OdemeTipli> {
  String selected1 = 'Seçim Yapınız';
  DateTime selectedbasDate = DateTime.now();
  DateTime selectedbitDate = DateTime.now(); // Added table data

  Future<void> _selectbitDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedbitDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedbitDate) {
      setState(() {
        selectedbitDate = picked;
      });
    }
  }

  Future<void> _selectbasDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedbasDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedbasDate) {
      setState(() {
        selectedbasDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Ödeme Tipli Satış"),
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
                      'Başlangıç Tarihi',
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: selectedbasDate != null
                                  ? "${selectedbasDate.day}.${selectedbasDate.month}.${selectedbasDate.year}"
                                  : "gg.aa.yyyy",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => _selectbasDate(context),
                            icon: const Icon(Icons.calendar_month),
                          ),
                        ],
                      ),
                    ),
                    buildTableRow(
                      'Bitiş Tarihi',
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: selectedbitDate != null
                                  ? "${selectedbitDate.day}.${selectedbitDate.month}.${selectedbitDate.year}"
                                  : "gg.aa.yyyy",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => _selectbitDate(context),
                            icon: const Icon(Icons.calendar_month),
                          ),
                        ],
                      ),
                    ),
                    buildTableRow(
                        'Şube',
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                          ),
                          borderRadius: BorderRadius.circular(25),
                          value: selected1,
                          items: const [
                            DropdownMenuItem<String>(
                              value: "Seçim Yapınız",
                              child: Text("Seçim Yapınız"),
                            ),
                            DropdownMenuItem<String>(
                              value: "MERKEZ",
                              child: Text("MERKEZ"),
                            ),
                            DropdownMenuItem<String>(
                              value: "ATAKULE",
                              child: Text("ATAKULE"),
                            ),
                            DropdownMenuItem<String>(
                              value: "BOSNA",
                              child: Text("BOSNA"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selected1 = value!;
                            });
                          },
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    child: const Text("Rapor"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
