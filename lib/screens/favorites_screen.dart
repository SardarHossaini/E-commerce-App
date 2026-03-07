import 'package:flutter/material.dart';
import 'package:e_commerce_app/screens/product_screen.dart';
import 'package:e_commerce_app/widgets/app_drawer.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({
    super.key,
    this.currentIndex = 2,
    this.onDrawerItemSelected = _defaultOnDrawerItemSelected,
  });

  static void _defaultOnDrawerItemSelected(int _) {}

  final int currentIndex;
  final ValueChanged<int> onDrawerItemSelected;

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  static const Color _primaryColor = Color(0xFFDB3022);

  final List<_FavoriteItem> _favorites = [
    _FavoriteItem(
      imagePath: 'assets/images/image1.jpg',
      title: 'Nike Air Max 270',
      category: 'Running',
      rating: 4.3,
      price: 150,
      inStock: true,
      isFavorite: true,
    ),
    _FavoriteItem(
      imagePath: 'assets/images/image2.jpg',
      title: 'Adidas Ultraboost',
      category: 'Lifestyle',
      rating: 4.1,
      price: 180,
      inStock: true,
      isFavorite: true,
    ),
    _FavoriteItem(
      imagePath: 'assets/images/image3.jpg',
      title: 'Puma RS-X',
      category: 'Casual',
      rating: 3.9,
      price: 120,
      inStock: false,
      isFavorite: true,
    ),
    _FavoriteItem(
      imagePath: 'assets/images/image4.jpg',
      title: 'Reebok Classic',
      category: 'Training',
      rating: 4.8,
      price: 100,
      inStock: true,
      isFavorite: true,
    ),
    _FavoriteItem(
      imagePath: 'assets/images/image5.jpg',
      title: 'New Balance 990v5',
      category: 'Running',
      rating: 4.5,
      price: 170,
      inStock: true,
      isFavorite: true,
    ),
  ];

  int _selectedFilter = 0;
  bool _isGridView = true;

  List<String> get _filters => const ['All', 'Running', 'Lifestyle', 'Training'];

  List<_FavoriteItem> get _filteredItems {
    final activeItems = _favorites.where((item) => item.isFavorite).toList();
    if (_selectedFilter == 0) return activeItems;
    final category = _filters[_selectedFilter];
    return activeItems.where((item) => item.category == category).toList();
  }

  void _toggleFavorite(_FavoriteItem item) {
    setState(() => item.isFavorite = !item.isFavorite);
  }

  void _openProductDetails() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ProductScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final items = _filteredItems;
    final bottomSafeArea = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      drawer: AppDrawer(
        currentIndex: widget.currentIndex,
        onItemSelected: widget.onDrawerItemSelected,
      ),
      appBar: AppBar(
        title: const Text('My Favorites'),
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
        actions: [
          IconButton(
            onPressed: () => setState(() => _isGridView = !_isGridView),
            icon: Icon(_isGridView ? Icons.view_list_rounded : Icons.grid_view_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildStatsAndFilters(),
          const SizedBox(height: 12),
          Expanded(
            child: items.isEmpty
                ? _buildEmptyState()
                : _isGridView
                ? _buildGridView(items, bottomSafeArea)
                : _buildListView(items, bottomSafeArea),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsAndFilters() {
    final totalCount = _favorites.where((item) => item.isFavorite).length;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: _primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.favorite_rounded, color: _primaryColor),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$totalCount saved items',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Your wishlist, all in one place',
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('Share')),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _filters.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final isSelected = _selectedFilter == index;
                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => setState(() => _selectedFilter = index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: isSelected ? _primaryColor : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: isSelected ? _primaryColor : Colors.black12),
                    ),
                    child: Center(
                      child: Text(
                        _filters[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView(List<_FavoriteItem> items, double bottomSafeArea) {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(16, 0, 16, bottomSafeArea + 96),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.66,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: _openProductDetails,
          child: Container(
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
                          Image.asset(item.imagePath, fit: BoxFit.cover),
                          Positioned(top: 8, right: 8, child: _favoriteIcon(item)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text(item.category, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(item.rating.toStringAsFixed(1)),
                      const Spacer(),
                      Text(
                        '\$${item.price.toStringAsFixed(0)}',
                        style: const TextStyle(color: _primaryColor, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildListView(List<_FavoriteItem> items, double bottomSafeArea) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(16, 0, 16, bottomSafeArea + 96),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: _openProductDetails,
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(10),
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
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(item.imagePath, width: 94, height: 94, fit: BoxFit.cover),
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
                      const SizedBox(height: 4),
                      Text(
                        item.category,
                        style: const TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.star_rounded, size: 16, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(item.rating.toStringAsFixed(1)),
                          const SizedBox(width: 10),
                          _stockChip(item.inStock),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${item.price.toStringAsFixed(0)}',
                        style: const TextStyle(
                          color: _primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                _favoriteIcon(item),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _favoriteIcon(_FavoriteItem item) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => _toggleFavorite(item),
      child: Container(
        width: 34,
        height: 34,
        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Icon(
          item.isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          color: _primaryColor,
          size: 18,
        ),
      ),
    );
  }

  Widget _stockChip(bool inStock) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: inStock ? const Color(0xFFE7F8EC) : const Color(0xFFFFECEC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        inStock ? 'In stock' : 'Out of stock',
        style: TextStyle(
          fontSize: 11,
          color: inStock ? const Color(0xFF1F9254) : const Color(0xFFD93025),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: _primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.favorite_outline_rounded, color: _primaryColor, size: 34),
            ),
            const SizedBox(height: 14),
            const Text(
              'No favorites yet',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            const Text(
              'Tap the heart icon on products to add them here.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteItem {
  _FavoriteItem({
    required this.imagePath,
    required this.title,
    required this.category,
    required this.rating,
    required this.price,
    required this.inStock,
    required this.isFavorite,
  });

  final String imagePath;
  final String title;
  final String category;
  final double rating;
  final double price;
  final bool inStock;
  bool isFavorite;
}
