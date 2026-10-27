import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';

class SkinAnalysisScreen extends StatelessWidget {
  const SkinAnalysisScreen({
    required this.onBack,
    required this.onViewProducts,
    required this.onNavigateToTab,
    super.key,
  });

  final VoidCallback onBack;
  final VoidCallback onViewProducts;
  final ValueChanged<int> onNavigateToTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 20, 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: onBack,
                    icon:
                        const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                  ),
                  const Expanded(
                    child: Text(
                      'Skin analysis',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: ink,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(width: 44),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 8, 18, 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const BeautyImage(
                        assetPath: skinAnalysisImage,
                        fit: BoxFit.cover,
                      ),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0x18000000),
                              Colors.transparent,
                              Color(0xBB000000),
                            ],
                            stops: [0, .45, 1],
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 24,
                        left: 0,
                        right: 0,
                        child: Text(
                          'Your skin, understood',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              shadows: [Shadow(blurRadius: 8)]),
                        ),
                      ),
                      const AnalysisMarker(top: 0.34, left: 0.27),
                      const AnalysisMarker(top: 0.37, right: 0.25),
                      const AnalysisMarker(top: 0.52, left: 0.21),
                      const AnalysisMarker(top: 0.53, right: 0.20),
                      const AnalysisMarker(top: 0.66, left: 0.46),
                      Positioned(
                        left: 14,
                        right: 14,
                        bottom: 14,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 14),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(19),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Special for you',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: ink),
                              ),
                              const SizedBox(height: 11),
                              const Row(
                                children: [
                                  AnalysisProduct(
                                      color: Color(0xFFD8EEF0),
                                      icon: Icons.water_drop_outlined,
                                      imageAsset: serumProductImage),
                                  SizedBox(width: 9),
                                  AnalysisProduct(
                                      color: Color(0xFFFFE7D7),
                                      icon: Icons.spa_outlined,
                                      imageAsset: creamProductImage),
                                  SizedBox(width: 9),
                                  AnalysisProduct(
                                      color: Color(0xFFE8E6F5),
                                      icon: Icons.face_retouching_natural,
                                      imageAsset: makeupProductImage),
                                ],
                              ),
                              const SizedBox(height: 12),
                              PrimaryButton(
                                label: 'View all products',
                                onPressed: onViewProducts,
                                height: 42,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BeautyBottomBar(
        selectedTab: 0,
        onSelect: onNavigateToTab,
        onOpenAnalysis: onBack,
      ),
    );
  }
}
