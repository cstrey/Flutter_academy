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
  final Random _random = Random();

  Color _color = Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Hello World',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: _color),
        ),
        ElevatedButton(
          child: const Text('Cor Aleatoria'),
          onPressed: () {
            setState(() {
              _color = Color.fromARGB(
                255,
                _random.nextInt(256),
                _random.nextInt(256),
                _random.nextInt(256),
              );
            });
          },
        ),
      ],
    );
  }
}
