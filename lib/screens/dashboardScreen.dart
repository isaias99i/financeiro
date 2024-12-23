import 'package:financeiro/widgets/ResumoFinanceiroWidget.dart';
import 'package:flutter/material.dart';
import 'package:financeiro/widgets/CarteiraWidget.dart';

class DashboardScreen extends StatelessWidget {
  final double receitas = 0.00; // Exemplo de receita
  final double despesas = 0.0; // Exemplo de despesa (negativo)
  final double reserva = 0.00;

  const DashboardScreen({super.key}); // Valor fixo da reserva anual para cálculo

  @override
  Widget build(BuildContext context) {
    final double saldoMensal = receitas + despesas; // Cálculo do saldo mensal
    final double saldoAposReserva = saldoMensal - reserva; // Cálculo do saldo após reserva

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResumoFinanceiroWidget(receitas: receitas, despesas: despesas, saldoMensal: saldoMensal, saldoAposReserva: saldoAposReserva,saldoAtual: 0, segurancaAno: despesas * 12,),
            const CarteiraWidget(),
            /*const Text(
              'Carteira',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Lista de Bancos
            Column(
              children: bancos.map((banco) {
                return Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text(banco),
                    leading: const Icon(Icons.account_balance_wallet),
                    onTap: () {
                      // Implementar ações específicas para cada banco aqui
                    },
                  ),
                );
              }).toList(),
            ),*/
          ],
        ),
      ),
    );
  }
}