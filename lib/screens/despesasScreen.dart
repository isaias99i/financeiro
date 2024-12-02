import 'package:financeiro/widgets/DynamicTableWidget.dart';
import 'package:flutter/material.dart';
import 'package:financeiro/widgets/TableCellWidget.dart';

class DespesasScreen extends StatelessWidget {
  const DespesasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dados da tabela
    final List<String> parentHeaders = [
      'Mês',
      'Gastos Fixos Não Alteráveis',
      'Gastos Fixos Alteráveis',
      'Gastos Variados',
      'Resultado',
    ];

    final List<int> parentSpans = [
      1, // "Mês" ocupa 1 coluna
      5, // "Gastos Fixos Não Alteráveis" ocupa 5 colunas
      5, // "Gastos Fixos Alteráveis" ocupa 5 colunas
      3, // "Gastos Variados" ocupa 3 colunas
      4, // "Resultado" ocupa 4 colunas
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Linha das colunas principais
              Row(
                children: parentHeaders.asMap().entries.map((entry) {
                  final index = entry.key;
                  final header = entry.value;
                  //Outros cabeçalhos
                  return TableCellWidget(
                    content: header,
                    isHeader: true,
                    width: parentSpans[index] * 150,
                  );
                }).toList(),
              ),
              // Linha das subcolunas
              Row(
                children: [
                  TableCellWidget(
                    content: 'Mês',
                    isHeader: true,
                    width: 150, // Largura fixa para "Mês"
                  ),
                  ...SharedData.despesas.first.values.keys.map((header) {
                    return TableCellWidget(
                      content: header,
                      isHeader: true,
                      width: 150, // Largura para outros subcabeçalhos

                    );
                  }),
                ],
              ),
              // Dados
              ...SharedData.despesas.map(
                (row) {
                  return Row(
                    children: [
                      TableCellWidget(
                        content: row.month,
                        width: 150,
                        textColor: Colors.black,
                      ),
                      ...SharedData.despesas.first.values.keys.map((header) {
                        final value = row.values[header] ?? '-';
                        return TableCellWidget(
                          content: value is double
                              ? 'R\$ ${value.toStringAsFixed(2)}'
                              : value.toString(),
                          width: 150,
                          textColor: Colors.black,
                        );
                      }),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
