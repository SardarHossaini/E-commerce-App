import 'package:e_commerce_app/screens/shipping_address_screen.dart';
import 'package:e_commerce_app/widgets/container_button_model.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  static const Color _primaryColor = Color(0xFFDB3022);

  int _type = 1;

  final List<_PaymentOption> _paymentOptions = const [
    _PaymentOption(
      id: 1,
      title: 'Amazon Pay',
      subtitle: 'Pay using your Amazon account',
      icon: Icons.shopping_bag_outlined,
    ),
    _PaymentOption(
      id: 2,
      title: 'Credit Card',
      subtitle: 'Visa, MasterCard, Amex supported',
      icon: Icons.credit_card,
    ),
    _PaymentOption(
      id: 3,
      title: 'PayPal',
      subtitle: 'Secure checkout with PayPal',
      icon: Icons.account_balance_wallet_outlined,
    ),
    _PaymentOption(
      id: 4,
      title: 'Google Pay',
      subtitle: 'Fast payment with Google Pay',
      icon: Icons.payments_outlined,
    ),
  ];

  void handleRadio(Object? e) {
    setState(() {
      _type = e as int;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text('Payment Method'),
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
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(16),
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
                      const Text(
                        'Choose Payment Option',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Select one method to continue checkout',
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(height: 14),
                      ..._paymentOptions.map(_paymentOptionTile),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(16),
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
                    children: [
                      _summaryRow('Sub-Total', '\$300.00'),
                      const SizedBox(height: 12),
                      _summaryRow('Shipping Fee', '\$15.00'),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
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
                      MaterialPageRoute(builder: (context) => const ShippingAddressScreen()),
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

  Widget _paymentOptionTile(_PaymentOption option) {
    final isSelected = _type == option.id;

    return GestureDetector(
      onTap: () => handleRadio(option.id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? _primaryColor.withOpacity(0.07) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? _primaryColor : const Color(0xFFE5E7EB),
            width: isSelected ? 1.3 : 1,
          ),
        ),
        child: Row(
          children: [
            Radio<int>(
              value: option.id,
              groupValue: _type,
              onChanged: handleRadio,
              activeColor: _primaryColor,
            ),
            CircleAvatar(
              radius: 18,
              backgroundColor: isSelected
                  ? _primaryColor.withOpacity(0.15)
                  : const Color(0xFFF3F4F6),
              child: Icon(
                option.icon,
                color: isSelected ? _primaryColor : Colors.black54,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? Colors.black : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    option.subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: isSelected ? _primaryColor : Colors.black38),
          ],
        ),
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

class _PaymentOption {
  const _PaymentOption({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final int id;
  final String title;
  final String subtitle;
  final IconData icon;
}
