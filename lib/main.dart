import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Moedas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber)
            .copyWith(background: Color.fromARGB(255, 1, 52, 57)),
        primaryColor: Colors.blue,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Color.fromARGB(255, 60, 255, 0),
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            color: Color.fromARGB(255, 60, 255, 0),
            fontSize: 18.0,
          ),
        ),
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Variáveis para armazenar os valores dos operandos
  double _real = 0;
  double _dolar = 0;
  double _euro = 0;

  // Função para calcular o IMC
  void _calcularIMC() {
    setState(() {});
  }

  double _convertRealToDollar(double value) {
    // Implemente a lógica de conversão de Real para Dólar aqui
    return value * 0.19; // Exemplo: 1 Real = 0.18 Dólar
  }

  double _convertRealToEuro(double value) {
    // Implemente a lógica de conversão de Real para Euro aqui
    return value * 0.18; // Exemplo: 1 Real = 0.15 Euro
  }

  double _convertDollarToReal(double value) {
    // Implemente a lógica de conversão de Dólar para Real aqui
    return value * 5.15; // Exemplo: 1 Dólar = 5.5 Real
  }

  double _convertDollarToEuro(double value) {
    // Implemente a lógica de conversão de Dólar para Euro aqui
    return value * 0.93; // Exemplo: 1 Dólar = 0.83 Euro
  }

  double _convertEuroToReal(double value) {
    // Implemente a lógica de conversão de Euro para Real aqui
    return value * 5.51; // Exemplo: 1 Euro = 6.7 Real
  }

  double _convertEuroToDollar(double value) {
    // Implemente a lógica de conversão de Euro para Dólar aqui
    return value * 1.07; // Exemplo: 1 Euro = 1.2 Dólar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Moedas'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Campo de entrada para o peso
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Digite o valor em Real (R\$):',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 0, 255, 34)),
                  hintStyle: TextStyle(color: Color.fromARGB(255, 0, 255, 34)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  )),
              onChanged: (value) {
                setState(() {
                  _real = double.tryParse(value) ?? 0;
                  _dolar = _convertRealToDollar(_real);
                  _euro = _convertRealToEuro(_real);
                });
              },
            ),
            SizedBox(height: 20.0),
            // Campo de entrada para a altura
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite o valor Dolár (\$):',
                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 255, 34)),
                hintStyle: TextStyle(color: Color.fromARGB(255, 0, 255, 34)),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _dolar = double.tryParse(value) ?? 0;
                  _real = _convertDollarToReal(_dolar);
                  _euro = _convertDollarToEuro(_dolar);
                });
              },
            ),
            SizedBox(height: 20.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite o valor em Euro (€)',
                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 255, 34)),
                hintStyle: TextStyle(color: Color.fromARGB(255, 0, 255, 34)),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _euro = double.tryParse(value) ?? 0;
                  _real = _convertEuroToReal(_euro);
                  _dolar = _convertEuroToDollar(_euro);
                });
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Valor em Real: R\$ ${_real.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
            Text(
              'Valor em Dólar: \$ ${_dolar.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
            Text(
              'Valor em Euro: € ${_euro.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
