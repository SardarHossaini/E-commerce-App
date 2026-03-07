import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.currentIndex, required this.onItemSelected});

  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  static const Color _primaryColor = Color(0xFFDB3022);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFDB3022), Color(0xFFB71C1C)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 28, backgroundImage: AssetImage('assets/images/image6.jpg')),
                  SizedBox(height: 12),
                  Text('Welcome back 👋', style: TextStyle(color: Colors.white70, fontSize: 13)),
                  SizedBox(height: 4),
                  Text(
                    'Sardar Hossaini',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _DrawerTile(
              icon: Icons.home_rounded,
              label: 'Home',
              selected: currentIndex == 0,
              onTap: () {
                Navigator.pop(context);
                onItemSelected(0);
              },
            ),
            _DrawerTile(
              icon: Icons.shopping_cart_rounded,
              label: 'Cart',
              selected: currentIndex == 1,
              onTap: () {
                Navigator.pop(context);
                onItemSelected(1);
              },
            ),
            _DrawerTile(
              icon: Icons.favorite_rounded,
              label: 'Favorites',
              selected: currentIndex == 2,
              onTap: () {
                Navigator.pop(context);
                onItemSelected(2);
              },
            ),
            _DrawerTile(
              icon: Icons.person_rounded,
              label: 'Profile',
              selected: currentIndex == 3,
              onTap: () {
                Navigator.pop(context);
                onItemSelected(3);
              },
            ),
            const Spacer(),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.logout_rounded, color: Colors.black54),
              title: const Text('Logout'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  const _DrawerTile({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: selected ? AppDrawer._primaryColor.withOpacity(0.1) : null,
        leading: Icon(icon, color: selected ? AppDrawer._primaryColor : Colors.black54),
        title: Text(
          label,
          style: TextStyle(
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            color: selected ? AppDrawer._primaryColor : Colors.black87,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
