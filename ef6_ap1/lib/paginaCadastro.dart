import 'package:ef6_ap1/paginaInicial.dart';
import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const PaginaCadastro());
}

class PaginaCadastro extends StatelessWidget {
  const PaginaCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backGroundColor,
        ),
        debugShowCheckedModeBanner: false,
        home: const Cadastro());
  }
}

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Cadastro e Listagem")),
          backgroundColor: appBarColor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaginaInicial()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                  ),
                  child: const Text("Salvar"),
                ),
              ),
            ],
          ),
        ));
  }
}
