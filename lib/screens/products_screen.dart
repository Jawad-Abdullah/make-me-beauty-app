import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';

class ProductCatalog extends StatefulWidget {
  const ProductCatalog({
    required this.favorites,
    required this.onOpenProduct,
    required this.onFavorite,
    super.key,
  });

  final Set<String> favorites;
  final VoidCallback onOpenProduct;
  final ValueChanged<String> onFavorite;

  @override
  State<ProductCatalog> createState() => _ProductCatalogState();
}

class _ProductCatalogState extends State<ProductCatalog> {
  String _category = 'All';
  final _categories = ['All', 'Skincare', 'Makeup', 'Tools'];

  @override
  Widget build(BuildContext context) {
    final products = [
      (
        'Radiant Glow',
        'Special facial product',
        '\$32.00',
        const Color(0xFFFFE6D8),
        Icons.spa_outlined,
        'Skincare',
        creamProductImage
      ),
      (
        'Dew Drop Serum',
        'Daily hydration',
        '\$24.00',
        const Color(0xFFE1F2EF),
        Icons.water_drop_outlined,
        'Skincare',
        serumProductImage
      ),
      (
        'Soft Touch Brushes',
        'Everyday essentials',
        '\$29.00',
        const Color(0xFFE7E9F5),
        Icons.brush_outlined,
        'Tools',
        brushProductImage
      ),
      (
        'Rose Cream',
        'Nourishing moisturizer',
        '\$28.00',
        const Color(0xFFF8E3EA),
        Icons.favorite_border_rounded,
        'Makeup',
        makeupProductImage
      ),
    ];
    final visibleProducts = _category == 'All'
        ? products
        : products.where((product) => product.$6 == _category).toList();
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 24),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const TopBar(showSearch: true),
              const SizedBox(height: 24),
              const Text('Products',
                  style: TextStyle(
                      color: ink, fontSize: 22, fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              const Text('Find something lovely for your routine',
                  style: TextStyle(color: muted, fontSize: 12)),
              const SizedBox(height: 20),
              SizedBox(
                height: 38,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final value = _categories[index];
                    final active = _category == value;
                    return ChoiceChip(
                      label: Text(value),
                      selected: active,
                      onSelected: (_) => setState(() => _category = value),
                      selectedColor: blush,
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: active ? Colors.white : ink,
                        fontSize: 11,
                      ),
                      side: BorderSide(
                        color: active ? blush : const Color(0xFFF0E7E9),
                      ),
                      showCheckmark: false,
                    );
                  },
                ),
              ),
              const SizedBox(height: 14),
              const Text('Special facial products',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, color: ink)),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: visibleProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 13,
                  childAspectRatio: 0.76,
                ),
                itemBuilder: (context, index) {
                  final product = visibleProducts[index];
                  final favorite = widget.favorites.contains(product.$1);
                  return GestureDetector(
                    onTap: widget.onOpenProduct,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(color: const Color(0xFFF2EAEC)),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: product.$4,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: BeautyImage(
                                      assetPath: product.$7,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 5,
                                  top: 5,
                                  child: Material(
                                    color: Colors.white,
                                    shape: const CircleBorder(),
                                    child: InkWell(
                                      customBorder: const CircleBorder(),
                                      onTap: () =>
                                          widget.onFavorite(product.$1),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6),
                                        child: Icon(
                                          favorite
                                              ? Icons.favorite_rounded
                                              : Icons.favorite_border_rounded,
                                          size: 15,
                                          color: blush,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 9),
                          Text(product.$1,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: ink)),
                          const SizedBox(height: 4),
                          Text(product.$2,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  const TextStyle(fontSize: 10, color: muted)),
                          const SizedBox(height: 7),
                          Text(product.$3,
                              style: const TextStyle(
                                  color: blush,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
