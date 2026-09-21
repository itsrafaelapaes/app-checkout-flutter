import 'package:flutter/material.dart';
import 'tela_resumo.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Checkout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const TelaContador(),
    );
  }
}

class TelaContador extends StatefulWidget {
  const TelaContador({super.key});

  @override
  State<TelaContador> createState() => _TelaContadorState();
}

class _TelaContadorState extends State<TelaContador> {
  int quantidade = 1;

  final String nomeProduto = 'Smartphone Galaxy S24';
  final double precoUnitario = 150.00;

  void incrementar() {
    setState(() {
      quantidade++;
    });
  }

  void decrementar() {
    if (quantidade > 1) {
      setState(() {
        quantidade--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double total = quantidade * precoUnitario;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleção de Itens'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_cart,
                size: 80,
                color: Colors.blue,
              ),

              const SizedBox(height: 20),

              Text(
                nomeProduto,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              Text(
                'R\$ ${precoUnitario.toStringAsFixed(2)} por unidade',
                style: const TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 30),

              const Text(
                'Quantidade selecionada:',
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: decrementar,
                    icon: const Icon(Icons.remove),
                    iconSize: 30,
                  ),

                  const SizedBox(width: 20),

                  Text(
                    '$quantidade',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(width: 20),

                  IconButton(
                    onPressed: incrementar,
                    icon: const Icon(Icons.add),
                    iconSize: 30,
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Text(
                'Total: R\$ ${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaResumo(
                        produto: nomeProduto,
                        quantidade: quantidade,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Avançar para Resumo',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}