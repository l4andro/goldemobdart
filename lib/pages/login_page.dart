import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:minimalstore2/components/square_tile.dart";
import "../components/login_button.dart";
import "../components/my_test_field.dart";
import "shop_page.dart";
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ShopPage()));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text(message));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Login"),
            backgroundColor: Colors.transparent,
            elevation: 0),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
              const SizedBox(height: 50),
              //logo
               Image.network("https://firebasestorage.googleapis.com/v0/b/goldenmobshoes.appspot.com/o/LogoGoldemMob.png?alt=media&token=5029dbf6-4bc9-46f5-ad92-a61fe083369e", height: 255, width:255),


              Text("Que bom que você voltou!",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16)),
              const SizedBox(height: 25),

              //campo de usuário
              MyTextField(
                  controller: emailController,
                  hintText: "E-mail",
                  obscureText: false),
              const SizedBox(height: 10),
              //campo de senha
              MyTextField(
                  controller: passwordController,
                  hintText: "Senha",
                  obscureText: true),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Esqueceu a senha?",
                        style: TextStyle(color: Colors.grey.shade600))
                  ],
                ),
              ),
              const SizedBox(height: 25),
              //botão login
              LoginButton(onTap: signUserIn, text: "Entrar"),
              const SizedBox(height: 25),
              Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Ainda não possui uma conta?",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary)),
                        const SizedBox(width: 4),
                         GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterPage()));
                          },
                          child: const Text("Registre-se",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                        )
                      ]))
            ])))));
  }
}
