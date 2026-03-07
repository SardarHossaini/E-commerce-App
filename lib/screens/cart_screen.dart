import 'package:e_commerce_app/screens/payment_method_screen.dart';
import 'package:e_commerce_app/widgets/app_drawer.dart';
import 'package:e_commerce_app/widgets/container_button_model.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
    this.currentIndex = 1,
    this.onDrawerItemSelected = _defaultOnDrawerItemSelected,
  });

  static void _defaultOnDrawerItemSelected(int _) {}

  final int currentIndex;
  final ValueChanged<int> onDrawerItemSelected;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  static const Color _primaryColor = Color(0xFFDB3022);

  final List<_CartItem> _items = [
    _CartItem(
      title: 'Nike Air Max 270',
      subtitle: 'Size 42 • White/Red',
      imagePath: 'assets/images/image1.jpg',
      unitPrice: 150,
      quantity: 1,
      isSelected: true,
    ),
    _CartItem(
      title: 'Adidas Ultraboost',
      subtitle: 'Size 41 • Black',
      imagePath: 'assets/images/image2.jpg',
      unitPrice: 180,
      quantity: 1,
      isSelected: true,
    ),
    _CartItem(
      title: 'Puma RS-X',
      subtitle: 'Size 40 • Grey',
      imagePath: 'assets/images/image3.jpg',
      unitPrice: 120,
      quantity: 2,
      isSelected: false,
    ),
  ];

  bool _allSelected() => _items.every((item) => item.isSelected);

  double get _subTotal => _items
      .where((item) => item.isSelected)
      .fold(0, (sum, item) => sum + (item.unitPrice * item.quantity));

  double get _shipping => _subTotal == 0 ? 0 : 12;

  double get _discount => _subTotal > 250 ? 20 : 0;

  double get _total => _subTotal + _shipping - _discount;

  void _changeQty(int index, int delta) {
    setState(() {
      final next = _items[index].quantity + delta;
      _items[index].quantity = next < 1 ? 1 : next;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavOffset = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      drawer: AppDrawer(
        currentIndex: widget.currentIndex,
        onItemSelected: widget.onDrawerItemSelected,
      ),
      appBar: AppBar(
        title: const Text('My Cart'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu_rounded),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))],
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _allSelected(),
                        activeColor: _primaryColor,
                        onChanged: (value) {
                          final checked = value ?? false;
                          setState(() {
                            for (final item in _items) {
                              item.isSelected = checked;
                            }
                          });
                        },
                      ),
                      const Expanded(
                        child: Text(
                          'Select all items',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text('${_items.length} items', style: const TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                ...List.generate(_items.length, (index) {
                  final item = _items[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: item.isSelected,
                          activeColor: _primaryColor,
                          onChanged: (value) {
                            setState(() => item.isSelected = value ?? false);
                          },
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            item.imagePath,
                            height: 86,
                            width: 86,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                item.subtitle,
                                style: const TextStyle(color: Colors.black54, fontSize: 12),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '\$${item.unitPrice.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  color: _primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            _qtyButton(icon: Icons.remove, onTap: () => _changeQty(index, -1)),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                '${item.quantity}',
                                style: const TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                            _qtyButton(icon: Icons.add, onTap: () => _changeQty(index, 1)),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.local_offer_outlined, color: _primaryColor),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Promo code applied: SAVE20',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      TextButton(onPressed: () {}, child: const Text('Change')),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: bottomNavOffset),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              children: [
                _summaryRow('Subtotal', _subTotal),
                const SizedBox(height: 8),
                _summaryRow('Shipping', _shipping),
                const SizedBox(height: 8),
                _summaryRow('Discount', -_discount),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(height: 1),
                ),
                _summaryRow('Total Payment', _total, isTotal: true),
                const SizedBox(height: 14),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentMethodScreen()),
                    );
                  },
                  child: ContainerButtonModel(
                    itext: 'Proceed to Checkout',
                    containerWidth: MediaQuery.of(context).size.width,
                    bgColor: _primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, double value, {bool isTotal = false}) {
    final amount = value < 0
        ? '-\$${value.abs().toStringAsFixed(0)}'
        : '\$${value.toStringAsFixed(0)}';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 17 : 14,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
            color: isTotal ? Colors.black : Colors.black87,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            color: isTotal ? _primaryColor : Colors.black87,
            fontWeight: FontWeight.w700,
            fontSize: isTotal ? 20 : 14,
          ),
        ),
      ],
    );
  }

  Widget _qtyButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: const Color(0xFFF7F8FA),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16, color: Colors.black87),
      ),
    );
  }
}

class _CartItem {
  _CartItem({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.unitPrice,
    required this.quantity,
    required this.isSelected,
  });

  final String title;
  final String subtitle;
  final String imagePath;
  final double unitPrice;
  int quantity;
  bool isSelected;
}
