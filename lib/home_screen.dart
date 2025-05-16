import 'package:flutter/material.dart';
import 'dart:math';
import 'resultado_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

void _calcularIMC() {
  if (_formKey.currentState!.validate()) {

    final pesoTexto = _pesoController.text.replaceAll(',', '.');
    final alturaTexto = _alturaController.text;

    final peso = double.parse(pesoTexto);
    final alturaCm = double.parse(alturaTexto);
    final altura = alturaCm / 100; 

    final imc = peso / pow(altura, 2);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoScreen(imc: imc),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de IMC')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png', 
                height: 150,
              ),
              TextFormField(
                controller: _pesoController,
                decoration: const InputDecoration(labelText: 'Peso (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o peso' : null,
              ),
              TextFormField(
                controller: _alturaController,
                decoration: const InputDecoration(labelText: 'Altura (cm)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe a altura' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularIMC,
                child: const Text('Calcular IMC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
