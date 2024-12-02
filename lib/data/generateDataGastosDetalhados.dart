import 'dart:convert';
import 'dart:ffi';

import 'package:financeiro/widgets/DynamicTableWidget.dart';
import 'package:intl/intl.dart';

List<DynamicRow> generateDataGastosDetalhados() {
  final now = DateTime.now();
  const endYear = 2026;
  final List<DynamicRow> rows = [];

  final monthFormatter = DateFormat("MMM/yyyy", "pt_BR");

  String data = '04/12/2024';
  String metodo = 'Inter';
  String descricao = 'Compra Pizza';
  double valor = 41.0;

  for (int year = now.year; year <= endYear; year++) {
    for (int month = (year == now.year ? now.month : 1); month <= 12; month++) {
      final date = DateTime(year, month);

      rows.add(DynamicRow(
        month: monthFormatter.format(date).replaceAll('.', ''),
        values: DynamicValue.list([
          {
            'Data': data,
            'Método': metodo,
            'Descrição': descricao,
            'Valor': valor
          },
          {
            'Data': '05/12/2024',
            'Método': metodo,
            'Descrição': descricao,
            'Valor': valor
          },
          {
            'Data': '06/12/2024',
            'Método': metodo,
            'Descrição': descricao,
            'Valor': valor
          },
        ]),
      ));
    }
  }
  return rows;
}
