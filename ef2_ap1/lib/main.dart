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
      home: const Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                width: 50,
                height: 50,
                color: Colors.red,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                width: 50,
                height: 50,
                color: Colors.green,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ],
          ),
          Container(
            color: Colors.yellow,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  color: Colors.purple,
                  width: 50,
                  height: 100,
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  color: Colors.cyan,
                  width: 50,
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 8,
                        ),
                        color: Colors.purple,
                        width: 50,
                        height: 50,
                      ),
                      Container(
                        color: Colors.cyan,
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            width: 100,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.black,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
