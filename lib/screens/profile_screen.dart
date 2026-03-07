import 'package:flutter/material.dart';
import 'package:e_commerce_app/widgets/app_drawer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    this.currentIndex = 3,
    this.onDrawerItemSelected = _defaultOnDrawerItemSelected,
  });

  static void _defaultOnDrawerItemSelected(int _) {}

  final int currentIndex;
  final ValueChanged<int> onDrawerItemSelected;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const Color _primaryColor = Color(0xFFDB3022);
  bool _emailUpdates = true;
  bool _pushNotifications = true;

  final List<_ProfileOption> _accountOptions = const [
    _ProfileOption(
      icon: Icons.person_outline_rounded,
      title: 'Personal details',
      subtitle: 'Name, phone and email',
    ),
    _ProfileOption(
      icon: Icons.location_on_outlined,
      title: 'Address book',
      subtitle: 'Manage shipping addresses',
    ),
    _ProfileOption(
      icon: Icons.payment_rounded,
      title: 'Payment methods',
      subtitle: 'Cards and wallet settings',
    ),
    _ProfileOption(
      icon: Icons.lock_outline_rounded,
      title: 'Privacy & security',
      subtitle: 'Password and account safety',
    ),
    _ProfileOption(
      icon: Icons.language_rounded,
      title: 'Language',
      subtitle: 'English (United States)',
    ),
  ];

  final List<_ProfileOption> _supportOptions = const [
    _ProfileOption(
      icon: Icons.headset_mic_outlined,
      title: 'Help center',
      subtitle: 'Get support and FAQs',
    ),
    _ProfileOption(
      icon: Icons.description_outlined,
      title: 'Terms & conditions',
      subtitle: 'Read app policies',
    ),
    _ProfileOption(icon: Icons.info_outline_rounded, title: 'About app', subtitle: 'Version 1.0.0'),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomSafeArea = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      drawer: AppDrawer(
        currentIndex: widget.currentIndex,
        onItemSelected: widget.onDrawerItemSelected,
      ),
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu_rounded),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined))],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, 4, 16, bottomSafeArea + 96),
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 14),
          _buildStatsRow(),
          const SizedBox(height: 14),
          _buildSectionCard(
            title: 'Account settings',
            children: _accountOptions.map(_buildOptionTile).toList(),
          ),
          const SizedBox(height: 14),
          _buildPreferencesCard(),
          const SizedBox(height: 14),
          _buildSectionCard(
            title: 'Support',
            children: _supportOptions.map(_buildOptionTile).toList(),
          ),
          const SizedBox(height: 14),
          _buildLogoutButton(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: _primaryColor.withOpacity(0.18), width: 2),
              image: const DecorationImage(
                image: AssetImage('assets/images/image6.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sardar Hussaini',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 4),
                Text('sardar@email.com', style: TextStyle(color: Colors.black54, fontSize: 13)),
                SizedBox(height: 2),
                Text('+93 70 123 4567', style: TextStyle(color: Colors.black54, fontSize: 13)),
              ],
            ),
          ),
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: _primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.verified_rounded, color: _primaryColor, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: const [
        Expanded(
          child: _StatCard(title: '12', subtitle: 'Orders', icon: Icons.receipt_long_rounded),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _StatCard(title: '05', subtitle: 'Wishlist', icon: Icons.favorite_rounded),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _StatCard(title: '03', subtitle: 'Addresses', icon: Icons.location_on_rounded),
        ),
      ],
    );
  }

  Widget _buildSectionCard({required String title, required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(_ProfileOption option) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: _primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(option.icon, color: _primaryColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(option.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 2),
                  Text(
                    option.subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.black38),
          ],
        ),
      ),
    );
  }

  Widget _buildPreferencesCard() {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
          const Text('Preferences', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          SwitchListTile.adaptive(
            value: _emailUpdates,
            activeColor: _primaryColor,
            contentPadding: EdgeInsets.zero,
            title: const Text('Email updates'),
            subtitle: const Text('Offers, order updates and reminders'),
            onChanged: (value) => setState(() => _emailUpdates = value),
          ),
          SwitchListTile.adaptive(
            value: _pushNotifications,
            activeColor: _primaryColor,
            contentPadding: EdgeInsets.zero,
            title: const Text('Push notifications'),
            subtitle: const Text('Real-time shipping and delivery alerts'),
            onChanged: (value) => setState(() => _pushNotifications = value),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFFD93025),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFFFFD9D6)),
          ),
        ),
        icon: const Icon(Icons.logout_rounded),
        label: const Text('Log out'),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.title, required this.subtitle, required this.icon});

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFDB3022);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
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
      child: Column(
        children: [
          Icon(icon, color: primaryColor, size: 20),
          const SizedBox(height: 7),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
          const SizedBox(height: 2),
          Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 12)),
        ],
      ),
    );
  }
}

class _ProfileOption {
  final IconData icon;
  final String title;
  final String subtitle;

  const _ProfileOption({required this.icon, required this.title, required this.subtitle});
}
