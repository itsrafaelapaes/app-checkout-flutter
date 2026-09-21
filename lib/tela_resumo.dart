import 'package:flutter/material.dart';

class TelaResumo extends StatelessWidget {
  final String produto;
  final int quantidade;

  const TelaResumo({
    super.key,
    required this.produto,
    required this.quantidade,
  });

  @override
  Widget build(BuildContext context) {
    const double precoUnitario = 150.00;

    final double total = quantidade * precoUnitario;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo do Pedido'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 80,
                color: Colors.green,
              ),

              const SizedBox(height: 24),

              const Text(
                'Resumo do Pedido',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              Text(
                'Produto: $produto',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'Quantidade: $quantidade',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'Total: R\$ ${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.check),
                label: const Text('Pedido Confirmado'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}