import 'package:bottom_nav_bar_flutter/menus/cart_screen.dart';
import 'package:bottom_nav_bar_flutter/menus/catalog_screen.dart';
import 'package:bottom_nav_bar_flutter/menus/history_screen.dart';
import 'package:bottom_nav_bar_flutter/menus/report_screen.dart';
import 'package:bottom_nav_bar_flutter/menus/setting_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentActiveMenu = 0;

  bool _isCatalogActive = true;

  final List<Widget> _menuPages = [
    CartScreen(),
    HistoryScreen(),
    ReportScreen(),
    SettingScreen(),
  ];

  Widget _buildNavbarItem(int index, IconData icon, String label) {
    final bool isSelected = !_isCatalogActive && _currentActiveMenu == index;
    return InkWell(
      onTap: () {
        setState(() {
          _currentActiveMenu = index;
          _isCatalogActive = false; // Matikan catalog saat menu lain ditekan
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 35,
            color: isSelected ? Colors.orange.shade800 : Colors.grey,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isSelected ? Colors.orange.shade800 : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _isCatalogActive ? 4 : _currentActiveMenu,
        children: [..._menuPages, CatalogScreen()],
      ),

      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _isCatalogActive = true;
            });
          },
          backgroundColor: _isCatalogActive
              ? Colors.orange.shade800
              : Colors.orange,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          child: const Icon(Icons.restaurant_menu, size: 28),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Sisi Kiri FAB (Cart & History)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavbarItem(0, Icons.shopping_cart, 'Cart'),
                    _buildNavbarItem(1, Icons.receipt_long, 'History'),
                  ],
                ),
              ),

              // Memberikan ruang kosong di tengah agar tidak tertutup FAB
              const SizedBox(width: 60),

              // Sisi Kanan FAB (Report & Settings)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavbarItem(2, Icons.bar_chart, 'Report'),
                    _buildNavbarItem(3, Icons.settings, 'Settings'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
