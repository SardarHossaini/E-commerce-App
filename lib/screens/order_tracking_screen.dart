import 'package:e_commerce_app/screens/navigation_screen.dart';
import 'package:e_commerce_app/widgets/container_button_model.dart';
import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  static const Color _primaryColor = Color(0xFFDB3022);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text('Track Order'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _statusCard(),
              const SizedBox(height: 14),
              _trackingCard(),
              const SizedBox(height: 14),
              _deliveryInfoCard(),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const NavigationScreen()),
                    (route) => false,
                  );
                },
                child: ContainerButtonModel(
                  itext: 'Back to Home',
                  containerWidth: size.width,
                  bgColor: _primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusCard() {
    return Container(
      width: double.infinity,
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order #EC-548963',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 6),
          Text(
            'Estimated delivery: 2 - 4 business days',
            style: TextStyle(color: Colors.black54),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.local_shipping_outlined, color: _primaryColor),
              SizedBox(width: 8),
              Text(
                'In Transit',
                style: TextStyle(
                  color: _primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _trackingCard() {
    return Container(
      width: double.infinity,
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
          const Text(
            'Tracking Timeline',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 14),
          _trackingStep(
            title: 'Order Confirmed',
            subtitle: 'Your order was successfully confirmed',
            time: 'Today, 09:40 AM',
            isDone: true,
          ),
          _trackingStep(
            title: 'Packed',
            subtitle: 'Your package has been packed and ready to dispatch',
            time: 'Today, 11:10 AM',
            isDone: true,
          ),
          _trackingStep(
            title: 'Out for Delivery',
            subtitle: 'Courier is on the way to your address',
            time: 'Expected Tomorrow',
            isDone: false,
          ),
          _trackingStep(
            title: 'Delivered',
            subtitle: 'Package delivered to your doorstep',
            time: 'Pending',
            isDone: false,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _deliveryInfoCard() {
    return Container(
      width: double.infinity,
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Details',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on_outlined, color: _primaryColor),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  '3 Kabul, Dasht-e-barchi, Kabul, 1016, Afghanistan',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.call_outlined, color: _primaryColor),
              SizedBox(width: 8),
              Text('+93 700 000 000', style: TextStyle(color: Colors.black87)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _trackingStep({
    required String title,
    required String subtitle,
    required String time,
    required bool isDone,
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 26,
          child: Column(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDone ? _primaryColor : const Color(0xFFE5E7EB),
                ),
                child: isDone
                    ? const Icon(Icons.check, size: 12, color: Colors.white)
                    : null,
              ),
              if (!isLast)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  width: 2,
                  height: 48,
                  color: isDone ? _primaryColor.withOpacity(0.35) : const Color(0xFFE5E7EB),
                ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 12.5)),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    color: isDone ? _primaryColor : Colors.black45,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}