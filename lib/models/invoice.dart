import 'dart:convert';

import 'package:bottom_nav_bar_flutter/models/menu_item.dart';

class Invoice {
  String id_invoice;
  String customer_name;
  String table_number;
  String datetime_order;
  List<MenuItem> list_item;
  double total_price;
  Invoice({
    required this.id_invoice,
    required this.customer_name,
    required this.table_number,
    required this.datetime_order,
    required this.list_item,
    required this.total_price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_invoice': id_invoice,
      'customer_name': customer_name,
      'table_number': table_number,
      'datetime_order': datetime_order,
      'list_item': list_item.map((x) => x.toMap()).toList(),
      'total_price': total_price,
    };
  }

  factory Invoice.fromMap(Map<String, dynamic> map) {
    return Invoice(
      id_invoice: map['id_invoice'] ?? '',
      customer_name: map['customer_name'] ?? '',
      table_number: map['table_number'] ?? '',
      datetime_order: map['datetime_order'] ?? '',
      list_item: List<MenuItem>.from(
        map['list_item']?.map((x) => MenuItem.fromMap(x)),
      ),
      total_price: map['total_price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Invoice.fromJson(String source) =>
      Invoice.fromMap(json.decode(source));
}
