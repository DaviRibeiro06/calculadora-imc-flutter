import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Tema inicial com cor fixa
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green), // Definindo uma cor fixa inicialmente
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MinhaCalculadoraDeImc(),
    );
  }
}

class MinhaCalculadoraDeImc extends StatefulWidget {
  @override
  State<MinhaCalculadoraDeImc> createState() => _MinhaCalculadoraDeImcState();
}

class _MinhaCalculadoraDeImcState extends State<MinhaCalculadoraDeImc> {
  TextEditingController alturaController = TextEditingController(text: '');
  TextEditingController pesoController = TextEditingController(text: '');
  double imc = 0;
  String classificacao = '';
  Color corResultado = Colors.green; // Inicializando com cor padrão

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Atualizando o colorScheme com a variável corResultado
    final ThemeData theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: corResultado), // Cor dinâmica
      useMaterial3: true,
    );

    return MaterialApp(
      title: 'Calculadora De IMC',
      theme: theme,  // Usando o tema atualizado com cor dinâmica
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imc == 0
                  ? Text(
                      'Adicione valores de peso e altura \npara calcular seu IMC',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          border: Border.all(width: 10, color: corResultado)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${imc.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 42,
                              color: corResultado,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            classificacao,
                            style: TextStyle(
                              fontSize: 20,
                              color: corResultado,
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('Seu Peso'),
                      SizedBox(height: 7),
                      Container(
                        width: 75,
                        child: TextField(
                          controller: pesoController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixText: 'Kg',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 22),
                  Column(
                    children: [
                      Text('Sua Altura'),
                      SizedBox(height: 7),
                      Container(
                        width: 75,
                        child: TextField(
                          controller: alturaController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixText: 'M',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 22),
              Container(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    try {
                      double peso = double.parse(pesoController.text);
                      double altura = double.parse(alturaController.text);
                      setState(() {
                        imc = peso / (altura * altura);
                        classificacao = getClassificacaoIMC(imc);
                        corResultado = getCorIMC(imc);
                      });
                    } on Exception {
                      setState(() {
                        imc = 0;
                        classificacao = '';
                        corResultado = Colors.green;
                        pesoController.clear();
                        alturaController.clear();
                      });
                      print('Erro ao converter');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: corResultado,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Calcular',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getClassificacaoIMC(double imc) {
    if (imc <= 18.5) {
      return 'Abaixo do peso';
    } else if (imc > 18.5 && imc <= 24.9) {
      return 'Peso Normal';
    } else if (imc >= 25 && imc < 29.9) {
      return 'Sobrepeso';
    } else if (imc >= 30 && imc < 34.9) {
      return 'Obesidade Grau I';
    } else if (imc >= 35 && imc < 39.9) {
      return 'Obesidade Grau II';
    } else if (imc > 40) {
      return 'Obesidade Grau III';
    }
    return '';
  }

  Color getCorIMC(double imc) {
    if (imc <= 18.5) {
      return Colors.blue;
    } else if (imc > 18.5 && imc <= 24.9) {
      return Colors.green;
    } else if (imc >= 25 && imc < 29.9) {
      return Colors.yellow;
    } else if (imc >= 30 && imc < 34.9) {
      return Colors.orange;
    } else if (imc >= 35 && imc < 39.9) {
      return Colors.red;
    } else if (imc > 40) {
      return Colors.purple;
    }
    return Colors.black;
  }
}
