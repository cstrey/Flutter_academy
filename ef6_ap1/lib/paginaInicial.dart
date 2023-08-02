import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const PaginaInicial());
}

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

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
                    Navigator.pushNamed(context, "/PaginaCadastro");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                  ),
                  child: const Text("Realizar Cadastro"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print("Visualizar Cadastros");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                ),
                child: const Text("Visualizar Cadastros"),
              ),
            ],
          ),
        ));
  }
}
