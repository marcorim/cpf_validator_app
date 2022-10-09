import 'package:cpf_validator_app/src/controller/cpf_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CpfApp());
}

class CpfApp extends StatelessWidget {
  const CpfApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cpfController = CpfController();

  @override
  void initState() {
    super.initState();
    cpfController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
     cpfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CPF App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             TextField(
              maxLength: 14,
              onChanged: (value) {
                  cpfController.setCpf(value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
              onPressed: () {
                cpfController.validateCpf();
              },
              child: const Text('Validar'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
              onPressed: () {
                cpfController.createCpf();
              },
              child: const Text('Gerar'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(cpfController.result),
          ],
        ),
      ),
    );
  }
}
