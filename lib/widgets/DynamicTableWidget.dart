import 'package:financeiro/data/generateDataDespesasUntil2040.dart';
import 'package:financeiro/data/generateDataGastosDetalhados.dart';
import 'package:financeiro/data/generateDataReceitasUntil2040.dart';
import 'package:flutter/material.dart';

class DynamicTableWidget extends StatelessWidget {
  final List<DynamicRow> data;
  final List<String> columns; // Nomes das colunas a exibir

  const DynamicTableWidget({super.key, required this.data, required this.columns});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          const DataColumn(label: Text('Mês')),
          ...columns.map((col) => DataColumn(label: Text(col))),
        ],
        rows: data.map((row) {
          return DataRow(
            cells: [
              DataCell(Text(row.month)),
              ...columns.map((col) {
                final value = row.values[col] ?? '-'; // Valor padrão se não existir
                return DataCell(Text(value.toString()));
              }),
            ],
          );
        }).toList(),

      ),
    );
  }
}


class DynamicRow {
  final String month;
  final DynamicValue values; // Chave = Nome da coluna, Valor = Dados (dinâmico)

  DynamicRow({required this.month, required this.values});
}

class DynamicValue {
  final Map<String, dynamic>? singleMap;
  final List<Map<String, dynamic>>? listOfMaps;

  DynamicValue.single(this.singleMap) : listOfMaps = null;
  DynamicValue.list(this.listOfMaps) : singleMap = null;

  bool get isSingle => singleMap != null;
  bool get isList => listOfMaps != null;

  // Melhorando a lógica de keys para permitir o acesso tanto para singleMap quanto para listOfMaps
  Iterable<String> get keys {
    if (isSingle) {
      return singleMap!.keys;
    } else if (isList && listOfMaps!.isNotEmpty) {
      // Se for uma lista de mapas, podemos pegar as chaves do primeiro mapa
      return listOfMaps!.first.keys;
    } else {
      throw Exception("Cannot access 'keys' on an empty list of maps or null data.");
    }
  }

  // Melhorando o operador [] para lidar com ambos os casos (singleMap ou listOfMaps)
  dynamic operator [](String key) {
    if (isSingle) {
      return singleMap![key];
    } else if (isList && listOfMaps!.isNotEmpty) {
      // Quando for uma lista de mapas, podemos acessar diretamente o primeiro mapa
      return listOfMaps!.first[key];
    } else {
      throw Exception("Cannot use '[]' with an empty list of maps or null data.");
    }
  }

  // Método que permite acessar valores de cada mapa na lista (se for uma lista)
  dynamic getValueFromList(int index, String key) {
    if (isList && listOfMaps != null && index >= 0 && index < listOfMaps!.length) {
      return listOfMaps![index][key];
    } else {
      throw Exception("Invalid index or data structure.");
    }
  }
}



class SharedData {
  static final List<DynamicRow> receitas = generateDataReceitasUntil2040();

  static final List<DynamicRow> despesas = generateDataDespesasUntil2040();

  static final List<DynamicRow> gastosDetalhados = generateDataGastosDetalhados();
}
