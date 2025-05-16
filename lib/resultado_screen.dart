import 'package:flutter/material.dart';

class ResultadoScreen extends StatelessWidget {
  final double imc;

  const ResultadoScreen({super.key, required this.imc});

  String _classificarIMC() {
    if (imc < 18.5) return 'Abaixo do peso';
    if (imc < 25) return 'Peso normal';
    if (imc < 30) return 'Sobrepeso';
    if (imc < 35) return 'Obesidade grau 1';
    if (imc < 40) return 'Obesidade grau 2';
    return 'Obesidade grau 3';
  }

  Color _corIMC() {
    if (imc < 18.5) return Colors.yellow;
    if (imc < 25) return Colors.green;
    if (imc < 30) return Colors.orange;
    if (imc < 35) return Colors.deepOrange;
    if (imc < 40) return Colors.red;
    return Colors.purple;
  }

  @override
  Widget build(BuildContext context) {
    final classificacao = _classificarIMC();
    final cor = _corIMC();

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado do IMC')),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            border: Border.all(color: cor, width: 4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.favorite, size: 80, color: cor),
              const SizedBox(height: 20),
              Text(
                'Seu IMC é:',
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
              Text(
                imc.toStringAsFixed(2),
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: cor),
              ),
              const SizedBox(height: 16),
              Text(
                classificacao,
                style: TextStyle(fontSize: 24, color: cor),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Calcular Novamente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
