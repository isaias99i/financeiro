import 'package:flutter/material.dart';
import 'package:financeiro/widgets/Cards.dart';
import 'receitasScreen.dart';
import 'despesasScreen.dart';

class DashboardScreen extends StatelessWidget {
  final double receitas = 2510.00; // Exemplo de receita
  final double despesas = -1066.86; // Exemplo de despesa (negativo)
  final double reserva = 1000.00; // Valor fixo da reserva anual para cálculo

  @override
  Widget build(BuildContext context) {
    final double saldoMensal = receitas + despesas; // Cálculo do saldo mensal
    final double saldoAposReserva = saldoMensal - reserva; // Cálculo do saldo após reserva

    // Lista inicial de bancos na carteira
    final List<String> bancos = ['Banco Inter', 'Santander', 'Itaú', 'Físico'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resumo Financeiro',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Organizar os elementos lado a lado
            Wrap(
              spacing: 16, // Espaçamento horizontal entre os itens
              runSpacing: 16, // Espaçamento vertical entre as linhas
              children: [
                FinanceCard(
                  title: 'Receitas',
                  value: 'R\$ ${receitas.toStringAsFixed(2)}',
                  color: Colors.green,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReceitasScreen()),
                    );
                  },
                ),
                FinanceCard(
                  title: 'Despesas',
                  value: 'R\$ ${despesas.toStringAsFixed(2)}',
                  color: Colors.red,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DespesasScreen()),
                    );
                  },
                ),
                FinanceCard(
                  title: 'Saldo Mensal',
                  value: 'R\$ ${saldoMensal.toStringAsFixed(2)}',
                  color: saldoMensal >= 0 ? Colors.blue : Colors.orange,
                  onTap: () {},
                ),
                FinanceCard(
                  title: 'Segurança Ano',
                  value: 'R\$ ${despesas*12}', // Exemplo fixo
                  color: Colors.purple,
                  onTap: () {},
                ),
                FinanceCard(
                  title: '% Completo',
                  value: '65%', // Exemplo de progresso
                  color: Colors.indigo,
                  onTap: () {},
                ),
                FinanceCard(
                  title: 'Atual',
                  value: 'R\$ 5.000,00', // Exemplo fixo
                  color: Colors.teal,
                  onTap: () {},
                ),
                FinanceCard(
                  title: 'Saldo após Reserva',
                  value: 'R\$ ${saldoAposReserva.toStringAsFixed(2)}',
                  color: saldoAposReserva >= 0 ? Colors.green : Colors.red,
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Carteira',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Lista de Bancos
            Column(
              children: bancos.map((banco) {
                return Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text(banco),
                    leading: Icon(Icons.account_balance_wallet),
                    onTap: () {
                      // Implementar ações específicas para cada banco aqui
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}