import 'package:flutter/material.dart';
import 'dart:math';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final random = Random();

  var botaoCorreto = 0;
  var clicks = 0;
  var ganhou = false;
  var perdeu = false;

  @override
  void initState() {
    super.initState();

    botaoCorreto = random.nextInt(3);
  }

  void tentativa(int opcao) {
    setState(() {
      if (opcao == botaoCorreto) {
        ganhou = true;
      } else {
        clicks++;
      }

      if (clicks >= 2 && !ganhou) {
        perdeu = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ganhou) {
      return Container(
          color: Colors.green,
          child: Center(
            child: Text("Voce ganhou",
                style: Theme.of(context).textTheme.headlineMedium),
          ));
    }

    // Se o perdeu ganhou, retorna a mensagem de fracasso com o fundo em vermelho
    if (perdeu) {
      return Container(
          color: Colors.red,
          child: Center(
            child: Text("Voce perdeu",
                style: Theme.of(context).textTheme.headlineMedium!),
          ));
    }

    // Nesse momento o jogo ainda nao foi finalizado
    return Column(
      children: [
        const SizedBox(height: 20),
        ElevatedButton(
          child: const Text("Botão A"),
          onPressed: () {
            tentativa(0);
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          child: const Text("Botão B"),
          onPressed: () {
            tentativa(1);
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          child: const Text("Botão C"),
          onPressed: () {
            tentativa(2);
          },
        ),
      ],
    );
  }
}
