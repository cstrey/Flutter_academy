import 'package:flutter/material.dart';

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
      initialRoute: "/",
      routes: {
        "/": (context) => const tela(),
        "/telaAzul": (context) => const telaAzul(),
        "/telaVermelha": (context) => const telaVermelha(),
        "/telaVerde": (context) => const telaVerde(),
      },
    );
  }
}

class tela extends StatelessWidget {
  const tela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Selecione uma cor"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/telaAzul");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 0, 255),
              ),
              child: const Text("Azul"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/telaVermelha");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 0, 0),
              ),
              child: const Text("Vermelho"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/telaVerde");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 255, 0),
              ),
              child: const Text("Verde"),
            ),
          ]),
        ));
  }
}

class telaAzul extends StatelessWidget {
  const telaAzul({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 255),
        body: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                  child: const Text("voltar para tela inicial"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ])
        ]));
  }
}

class telaVermelha extends StatelessWidget {
  const telaVermelha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        body: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                  child: const Text("voltar para tela inicial"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ])
        ]));
  }
}

class telaVerde extends StatelessWidget {
  const telaVerde({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 255, 0),
        body: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                  child: const Text("voltar para tela inicial"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ])
        ]));
  }
}
