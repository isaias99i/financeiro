import 'package:flutter/material.dart';
import 'package:financeiro/widgets/TableCellWidget.dart';

class DespesasScreen extends StatelessWidget {
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

    final List<String> childHeaders = [
      'Mês',
      'Contribuição (Casa)',
      'JS Fibra 12/Mês',
      'FIES 15/Mês',
      'Aluguel de Casa',
      'Consórcio Moto',
      'Plano Corte de Cabelo',
      'Recarga Celular + C6 Bônus 23/10',
      'Academia',
      'Aula Inglês',
      'Ajuda Mãe JSFibra',
      'Cartão de Crédito 7 e 10/Mês',
      'Empréstimos',
      'Gastos Detalhados',
      'Total',
      'Gastos Prox 6 Meses nv 2',
      'Gastos Prox 12 Meses Nv 2',
      'Obrigações',
    ];

    final List<List<dynamic>> data = [
      [
        'nov/2024',
        -33.21,
        -109.9,
        -218.16,
        0.0,
        0.0,
        -60.0,
        80.0,
        -6625.25,
        2324.54,
        -405.85,
        -5047.83,
        -18475.55,
        -36420.18,
        -7013.31,
        -10000.0,
        -20000.0,
        -30000.0
      ],
      [
        'dez/2024',
        -670.0,
        -109.9,
        -218.16,
        0.0,
        0.0,
        -60.0,
        -29.99,
        80.0,
        -3402.61,
        0.0,
        -2410.08,
        -6820.74,
        -22649.27,
        -33736.37,
        -3790.67,
        -15000.0,
        -25000.0
      ],
      [
        'jan/2025',
        -670.0,
        -109.9,
        -218.16,
        0.0,
        0.0,
        -60.0,
        -29.99,
        80.0,
        -3025.92,
        0.0,
        0.0,
        -4033.97,
        -19682.15,
        -30769.25,
        -3413.98,
        -20000.0,
        -30000.0
      ],
      [
        'fev/2025',
        -670.0,
        -109.9,
        -218.16,
        0.0,
        0.0,
        -60.0,
        -29.99,
        80.0,
        -2817.6,
        0.0,
        0.0,
        -3825.65,
        -16923.35,
        -28010.45,
        -3205.66,
        -25000.0,
        -35000.0
      ],
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Linha das colunas-mãe
              Row(
                children: parentHeaders.asMap().entries.map((entry) {
                  final index = entry.key;
                  final header = entry.value;
                  return Container(
                    width: parentSpans[index] * 150,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(
                      header,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }).toList(),
              ),
              // Linha das subcolunas
              Row(
                children: childHeaders.map((header) {
                  return TableCellWidget(
                    content: header,
                    isHeader: true,
                    width: header == 'Mês' ? 100 : 150,
                  );
                }).toList(),
              ),
              // Dados
              ...data.map((row) {
                return Row(
                  children: [
                    for (var i = 0; i < childHeaders.length; i++)
                      TableCellWidget(
                        content: i == 0
                            ? row[i] // Primeiro item (Mês)
                            : 'R\$ ${row[i].toStringAsFixed(2)}',
                        width: i == 0 ? 100 : 150,
                        textColor: row[i] is double && row[i] < 0
                            ? Colors.red
                            : Colors.black,
                      ),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}