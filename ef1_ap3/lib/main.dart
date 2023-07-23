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

enum EstadoDoJogo {
  emAndamento,
  ganhou,
  perdeu,
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final random = Random();

  var vitorias = 0;
  var derrotas = 0;
  var botaoCorreto = 0;
  var clicks = 0;
  var estadoDoJogo = EstadoDoJogo.emAndamento;

  @override
  void initState() {
    super.initState();

    iniciarJogo();
  }

  void tentativa(int opcao) {
    setState(() {
      if (opcao == botaoCorreto) {
        estadoDoJogo = EstadoDoJogo.ganhou;
        vitorias++;
      } else {
        clicks++;
      }

      if (clicks >= 2 && estadoDoJogo != EstadoDoJogo.ganhou) {
        estadoDoJogo = EstadoDoJogo.perdeu;
        derrotas++;
      }
    });
  }

  void iniciarJogo() {
    setState(() {
      botaoCorreto = random.nextInt(3);

      clicks = 0;

      estadoDoJogo = EstadoDoJogo.emAndamento;
    });
  }

  @override
  Widget build(BuildContext context) {
    return switch (estadoDoJogo) {
      EstadoDoJogo.ganhou => GanhouJogo(iniciarJogo),
      EstadoDoJogo.perdeu => PerdeuJogo(iniciarJogo),
      EstadoDoJogo.emAndamento =>
        JogoEmAndamento(vitorias, derrotas, tentativa),
    };
  }
}

class PerdeuJogo extends StatelessWidget {
  const PerdeuJogo(this.reiniciar);

  final void Function() reiniciar;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            child: Text("Voce perdeu",
                style: Theme.of(context).textTheme.headlineMedium!)),
        const SizedBox(height: 20),
        ElevatedButton(
          child: const Text('Jogar novamente'),
          onPressed: () {
            reiniciar();
          },
        ),
      ]),
    );
  }
}

class GanhouJogo extends StatelessWidget {
  const GanhouJogo(this.reiniciar);

  final void Function() reiniciar;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            child: Text("Voce ganhou",
                style: Theme.of(context).textTheme.headlineMedium!)),
        const SizedBox(height: 20),
        ElevatedButton(
          child: const Text('Jogar novamente'),
          onPressed: () {
            reiniciar();
          },
        ),
      ]),
    );
  }
}

class JogoEmAndamento extends StatelessWidget {
  const JogoEmAndamento(
    this.vitorias,
    this.derrotas,
    this.tentativa,
  );

  final int vitorias;
  final int derrotas;

  final void Function(int) tentativa;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text("Vitorias: $vitorias",
            style: Theme.of(context).textTheme.headlineMedium),
        Text("Derrotas: $derrotas",
            style: Theme.of(context).textTheme.headlineMedium),
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
