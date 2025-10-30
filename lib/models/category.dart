import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final Color color;
  final IconData icon;

  const Category({
    required this.id,
    required this.name,
    required this.color,
    required this.icon,
  });

  // Categorias pré-definidas
  static const List<Category> predefinedCategories = [
    Category(
      id: 'work',
      name: 'Trabalho',
      color: Colors.blue,
      icon: Icons.work,
    ),
    Category(
      id: 'personal',
      name: 'Pessoal',
      color: Colors.green,
      icon: Icons.person,
    ),
    Category(
      id: 'shopping',
      name: 'Compras',
      color: Colors.orange,
      icon: Icons.shopping_cart,
    ),
    Category(
      id: 'health',
      name: 'Saúde',
      color: Colors.red,
      icon: Icons.favorite,
    ),
    Category(
      id: 'study',
      name: 'Estudos',
      color: Colors.purple,
      icon: Icons.school,
    ),
    Category(
      id: 'finance',
      name: 'Finanças',
      color: Colors.teal,
      icon: Icons.attach_money,
    ),
    Category(
      id: 'home',
      name: 'Casa',
      color: Colors.brown,
      icon: Icons.home,
    ),
    Category(
      id: 'other',
      name: 'Outros',
      color: Colors.grey,
      icon: Icons.category,
    ),
  ];

  static Category? findById(String id) {
    try {
      return predefinedCategories.firstWhere((cat) => cat.id == id);
    } catch (e) {
      return null;
    }
  }

  static Category get defaultCategory => predefinedCategories[0];
}
