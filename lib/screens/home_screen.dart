import 'package:e_commerce_app/screens/product_screen.dart';
import 'package:e_commerce_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    this.currentIndex = 0,
    this.onDrawerItemSelected = _defaultOnDrawerItemSelected,
  });

  static void _defaultOnDrawerItemSelected(int _) {}

  final int currentIndex;
  final ValueChanged<int> onDrawerItemSelected;

  static const Color _primaryColor = Color(0xFFDB3022);

  static const List<String> _tabs = ['All', 'Running', 'Lifestyle', 'Training', 'Basketball'];

  static const List<_ProductItem> _products = [
    _ProductItem(
      imagePath: 'assets/images/image1.jpg',
      title: 'Nike Air Max 270',
      price: '\$150',
      rating: '4.3',
    ),
    _ProductItem(
      imagePath: 'assets/images/image2.jpg',
      title: 'Adidas Ultraboost',
      price: '\$180',
      rating: '4.1',
    ),
    _ProductItem(
      imagePath: 'assets/images/image3.jpg',
      title: 'Puma RS-X',
      price: '\$120',
      rating: '3.9',
    ),
    _ProductItem(
      imagePath: 'assets/images/image4.jpg',
      title: 'Reebok Classic',
      price: '\$100',
      rating: '4.8',
    ),
    _ProductItem(
      imagePath: 'assets/images/image5.jpg',
      title: 'New Balance 990v5',
      price: '\$170',
      rating: '4.5',
    ),
    _ProductItem(
      imagePath: 'assets/images/image6.jpg',
      title: 'Asics Gel-Kayano 27',
      price: '\$160',
      rating: '4.3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      drawer: AppDrawer(currentIndex: currentIndex, onItemSelected: onDrawerItemSelected),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTopHeader(context),
                    const SizedBox(height: 20),
                    _buildSearchRow(),
                    const SizedBox(height: 20),
                    _buildPromoBanner(),
                    const SizedBox(height: 24),
                    _buildSectionHeader('Shop by category', 'See all'),
                    const SizedBox(height: 12),
                    _buildCategoryTabs(),
                    const SizedBox(height: 24),
                    _buildSectionHeader('Featured sneakers', 'View all'),
                    const SizedBox(height: 14),
                    _buildFeaturedProducts(context),
                    const SizedBox(height: 24),
                    _buildSectionHeader('Popular right now', 'More'),
                    const SizedBox(height: 14),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              sliver: SliverGrid.builder(
                itemCount: _products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) => _ProductGridCard(product: _products[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
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
              Text('Welcome back 👋', style: TextStyle(color: Colors.black54, fontSize: 13)),
              SizedBox(height: 4),
              Text(
                'Find your perfect shoes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.black12),
          ),
          child: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu_rounded, size: 22),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchRow() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search products',
                prefixIcon: Icon(Icons.search, color: _primaryColor),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(Icons.notifications_none_rounded, color: _primaryColor),
              Positioned(
                top: 12,
                right: 13,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(color: _primaryColor, shape: BoxShape.circle),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF2B2B2B), Color(0xFF161616)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 8,
            bottom: 0,
            top: 0,
            child: Image.asset('assets/images/freed.png', fit: BoxFit.contain),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'NEW COLLECTION',
                    style: TextStyle(
                      color: _primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                ),
                const Spacer(),
                const SizedBox(
                  width: 170,
                  child: Text(
                    'Summer Sale\nUp to 50% Off',
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        TextButton(
          onPressed: () {},
          child: Text(
            actionText,
            style: const TextStyle(color: _primaryColor, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryTabs() {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        itemCount: _tabs.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: isSelected ? _primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: isSelected ? _primaryColor : Colors.black12),
            ),
            child: Center(
              child: Text(
                _tabs[index],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedProducts(BuildContext context) {
    return SizedBox(
      height: 262,
      child: ListView.separated(
        itemCount: _products.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final product = _products[index];
          return _FeaturedProductCard(product: product);
        },
      ),
    );
  }
}

class _FeaturedProductCard extends StatelessWidget {
  const _FeaturedProductCard({required this.product});

  final _ProductItem product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => ProductScreen()));
      },
      child: Container(
        width: 175,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(product.imagePath, fit: BoxFit.cover),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            size: 16,
                            color: HomeScreen._primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.star_rounded, color: Colors.amber, size: 18),
                  const SizedBox(width: 4),
                  Text(product.rating, style: const TextStyle(color: Colors.black54)),
                  const Spacer(),
                  Text(
                    product.price,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: HomeScreen._primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductGridCard extends StatelessWidget {
  const _ProductGridCard({required this.product});

  final _ProductItem product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => ProductScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(product.imagePath, fit: BoxFit.cover, width: double.infinity),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(product.rating, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                  const Spacer(),
                  Text(
                    product.price,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: HomeScreen._primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductItem {
  final String imagePath;
  final String title;
  final String price;
  final String rating;

  const _ProductItem({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.rating,
  });
}
