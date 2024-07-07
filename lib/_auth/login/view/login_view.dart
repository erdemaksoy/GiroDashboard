import 'package:flutter/material.dart';

import '../viewmodel/login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginViewModel viewModel = LoginViewModel();
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late bool isRememberMe;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    isRememberMe = false;
    initViewModel();
  }

  void initViewModel() async {
    await viewModel.loadCredentials();
    _usernameController.text = viewModel.kullaniciAdi;
    _passwordController.text = viewModel.sifre;
    isRememberMe = viewModel.isRememberMe;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
            title: const Center(child: Text('PosBack BI')),
            automaticallyImplyLeading: false),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 100,
                  width: 300,
                  child: Image.asset("assets/images/posbacklogo.jpeg",
                      fit: BoxFit.fill)),
              const SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    labelText: 'Kullanıcı Adı', border: OutlineInputBorder()),
                onChanged: viewModel.updateUserName,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    labelText: 'Şifre', border: OutlineInputBorder()),
                obscureText: true,
                onChanged: viewModel.updatePassword,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckboxMenuButton(
                    child: const Text(
                      "Beni Hatırla",
                      style: TextStyle(fontSize: 16),
                    ),
                    value: isRememberMe,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = value ?? false;
                        viewModel.setRememberMe(isRememberMe);
                      });
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      onPressed: () async => await viewModel.login(context),
                      child: const Text("Giriş Yap"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
