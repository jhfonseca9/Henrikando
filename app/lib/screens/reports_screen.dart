import 'package:flutter/material.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  String _selectedPeriod = 'mes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatórios'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Período
            const Text(
              'Período',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _PeriodButton(
                    label: 'Mês',
                    isSelected: _selectedPeriod == 'mes',
                    onTap: () => setState(() => _selectedPeriod = 'mes'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _PeriodButton(
                    label: 'Trimestre',
                    isSelected: _selectedPeriod == 'trimestre',
                    onTap: () => setState(() => _selectedPeriod = 'trimestre'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _PeriodButton(
                    label: 'Ano',
                    isSelected: _selectedPeriod == 'ano',
                    onTap: () => setState(() => _selectedPeriod = 'ano'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Resumo
            const Text(
              'Resumo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _ResumoCard(
                    titulo: 'Entradas',
                    valor: 'R\$ 15.000,00',
                    cor: Colors.green,
                    icone: Icons.arrow_downward,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ResumoCard(
                    titulo: 'Saídas',
                    valor: 'R\$ 8.500,00',
                    cor: Colors.red,
                    icone: Icons.arrow_upward,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Saldo',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'R\$ 6.500,00',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Gastos por Categoria
            const Text(
              'Gastos por Categoria',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _CategoriaItem(
              categoria: 'Alimentação',
              valor: 'R\$ 2.500,00',
              percentual: 29.4,
              cor: Colors.orange,
            ),
            _CategoriaItem(
              categoria: 'Transporte',
              valor: 'R\$ 1.800,00',
              percentual: 21.2,
              cor: Colors.blue,
            ),
            _CategoriaItem(
              categoria: 'Moradia',
              valor: 'R\$ 2.000,00',
              percentual: 23.5,
              cor: Colors.red,
            ),
            _CategoriaItem(
              categoria: 'Saúde',
              valor: 'R\$ 1.200,00',
              percentual: 14.1,
              cor: Colors.pink,
            ),
            _CategoriaItem(
              categoria: 'Outros',
              valor: 'R\$ 1.000,00',
              percentual: 11.8,
              cor: Colors.grey,
            ),
            const SizedBox(height: 24),

            // Ação
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download),
                label: const Text('Exportar Relatório'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PeriodButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PeriodButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class _ResumoCard extends StatelessWidget {
  final String titulo;
  final String valor;
  final Color cor;
  final IconData icone;

  const _ResumoCard({
    required this.titulo,
    required this.valor,
    required this.cor,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titulo,
                style: TextStyle(color: cor, fontWeight: FontWeight.bold),
              ),
              Icon(icone, color: cor),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            valor,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: cor,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoriaItem extends StatelessWidget {
  final String categoria;
  final String valor;
  final double percentual;
  final Color cor;

  const _CategoriaItem({
    required this.categoria,
    required this.valor,
    required this.percentual,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: cor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      categoria,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      valor,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: percentual / 100,
                    minHeight: 4,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation(cor),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${percentual.toStringAsFixed(1)}%',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
