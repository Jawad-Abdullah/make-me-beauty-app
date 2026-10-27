import 'package:flutter/material.dart';
import '../widgets/app_widgets.dart';
import 'community_screen.dart';
import 'home_screen.dart';
import 'products_screen.dart';
import 'profile_screen.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({
    required this.tab,
    required this.favorites,
    required this.onTabChanged,
    required this.onOpenAnalysis,
    required this.onOpenProduct,
    required this.onFavorite,
    super.key,
  });

  final int tab;
  final Set<String> favorites;
  final ValueChanged<int> onTabChanged;
  final VoidCallback onOpenAnalysis;
  final VoidCallback onOpenProduct;
  final ValueChanged<String> onFavorite;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeContent(
        onOpenAnalysis: onOpenAnalysis,
        onOpenProduct: onOpenProduct,
      ),
      ProductCatalog(
        favorites: favorites,
        onOpenProduct: onOpenProduct,
        onFavorite: onFavorite,
      ),
      const CommunityContent(),
      const ProfileContent(),
    ];
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: tab, children: pages),
      ),
      bottomNavigationBar: BeautyBottomBar(
        selectedTab: tab,
        onSelect: onTabChanged,
        onOpenAnalysis: onOpenAnalysis,
      ),
    );
  }
}
