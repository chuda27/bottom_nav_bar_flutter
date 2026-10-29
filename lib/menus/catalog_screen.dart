import 'package:flutter/material.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final List<Map<String, dynamic>> _dummyItems = [
    {
      'name': 'Brown Sugar Coffee Latte',
      'price': 18000,
      'category': 'Beverage',
    },
    {'name': 'Iced Matcha Latte', 'price': 22000, 'category': 'Beverage'},
    {'name': 'Special Fried Rice', 'price': 25000, 'category': 'Food'},
    {'name': 'Crispy Smashed Chicken', 'price': 20000, 'category': 'Food'},
    {'name': 'French Fries', 'price': 15000, 'category': 'Snack'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Catalog'),
        backgroundColor: Colors.orange.shade100,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(
          bottom: 100,
        ), // Beri padding bawah agar data tidak tertutup FAB besar
        itemCount: _dummyItems.length,
        itemBuilder: (context, index) {
          final item = _dummyItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: item['category'] == 'Food'
                    ? Colors.orange
                    : Colors.blue,
                child: Icon(
                  item['category'] == 'Food'
                      ? Icons.fastfood
                      : Icons.local_cafe,
                  color: Colors.white,
                ),
              ),
              title: Text(
                item['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Rp ${item['price']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${item['name']} added to cart')),
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
          );
        },
      ),
    );
  }
}
