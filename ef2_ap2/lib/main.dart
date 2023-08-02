import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Pilha(
          backgroundColor: Colors.grey,
          children: [
            Colors.red,
            Colors.green,
            Colors.blue,
          ],
        ),
        Pilha(
          backgroundColor: Colors.black,
          children: [
            Colors.cyan,
            Colors.purple,
            Colors.yellow,
          ],
        ),
        Pilha(
          children: [
            Colors.red,
            Colors.yellow,
            Colors.blue,
          ],
        ),
        Pilha(
          backgroundColor: Colors.white,
          children: [
            Colors.deepPurple,
            Colors.deepOrange,
            Colors.yellow,
            Colors.lightGreen,
          ],
        ),
      ],
    );
  }
}

class Pilha extends StatelessWidget {
  const Pilha({
    this.backgroundColor,
    required this.children,
  });

  final Color? backgroundColor;
  final List<Color> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      color: backgroundColor,
      width: 80, // diminui 20% para caber na tela
      height: 80,
      child: Stack(
        children: [
          for (var index = 0; index < children.length; index++)
            Positioned(
              top: index * 8 + 8,
              left: index * 8 + 8,
              child: Container(
                width: 40, // diminui 20% para caber na tela
                height: 40,
                color: children[index],
              ),
            ),
        ],
      ),
    );
  }
}
