import 'package:e_commerce_app/screens/order_confirmed_screen.dart';
import 'package:e_commerce_app/widgets/container_button_model.dart';
import 'package:flutter/material.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  static const Color _primaryColor = Color(0xFFDB3022);

  int _selectedAddressType = 0;
  bool _isDefaultAddress = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text('Shipping Address'),
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
                  title: 'Contact Info',
                  subtitle: 'Who should receive this order?',
                  child: Column(
                    children: const [
                      _AddressInputField(
                        label: 'Full Name',
                        hint: 'John Doe',
                        icon: Icons.person_outline,
                      ),
                      SizedBox(height: 12),
                      _AddressInputField(
                        label: 'Mobile Number',
                        hint: '+1 555 000 1122',
                        icon: Icons.call_outlined,
                        keyboardType: TextInputType.phone,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                _sectionCard(
                  title: 'Address Details',
                  subtitle: 'Where should we deliver?',
                  child: Column(
                    children: [
                      const _AddressInputField(
                        label: 'Street Address',
                        hint: '221B Baker Street',
                        icon: Icons.location_on_outlined,
                      ),
                      const SizedBox(height: 12),
                      const _AddressInputField(
                        label: 'Apartment, Suite (Optional)',
                        hint: 'Floor 5, Unit 12',
                        icon: Icons.apartment_outlined,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Expanded(
                            child: _AddressInputField(label: 'City', hint: 'Kabul'),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: _AddressInputField(label: 'State/Province', hint: 'Kabul'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Expanded(
                            child: _AddressInputField(
                              label: 'Zip Code',
                              hint: '1001',
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: _AddressInputField(label: 'Country', hint: 'Afghanistan'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                _sectionCard(
                  title: 'Address Preferences',
                  subtitle: 'Customize this address for quick checkout',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(_addressTypes.length, (index) {
                          final isSelected = _selectedAddressType == index;
                          return ChoiceChip(
                            label: Text(_addressTypes[index]),
                            selected: isSelected,
                            onSelected: (_) {
                              setState(() => _selectedAddressType = index);
                            },
                            selectedColor: _primaryColor.withOpacity(0.14),
                            backgroundColor: const Color(0xFFF3F4F6),
                            labelStyle: TextStyle(
                              color: isSelected ? _primaryColor : Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: isSelected
                                    ? _primaryColor.withOpacity(0.35)
                                    : const Color(0xFFE5E7EB),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                        ),
                        child: SwitchListTile(
                          value: _isDefaultAddress,
                          onChanged: (value) {
                            setState(() => _isDefaultAddress = value);
                          },
                          activeColor: _primaryColor,
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                            'Set as default address',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                          subtitle: const Text(
                            'Use this by default for future orders',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OrderConfirmedScreen()),
                    );
                  },
                  child: ContainerButtonModel(
                    itext: 'Save Address',
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

  Widget _sectionCard({required String title, required String subtitle, required Widget child}) {
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
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 12)),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

const List<String> _addressTypes = ['Home', 'Work', 'Other'];

class _AddressInputField extends StatelessWidget {
  const _AddressInputField({required this.label, required this.hint, this.icon, this.keyboardType});

  final String label;
  final String hint;
  final IconData? icon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: icon == null ? null : Icon(icon, size: 20),
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDB3022), width: 1.3),
        ),
      ),
    );
  }
}
