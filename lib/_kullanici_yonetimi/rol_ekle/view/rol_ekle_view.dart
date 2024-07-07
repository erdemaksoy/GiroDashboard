import 'package:flutter/material.dart';


import '../../../classNav.dart';
import '../viewmodel/rol_ekle_view_model.dart';

class RolEklePage extends StatefulWidget {
  const RolEklePage({Key? key}) : super(key: key);

  @override
  State<RolEklePage> createState() => _RolEklePageState();
}

class _RolEklePageState extends State<RolEklePage> {
  final RolEkleViewModel viewModel = RolEkleViewModel();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Rol Tanımları",
          ),
        ),
        drawer: const NavBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text("Rol Kodu",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  width: 250,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Rol Kodu Girin",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: viewModel.updateRol,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: ElevatedButton(
                    onPressed: () => viewModel.addRole(context),
                    child: Container(
                      child: Text(
                        "Rapor",
                      ),
                    ),
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
