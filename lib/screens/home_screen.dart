import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    required this.onOpenAnalysis,
    required this.onOpenProduct,
    super.key,
  });

  final VoidCallback onOpenAnalysis;
  final VoidCallback onOpenProduct;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const TopBar(),
              const SizedBox(height: 25),
              const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('MONDAY, 12 JUNE',
                            style: TextStyle(
                                color: muted, fontSize: 9, letterSpacing: 1.2)),
                        SizedBox(height: 8),
                        Text(
                          'Hi 👋 Natalia Bueno',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ink,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text('Let’s make your day glow.',
                            style: TextStyle(color: muted, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              GestureDetector(
                onTap: onOpenAnalysis,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 13,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color(0xFFF4EDEF)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          color: blushLight,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.face_retouching_natural_rounded,
                            color: blush),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Daily skin routine',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: ink)),
                            SizedBox(height: 4),
                            Text('Check in with your skin today',
                                style: TextStyle(fontSize: 10, color: muted)),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded,
                          color: muted, size: 21),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 23),
              SectionHeading(
                title: 'Your glow-up starts here',
                action: 'See more',
                onTap: onOpenAnalysis,
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: onOpenAnalysis,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 230,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        const BeautyImage(
                          assetPath: homePortraitImage,
                          fit: BoxFit.cover,
                        ),
                        const DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Color(0xB5000000),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 18,
                          right: 18,
                          bottom: 17,
                          child: Row(
                            children: [
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'A little care goes a long way',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Get your personalized skin check',
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: blush,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.arrow_forward_rounded,
                                    color: Colors.white, size: 19),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SectionHeading(
                title: 'Special for you',
                action: 'View all',
                onTap: onOpenProduct,
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 178,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ProductTile(
                      name: 'Hydrating serum',
                      subtitle: 'Glow essentials',
                      shade: const Color(0xFFE5F3F4),
                      icon: Icons.water_drop_outlined,
                      imageAsset: serumProductImage,
                      onTap: onOpenProduct,
                    ),
                    const SizedBox(width: 12),
                    ProductTile(
                      name: 'Radiant Glow',
                      subtitle: 'Special facial product',
                      shade: const Color(0xFFFFE9DF),
                      icon: Icons.spa_outlined,
                      imageAsset: creamProductImage,
                      onTap: onOpenProduct,
                    ),
                    const SizedBox(width: 12),
                    ProductTile(
                      name: 'Daily moisturizer',
                      subtitle: 'Soft, dewy skin',
                      shade: const Color(0xFFECE9FA),
                      icon: Icons.local_florist_outlined,
                      imageAsset: makeupProductImage,
                      onTap: onOpenProduct,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SectionHeading(
                title: 'Popular this week',
                action: 'See all',
                onTap: onOpenProduct,
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: onOpenProduct,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFF3EBED)),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: const SizedBox(
                          height: 92,
                          width: 92,
                          child: BeautyImage(
                            assetPath: brushProductImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 13),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Makeup brushes',
                                style: TextStyle(
                                    color: ink,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13)),
                            SizedBox(height: 5),
                            Text('Soft touch brush set',
                                style: TextStyle(color: muted, fontSize: 11)),
                            SizedBox(height: 10),
                            Text('\$29.00',
                                style: TextStyle(
                                    color: blush,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded,
                          color: muted, size: 14),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
