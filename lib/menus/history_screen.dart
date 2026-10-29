import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction History')),
      body: ListView.separated(
        padding: const EdgeInsets.only(bottom: 100),
        itemCount: 3,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.check_circle, color: Colors.green),
            title: Text('Receipt #000${index + 1} - Success'),
            subtitle: const Text('29 Oct 2026 • Cash'),
            trailing: const Text(
              'Rp 43.000',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}
