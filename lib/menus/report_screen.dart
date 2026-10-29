import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String _selectedPeriod = 'Today';

  Widget _buildTopProductItem(
    String rank,
    String name,
    String qty,
    String totalSales,
  ) {
    return ListTile(
      leading: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: rank == '1' ? Colors.orange.shade100 : Colors.grey.shade100,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            rank,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: rank == '1'
                  ? Colors.orange.shade800
                  : Colors.grey.shade700,
            ),
          ),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      subtitle: Text(
        qty,
        style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
      ),
      trailing: Text(
        totalSales,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    String? value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: color.withAlpha(30),
              radius: 18,
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
            const SizedBox(height: 2),
            Text(
              value!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Sales Analytics',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // Filter Waktu Laporan
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: DropdownButton<String>(
              value: _selectedPeriod,
              underline: const SizedBox(),
              icon: const Icon(Icons.filter_alt_outlined, color: Colors.orange),
              items: <String>['Today', 'Weekly', 'Monthly'].map(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  );
                },
              ).toList(), // Typo safety check: didalam onChanged ganti variabel state
              onChanged: (newValue) {
                setState(() {
                  _selectedPeriod = newValue!;
                });
              },
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 100,
        ),
        children: [
          // KARTU UTAMA: REVENUE
          Card(
            elevation: 2,
            color: Colors.orange.shade500,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Revenue',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Rp 2.450.000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(50),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.trending_up,
                          color: Colors.greenAccent,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '+12% from yesterday',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // GRID KARTU METRIK KECIL
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  title: 'Total Orders',
                  value: '48 Tx',
                  icon: Icons.shopping_bag_outlined,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildMetricCard(
                  title: 'Avg. Bill',
                  value: 'Rp 51.040',
                  icon: Icons.analytics_outlined,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // SEKSI DENGAN DAFTAR TERLARIS
          const Text(
            'Top Selling Products',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),

          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildTopProductItem(
                  '1',
                  'Brown Sugar Coffee Latte',
                  '42 Items',
                  'Rp 756.000',
                ),
                const Divider(height: 1),
                _buildTopProductItem(
                  '2',
                  'Special Fried Rice',
                  '28 Items',
                  'Rp 700.000',
                ),
                const Divider(height: 1),
                _buildTopProductItem(
                  '3',
                  'Iced Matcha Latte',
                  '20 Items',
                  'Rp 440.000',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
