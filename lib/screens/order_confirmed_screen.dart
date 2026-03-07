import 'package:e_commerce_app/screens/order_success_screen.dart';
import 'package:e_commerce_app/screens/payment_method_screen.dart';
import 'package:e_commerce_app/screens/shipping_address_screen.dart';
import 'package:e_commerce_app/widgets/container_button_model.dart';
import 'package:flutter/material.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({super.key});

  static const Color _primaryColor = Color(0xFFDB3022);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text('Confirm Order'),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionCard(
                  title: 'Shipping Address',
                  subtitle: 'Where should we deliver your order?',
                  actionLabel: 'Change',
                  onActionTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ShippingAddressScreen()),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: _primaryColor.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.location_on_outlined, color: _primaryColor),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dear Pro',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '3 Kabul, Dasht-e-barchi',
                              style: TextStyle(color: Colors.black87),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Kabul, 1016, Dasht-e-barchi, Afghanistan',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                _sectionCard(
                  title: 'Payment Method',
                  subtitle: 'Choose how you want to pay',
                  actionLabel: 'Change',
                  onActionTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PaymentMethodScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 52,
                        width: 78,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                        ),
                        child: Image.asset('assets/images/icon2.png'),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Visa Classic',
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                            SizedBox(height: 4),
                            Text('**** **** **** 3452', style: TextStyle(color: Colors.black54)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: _primaryColor.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'Default',
                          style: TextStyle(
                            color: _primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                _sectionCard(
                  title: 'Delivery Method',
                  subtitle: 'Fastest option selected for this order',
                  child: Row(
                    children: [
                      Expanded(
                        child: _deliveryOption(
                          title: 'Standard',
                          timing: '2-7 Days',
                          iconPath: 'assets/images/icon3.png',
                          isActive: true,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _deliveryOption(
                          title: 'Home Delivery',
                          timing: '2-4 Days',
                          icon: Icons.local_shipping_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                _sectionCard(
                  title: 'Order Summary',
                  subtitle: 'Review payment details before checkout',
                  child: Column(
                    children: [
                      _summaryRow('Sub-Total', '\$300.00'),
                      const SizedBox(height: 12),
                      _summaryRow('Shipping Fee', '\$15.00'),
                      const SizedBox(height: 12),
                      _summaryRow('Discount', '-\$0.00'),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Divider(height: 1),
                      ),
                      _summaryRow('Total Payment', '\$315.00', isTotal: true),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OrderSuccessScreen()),
                    );
                  },
                  child: ContainerButtonModel(
                    itext: 'Confirm Payment',
                    containerWidth: size.width,
                    bgColor: _primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionCard({
    required String title,
    required String subtitle,
    required Widget child,
    String? actionLabel,
    VoidCallback? onActionTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              if (actionLabel != null)
                TextButton(
                  onPressed: onActionTap,
                  style: TextButton.styleFrom(
                    foregroundColor: _primaryColor,
                    textStyle: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  child: Text(actionLabel),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 12)),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _deliveryOption({
    required String title,
    required String timing,
    String? iconPath,
    IconData? icon,
    bool isActive = false,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isActive ? _primaryColor.withOpacity(0.07) : const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isActive ? _primaryColor : const Color(0xFFE5E7EB),
          width: isActive ? 1.3 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (iconPath != null) Image.asset(iconPath, height: 20),
          if (iconPath == null && icon != null)
            Icon(icon, color: isActive ? _primaryColor : Colors.black54),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: isActive ? _primaryColor : Colors.black87,
            ),
          ),
          const SizedBox(height: 2),
          Text(timing, style: const TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
            color: isTotal ? Colors.black : Colors.black87,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            fontWeight: FontWeight.w700,
            color: isTotal ? _primaryColor : Colors.black87,
          ),
        ),
      ],
    );
  }
}
