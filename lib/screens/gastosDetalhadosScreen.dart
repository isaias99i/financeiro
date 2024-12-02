import 'package:financeiro/widgets/DynamicTableWidget.dart';
import 'package:financeiro/widgets/TableCellWidget.dart';
import 'package:flutter/material.dart';

class gastosDetalhados extends StatelessWidget {
  const gastosDetalhados({super.key});


  @override
  Widget build(BuildContext context) {
    // Colunas a exibir na tabela
    final List<String> parentHeaders = [
      'Mês',
      'Data',
      'Método',
      'Descrição',
      'Gasto'
    ];


    return Scaffold(
      appBar: AppBar(
        title: const Text('Gastos Detalhados'),
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

                  return TableCellWidget(
                      content: header, isHeader: true, width: 150);
                }).toList(),
              ),
              //Linha dos dados

              ...SharedData.gastosDetalhados.map((row) {
                return Row(
                  children: [
                    TableCellWidget(
                      content: row.month,
                      width: 150,
                      textColor: Colors.black,
                    ),

                    ...SharedData.gastosDetalhados.first.values.keys
                        .map((header) {
                      final value = row.values[header] ?? '-';
                      return TableCellWidget(
                        content: value is double
                            ? 'R\$ ${value.toStringAsFixed(2)}'
                            : value.toString(),
                        width: 150,
                        textColor: Colors.black,
                      );
                    })
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
