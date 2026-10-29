import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isPrinterConnected = true;
  bool _isTaxEnabled = true;

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0, top: 16.0),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade600, // WARNA TEKS DIMASUKKAN DI SINI
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  // Helper Widget untuk Membungkus Kelompok List Tile dengan Card Putih Bersih
  Widget _buildSettingCard(List<Widget> children) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      color: Colors.white,
      child: Column(children: children),
    );
  }

  // Helper Widget untuk Item List Menu Standar
  Widget _buildListTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withAlpha(25),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 13)),
      trailing: Icon(
        Icons.chevron_right,
        color: Colors.grey.shade400,
        size: 20,
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'POS Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 12, bottom: 100),
        children: [
          // PROFIL KASIR AKTIF
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.orange.shade100,
                  child: Icon(
                    Icons.person,
                    size: 36,
                    color: Colors.orange.shade800,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Budi Santoso',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Role: Head Cashier',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Chip(
                  label: const Text(
                    'Active Shift',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  side: BorderSide.none,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // KATEGORI 1: OPERASIONAL TOKO
          _buildSectionTitle('Store Operations'),
          _buildSettingCard([
            _buildListTile(
              icon: Icons.edit_note,
              iconColor: Colors.blue,
              title: 'Manage Products & Prices',
              subtitle: 'Add, edit, or remove menu items',
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.discount_outlined,
              iconColor: Colors.red,
              title: 'Discounts & Promo codes',
              subtitle: 'Setup active happy hour or loyalty discounts',
              onTap: () {},
            ),
            SwitchListTile(
              secondary: Icon(
                Icons.receipt_outlined,
                color: Colors.purple.shade400,
              ),
              title: const Text(
                'Apply 10% PB1 Tax',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              subtitle: const Text(
                'Automatically calculate tax at checkout',
                style: TextStyle(fontSize: 13),
              ),
              value: _isTaxEnabled,
              activeColor: Colors.orange.shade800,
              onChanged: (bool value) {
                setState(() {
                  _isTaxEnabled = value;
                });
              },
            ),
          ]),

          // KATEGORI 2: PERANGKAT KERAS (HARDWARE)
          _buildSectionTitle('Hardware & Hardware'),
          _buildSettingCard([
            SwitchListTile(
              secondary: Icon(
                _isPrinterConnected ? Icons.print : Icons.print_disabled,
                color: _isPrinterConnected ? Colors.green : Colors.grey,
              ),
              title: const Text(
                'Thermal Receipt Printer',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              subtitle: Text(
                _isPrinterConnected
                    ? 'Connected via Bluetooth (RP-58)'
                    : 'Disconnected',
                style: const TextStyle(fontSize: 13),
              ),
              value: _isPrinterConnected,
              activeColor: Colors.orange.shade800,
              onChanged: (bool value) {
                setState(() {
                  _isPrinterConnected = value;
                });
              },
            ),
            _buildListTile(
              icon: Icons.tablet_android,
              iconColor: Colors.blueGrey,
              title: 'Customer Facing Display (CFD)',
              subtitle: 'Setup second screen for order details',
              onTap: () {},
            ),
          ]),

          // KATEGORI 3: AKUN & KEAMANAN
          _buildSectionTitle('Account & Security'),
          _buildSettingCard([
            _buildListTile(
              icon: Icons.people_outline,
              iconColor: Colors.orange,
              title: 'Employee Access Management',
              subtitle: 'Manage cashier PINs and permissions',
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.history,
              iconColor: Colors.teal,
              title: 'System Activity Logs',
              subtitle: 'Track voids, refunds, and open drawers',
              onTap: () {},
            ),
          ]),

          // TOMBOL UTAMA: KELUAR SHIFT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // Logika Tutup Kasir / End Shift
              },
              icon: const Icon(Icons.logout),
              label: const Text(
                'CLOSE SHIFT & LOGOUT',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
