import 'package:flutter/material.dart';
import 'package:bottom_nav_bar_flutter/models/menu_item.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final List<MenuItem> _listMenuItems = [
    MenuItem(
      id_item: 'f001',
      name_item: 'French Fries',
      category_item: 'Food',
      image_url_item: 'image_url_item',
      price_item: 10000,
    ),
    MenuItem(
      id_item: 'f002',
      name_item: 'Crispy Smashed Chicken',
      category_item: 'Food',
      image_url_item: 'image_url_item',
      price_item: 22000,
    ),
    MenuItem(
      id_item: 'f003',
      name_item: 'Special Fried Rice',
      category_item: 'Food',
      image_url_item: 'image_url_item',
      price_item: 25000,
    ),
    MenuItem(
      id_item: 'b001',
      name_item: 'Iced Matcha Latte',
      category_item: 'Baverage',
      image_url_item: 'image_url_item',
      price_item: 10000,
    ),
    MenuItem(
      id_item: 'b002',
      name_item: 'Brown Sugar Coffee Latte',
      category_item: 'Baverage',
      image_url_item: 'image_url_item',
      price_item: 18000,
    ),
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
        itemCount: _listMenuItems.length,
        itemBuilder: (context, index) {
          final item = _listMenuItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: item.category_item == 'Food'
                    ? Colors.orange
                    : Colors.blue,
                child: Icon(
                  item.category_item == 'Food'
                      ? Icons.fastfood
                      : Icons.local_cafe,
                  color: Colors.white,
                ),
              ),
              title: Text(
                item.name_item,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Rp ${item.price_item}'),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${item.name_item} added to cart')),
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
