import 'package:financeiro/widgets/TableCellWidget.dart';
import 'package:flutter/material.dart';

class ExtrasScreen extends StatelessWidget {
  const ExtrasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Dados Coluna principal
    final List<String> parentHeaders = [
      'Geral',
      'Receita',
      'Investimento',
      'Despesas',
      'Empréstimos',
      'Cartões',
    ];

    final List<int> parentSpans = [
      1, // "Geral" ocupa 1 coluna
      1, // "Receita" ocupa 1 colunas
      1, // "Investimento" ocupa 1 colunas
      1, // "Despesas" ocupa 1 colunas
      1, // "Empréstimos" ocupa 1 colunas
      1, // "Cartões" ocupa 1 colunas
    ];

    final List<String> childHeaders = ['Mês', 'Data', 'Motivo', 'Valor'];

    final List<List<dynamic>> data = [
      ['nov/2024', '05/11/2024', 'Cashback Melliuz', 38.72],
      ['nov/2024', '08/11/2024', 'HotMilhas', 1999.25]
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Extras'),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //Linha Principal
                Row(
                  children: parentHeaders.asMap().entries.map((entry) {
                    final index = entry.key;
                    final header = entry.value;
                    return Container(
                      width: parentSpans[index] * 120,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
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
                    );
                  }).toList(),
                ),
                // Linha das Subcolunas
                Row(
                  children: childHeaders.map((header) {
                    return TableCellWidget(
                      content: header,
                      isHeader: true,
                      width: header == 'Mês' ? 100 : 150,
                    );
                  }).toList(),
                ),
                //Dados
                ...data.map((row) {
                  return Row(
                    children: [
                      for (var i = 0; i < childHeaders.length; i++)
                        TableCellWidget(
                          content: i == 0 ? row[i] : 'R\$ ${row[i].toString()}',
                          width: i == 0 ? 100 : 150,
                          textColor: row[i] is double && row[i] < 0
                              ? Colors.blue
                              : Colors.black,
                        )
                    ],
                  );
                }),
              ],
            ),
          )),
    );
  }
}
