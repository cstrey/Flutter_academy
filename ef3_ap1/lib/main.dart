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
      home: Scaffold(
        body: WidgetFormulario(),
      ),
    );
  }
}

class WidgetFormulario extends StatefulWidget {
  @override
  _WidgetFormularioState createState() => _WidgetFormularioState();
}

class _WidgetFormularioState extends State<WidgetFormulario> {
  final _formKey = GlobalKey<FormState>();
  bool _estaInativo = false;
  String? _nome;
  int? _idade;

  void _salvarFormulario() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {});
    }
  }

  String? _validarNome(String? nome) {
    if (nome == null) {
      return "O nome não pode ser vazio";
    }
    if (nome.length < 3) {
      return "O nome precisa ter pelo menos 3 letras";
    }
    if (nome.startsWith(RegExp(r'[^A-Z]'))) {
      return "O nome precisa começar com uma letra maiúscula";
    }
    return null;
  }

  String? _validarIdade(String? valor) {
    if (valor == null) {
      return "A idade não pode ser vazia";
    }
    int idade = int.parse(valor);
    if (idade < 18) {
      return "A idade precisa ser maior ou igual a 18";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Nome"),
                  validator: _validarNome,
                  onSaved: (novoValor) => _nome = novoValor,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Idade"),
                  validator: _validarIdade,
                  onSaved: (novoValor) => _idade = int.tryParse(novoValor!),
                ),
                SwitchListTile(
                  title: const Text("Ativo"),
                  value: _estaInativo,
                  onChanged: (novoValor) =>
                      setState(() => _estaInativo = novoValor),
                ),
                ElevatedButton(
                  onPressed: _salvarFormulario,
                  child: const Text("Salvar"),
                ),
              ],
            ),
          ),
          if (_formKey.currentState != null &&
              _formKey.currentState!.validate())
            Container(
              padding: const EdgeInsets.all(15),
              color: _estaInativo ? Colors.green : Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Dados Salvos:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Nome: $_nome'),
                  Text('Idade: $_idade'),
                  Text('Status: ${_estaInativo ? 'Ativo' : 'Inativo'}'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
