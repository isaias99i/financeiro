import 'package:financeiro/screens/ExtrasScreen.dart';
import 'package:financeiro/widgets/TableCellWidget.dart';
import 'package:flutter/material.dart';

class ReceitasScreen extends StatelessWidget {
  const ReceitasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Dados da tabela
    final List<String> parentHeaders = [
      'Mês',
      'Salário',
      'Extras',
      'Total',
    ];

    final List<int> parentSpans = [
      1, // "Mês" ocupa 1 coluna
      1, // "Salário" ocupa 5 colunas
      1, // "Extras" ocupa 5 colunas
      1, // "Total" ocupa 3 colunas
    ];

    final List<List<dynamic>> data = [
      ['nov/2024', 2124.60, 1402.12, 3526.0, 72.0],
      ['dez/2024', 2884.71, 2527.87, 5412.0, 58.0],
      ['jan/2025', 3510.00, 0.0, 5412.0, 58.0],
      ['fev/2025', 3510.00, 0.0, 0.0, 58.0],
      ['mar/2025', 3510.00, 0.0, 0.0, 58.0],
      ['abr/2025', 3510.00, 0.0, 0.0, 58.0],
      ['mai/2025', 3510.00, 0.0, 0.0, 58.0],
      ['jun/2025', 3510.00, 0.0, 0.0, 58.0],
      ['jul/2025', 3510.00, 4462.48, 0.0, 58.0],
      ['ago/2025', 3510.00, 0.0, 0.0, 58.0],
      ['set/2025', 3510.00, 0.0, 0.0, 58.0],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: parentHeaders.asMap().entries.map((entry) {
                  final index = entry.key;
                  final header = entry.value;
                  return GestureDetector(
                    onTap: () {
                      if(entry.key == 2){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExtrasScreen(),
                          ),
                        );
                      }

                    },
                    child: Container(
                      width: parentSpans[index] * 100,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text(
                        header,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }).toList(),
              ),
              //Dados
              ...data.map((row) {
                return Row(
                  children: [
                    for (var i = 0; i < parentHeaders.length; i++)
                      TableCellWidget(
                        content: i == 0
                            ? row[i]
                            : 'R\$ ${row[i].toStringAsFixed(2)}',
                        width: i == 0 ? 100 : 100,
                        textColor: row[i] is double && row[i] >= 0
                            ? Colors.blue
                            : Colors.black,
                      ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
