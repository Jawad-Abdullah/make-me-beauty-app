import 'package:flutter/material.dart';

import 'screens/category_screen.dart';
import 'screens/main_navigation.dart';
import 'screens/product_detail_screen.dart';
import 'screens/register_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/skin_analysis_screen.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MakeMeApp());
}

class MakeMeApp extends StatelessWidget {
  const MakeMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Make Me',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: canvas,
        colorScheme: ColorScheme.fromSeed(
          seedColor: blush,
          primary: blush,
          surface: canvas,
        ),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: canvas,
          foregroundColor: ink,
          elevation: 0,
          centerTitle: false,
        ),
      ),
      home: const AppShell(),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _screen = 0;
  int _tab = 0;
  final Set<String> _selectedCategories = {'Makeup', 'Skincare'};
  final Set<String> _favorites = {};

  void _open(int screen) => setState(() => _screen = screen);

  @override
  Widget build(BuildContext context) {
    switch (_screen) {
      case 0:
        return SplashScreen(onContinue: () => _open(1));
      case 1:
        return SignInScreen(
          onContinue: () => _open(2),
          onRegister: () => _open(6),
        );
      case 2:
        return CategoryScreen(
          selected: _selectedCategories,
          onToggle: (value) => setState(() {
            if (!_selectedCategories.add(value)) {
              _selectedCategories.remove(value);
            }
          }),
          onContinue: () {
            setState(() {
              _screen = 3;
              _tab = 0;
            });
          },
        );
      case 3:
        return MainNavigation(
          tab: _tab,
          favorites: _favorites,
          onTabChanged: (value) => setState(() => _tab = value),
          onOpenAnalysis: () => _open(4),
          onOpenProduct: () => _open(5),
          onFavorite: (value) => setState(() {
            if (!_favorites.add(value)) {
              _favorites.remove(value);
            }
          }),
        );
      case 4:
        return SkinAnalysisScreen(
          onBack: () => _open(3),
          onViewProducts: () => setState(() {
            _screen = 3;
            _tab = 1;
          }),
          onNavigateToTab: (value) => setState(() {
            _screen = 3;
            _tab = value;
          }),
        );
      case 5:
        return ProductDetailScreen(
          isFavorite: _favorites.contains('Radiant Glow'),
          onFavorite: () => setState(() {
            if (!_favorites.add('Radiant Glow')) {
              _favorites.remove('Radiant Glow');
            }
          }),
          onBack: () => _open(3),
          onNavigateToTab: (value) => setState(() {
            _screen = 3;
            _tab = value;
          }),
        );
      case 6:
        return RegisterScreen(
          onCreateAccount: () => _open(2),
          onSignIn: () => _open(1),
        );
      default:
        return SplashScreen(onContinue: () => _open(1));
    }
  }
}
