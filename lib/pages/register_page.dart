// ignore_for_file: use_build_context_synchronously

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "../components/login_button.dart";
import "../components/my_test_field.dart";
import "../components/square_tile.dart";

import "login_page.dart";
import "shop_page.dart";

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //função criar usuário
  void signUserUp() async {
    // loading
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    // Tentativa de criação de usuário
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        showErrorMessage("As senhas não conferem");
      }
      Navigator.pop(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ShopPage()));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 75, 6, 94),
        appBar: AppBar(
            backgroundColor: Color.fromARGB(0, 11, 11, 11),
            elevation: 0,
            title: const Text("Criar Conta")),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 25),
                  //logo
                Image.network("https://firebasestorage.googleapis.com/v0/b/goldenmobshoes.appspot.com/o/LogoGoldemMob.png?alt=media&token=5029dbf6-4bc9-46f5-ad92-a61fe083369e", height: 250, width: 250,),

                  //bem vindo
                  Text("Vamos criar uma conta para você!",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      )),
                  const SizedBox(height: 25),
                  //usuario
                  MyTextField(
                    controller: emailController,
                    hintText: "E-mail",
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  //senha
                  MyTextField(
                    controller: passwordController,
                    hintText: "Senha",
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),

                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirmar senha",
                    obscureText: true,
                  ),

                  const SizedBox(height: 25),
                  //Botão entrar:
                  LoginButton(onTap: signUserUp, text: "Criar conta"),
                  const SizedBox(height: 25),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "ou",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Já possui uma conta?",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: const Text(
                            "Faça login",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
