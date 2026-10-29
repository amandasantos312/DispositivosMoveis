import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gasolina x Álcool',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Calculadora Álcool x Gasolina'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _controllerGasolina = TextEditingController();
  final TextEditingController _controllerAlcool = TextEditingController();

  String _resultado = '';

  final String _urlImagem = 
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDtc--2nlwatNFqPVB0iUZVQKV81wDmT3F8Nm1x93i6A&s=10';  

  void _calcular() {
    double? valorGasolina = double.tryParse(_controllerGasolina.text);
    double? valorAlcool = double.tryParse(_controllerAlcool.text);

    if (valorGasolina == null || valorAlcool == null || valorGasolina <= 0) {
      setState(() {
        _resultado = 'Por favor, insira valores válidos!';        
      });
      return;
    }

    //(Valor alcool / valor gasolina) * 100
    double calculo = (valorAlcool / valorGasolina) * 100;

    setState(() {
      if (calculo >= 70) {
        _resultado = 'Resultado: ${calculo.toStringAsFixed(1)}%\nAbastecer com Álcool';
      } else {
        _resultado = 'Resultado: ${calculo.toStringAsFixed(1)}%\nAbastecer com Gasolina';
      }
    });
  }

  @override
  void dispose() {
    _controllerGasolina.dispose();
    _controllerAlcool.dispose();
    super.dispose();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Gasolina vs Alcool',
            textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),

            // Imagem vinda do link
            Image.network(
              _urlImagem,
              height: 180,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.local_gas_station,
                  size: 100,
                  color: Colors.blue,
                );
              },
            ),
            const SizedBox(height: 24),

            // Campo Gasolina
            TextField(
              controller: _controllerGasolina,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Valor da gasolina',
              ),
            ),
            const SizedBox(height: 12),

            // Campo Álcool
            TextField(
              controller: _controllerAlcool,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Valor do álcool',
              ),
            ),
            const SizedBox(height: 24),

            // Botão Calcular
            ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                'Calcular',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),

            // Só exibe o widget de Resultado se _resultado NÃO estiver vazio
            if (_resultado.isNotEmpty)
              Text(
                _resultado,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
          ],
        ),
      ),
    );
  }
}