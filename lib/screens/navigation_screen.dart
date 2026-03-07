import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/screens/favorites_screen.dart';
import 'package:e_commerce_app/screens/home_screen.dart';
import 'package:e_commerce_app/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    CartScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  final List<_NavItem> _navItems = const [
    _NavItem(icon: CupertinoIcons.house_fill, label: 'Home'),
    _NavItem(icon: CupertinoIcons.cart_fill, label: 'Cart'),
    _NavItem(icon: CupertinoIcons.heart_fill, label: 'Favorites'),
    _NavItem(icon: CupertinoIcons.person_fill, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFDB3022);

    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _pageIndex, children: _pages),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 2,
        child: const Icon(Icons.qr_code_scanner_rounded, size: 24),
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 8,
        color: Colors.white,
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 72,
            child: Row(
              children: [
                for (int i = 0; i < _navItems.length; i++) ...[
                  if (i == 2) const Spacer(),
                  Expanded(
                    child: _buildNavButton(
                      item: _navItems[i],
                      isSelected: _pageIndex == i,
                      primaryColor: primaryColor,
                      onTap: () {
                        setState(() {
                          _pageIndex = i;
                        });
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton({
    required _NavItem item,
    required bool isSelected,
    required VoidCallback onTap,
    required Color primaryColor,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
            color: isSelected ? primaryColor.withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 21, color: isSelected ? primaryColor : Colors.black45),
              const SizedBox(height: 4),
              Text(
                item.label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? primaryColor : Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}
