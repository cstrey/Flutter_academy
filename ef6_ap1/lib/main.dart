import 'package:ef6_ap1/paginaCadastro.dart';
import 'package:ef6_ap1/paginaInicial.dart';
import 'package:flutter/material.dart';

const Color backGroundColor = Color.fromARGB(255, 69, 91, 116);
const Color appBarColor = Color.fromARGB(255, 72, 86, 141);
const Color buttonColor = Color.fromARGB(255, 104, 139, 246);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backGroundColor,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => PaginaInicial(),
        "/PaginaCadastro": (context) => PaginaCadastro(),
      },
    );
  }
}

enum TipoSanguineo {
  aPositivo,
  aNegativo,
  bPositivo,
  bNegativo,
  oPositivo,
  oNegativo,
  abPositivo,
  abNegativo,
}

class Pessoa {
  const Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.github,
    required this.tipoSanguineo,
  });

  final String nome;
  final String email;
  final String telefone;
  final String github;
  final TipoSanguineo tipoSanguineo;

  // todo: implementar equals e hashcode
}

class EstadoListaDePessoas with ChangeNotifier {
  final _listaDePessoas = <Pessoa>[];

  List<Pessoa> get pessoas => List.unmodifiable(_listaDePessoas);

  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
    notifyListeners();
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);
    notifyListeners();
  }

  // todo: implementar metodos restantes
}
