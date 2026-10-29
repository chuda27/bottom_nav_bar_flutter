import 'dart:convert';

class MenuItem {
  String id_item;
  String name_item;
  String category_item;
  String image_url_item;
  double price_item;
  MenuItem({
    required this.id_item,
    required this.name_item,
    required this.category_item,
    required this.image_url_item,
    required this.price_item,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_item': id_item,
      'name_item': name_item,
      'category_item': category_item,
      'image_url_item': image_url_item,
      'price_item': price_item,
    };
  }

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      id_item: map['id_item'] ?? '',
      name_item: map['name_item'] ?? '',
      category_item: map['category_item'] ?? '',
      image_url_item: map['image_url_item'] ?? '',
      price_item: map['price_item']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuItem.fromJson(String source) =>
      MenuItem.fromMap(json.decode(source));
}
