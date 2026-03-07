import 'package:flutter/material.dart';
import 'package:e_commerce_app/widgets/app_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    this.currentIndex = 3,
    this.onDrawerItemSelected = _defaultOnDrawerItemSelected,
  });

  static void _defaultOnDrawerItemSelected(int _) {}

  final int currentIndex;
  final ValueChanged<int> onDrawerItemSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(currentIndex: currentIndex, onItemSelected: onDrawerItemSelected),
      appBar: AppBar(
        title: const Text('Profile Screen'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu_rounded),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: const Center(child: Text('Profile Screen')),
      ),
    );
  }
}
