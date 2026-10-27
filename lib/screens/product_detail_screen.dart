import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    required this.isFavorite,
    required this.onFavorite,
    required this.onBack,
    required this.onNavigateToTab,
    super.key,
  });

  final bool isFavorite;
  final VoidCallback onFavorite;
  final VoidCallback onBack;
  final ValueChanged<int> onNavigateToTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              leading: IconButton(
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
              ),
              actions: [
                IconButton(
                  onPressed: onFavorite,
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: blush,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: const SizedBox(
                        height: 305,
                        width: double.infinity,
                        child: BeautyImage(
                          assetPath: brushProductImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text('MAKEUP TOOLS',
                        style: TextStyle(
                            color: blush,
                            fontSize: 9,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w700)),
                    const SizedBox(height: 7),
                    const Text(
                      'Makeup brushes\n“Special blending”',
                      style: TextStyle(
                        fontSize: 21,
                        height: 1.24,
                        fontWeight: FontWeight.w600,
                        color: ink,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(Icons.star_rounded,
                            color: Color(0xFFFFC45B), size: 17),
                        SizedBox(width: 4),
                        Text('4.9',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12)),
                        SizedBox(width: 5),
                        Text('(128 reviews)',
                            style: TextStyle(color: muted, fontSize: 11)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Create a flawless look with this soft-touch brush set. Each brush is designed for smooth, even application and effortless blending.',
                      style: TextStyle(
                          color: Color(0xFF777176), fontSize: 12, height: 1.7),
                    ),
                    const SizedBox(height: 18),
                    const Text('What’s inside',
                        style: TextStyle(
                            color: ink,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    const Text(
                      'A curated collection of premium face and eye brushes, made with ultra-soft cruelty-free bristles.',
                      style: TextStyle(
                          color: Color(0xFF777176), fontSize: 12, height: 1.6),
                    ),
                    const SizedBox(height: 20),
                    const SectionHeading(title: 'Product collection'),
                    const SizedBox(height: 12),
                    const SizedBox(
                      height: 140,
                      child: Row(
                        children: [
                          Expanded(
                            child: ProductTile(
                              name: 'Brush set',
                              subtitle: 'Your daily kit',
                              shade: Color(0xFFFFE9E8),
                              icon: Icons.brush_outlined,
                              imageAsset: brushProductImage,
                            ),
                          ),
                          SizedBox(width: 11),
                          Expanded(
                            child: ProductTile(
                              name: 'Glow palette',
                              subtitle: 'Soft radiance',
                              shade: Color(0xFFECE9F9),
                              icon: Icons.auto_awesome_outlined,
                              imageAsset: makeupProductImage,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 23),
                    Row(
                      children: [
                        const Expanded(
                          child: Text('\$39.00',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: ink,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Material(
                          color: blush,
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () =>
                                showAppMessage(context, 'Added to your bag'),
                            child: const SizedBox(
                              height: 42,
                              width: 42,
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                                size: 19,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BeautyBottomBar(
        selectedTab: 1,
        onSelect: onNavigateToTab,
        onOpenAnalysis: () => onNavigateToTab(0),
      ),
    );
  }
}
