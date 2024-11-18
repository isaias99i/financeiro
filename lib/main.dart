import 'package:flutter/material.dart';

void main() {
  runApp(FinanceApp());
}

class FinanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerenciador de Finanças',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardScreen(),
    );
  }
}

// Tela do Dashboard (Resumo Financeiro)
class DashboardScreen extends StatelessWidget {
  final double receitas = 5000.00; // Exemplo de receita
  final double despesas = -1066.86; // Exemplo de despesa (negativo)

  @override
  Widget build(BuildContext context) {
    // Calcula o saldo mensal
    final double saldoMensal = receitas + despesas;
    final double saldoAtual = 2500;
    final double segurancaAno = (despesas * 12) - saldoAtual;
    final double percentAtual = saldoAtual/segurancaAno;
    final double SaldoAposReserva = (saldoAtual < (segurancaAno * -1)) ? saldoAtual : saldoAtual +segurancaAno;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resumo Financeiro',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Card para receitas
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
            SizedBox(height: 8),
            // Card para despesas
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
            SizedBox(height: 8),
            // Card para saldo mensal
            FinanceCard(
              title: 'Saldo Mensal',
              value: 'R\$ ${saldoMensal.toStringAsFixed(2)}',
              color: saldoMensal >= 0 ? Colors.blue : Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SaldoMensalScreen()),
                );
              },
            ),
            FinanceCard(
              title: 'Segurança Ano',
              value: 'R\$ ${segurancaAno.toStringAsFixed(2)}',
              color: segurancaAno >= 0 ? Colors.blue : Colors.red,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SaldoMensalScreen()),
                );
              },
            ),
            FinanceCard(
              title: '% atual',
              value: ' ${(percentAtual*100).toStringAsFixed(2)} %',
              color: percentAtual >= 0 ? Colors.blue : Colors.red,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SaldoMensalScreen()),
                );
              },
            ),
            FinanceCard(
              title: 'Saldo Atual',
              value: 'R\$ ${saldoAtual.toStringAsFixed(2)}',
              color: saldoAtual >= 0 ? Colors.blue : Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SaldoMensalScreen()),
                );
              },
            ),
            FinanceCard(
              title: 'Saldo Após Reserva',
              value: 'R\$ ${SaldoAposReserva.toStringAsFixed(2)}',
              color: SaldoAposReserva >= 0 ? Colors.blue : Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SaldoMensalScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Widget reutilizável para exibir os dados financeiros
class FinanceCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final VoidCallback onTap;

  const FinanceCard({
    required this.title,
    required this.value,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Tela de Receitas
class ReceitasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas'),
      ),
      body: Center(
        child: Text('Tela de Receitas em construção'),
      ),
    );
  }
}

// Tela de Despesas
class DespesasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas'),
      ),
      body: Center(
        child: Text('Tela de Despesas em construção'),
      ),
    );
  }
}

// Tela de Saldo Mensal
class SaldoMensalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saldo Mensal'),
      ),
      body: Center(
        child: Text('Tela de Saldo Mensal em construção'),
      ),
    );
  }
}
