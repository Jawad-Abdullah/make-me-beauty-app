# Make Me

A Flutter cosmetics and skincare UI prototype based on the supplied Make Me
design reference.

## Project structure

- `lib/main.dart` starts the app and owns the screen flow and shared app state.
- `lib/theme/app_theme.dart` contains the color palette and local image paths.
- `assets/images/` contains the beauty photos used across the screens. These
  are bundled with the app, so the UI does not depend on a network connection.
- `lib/widgets/app_widgets.dart` contains reusable buttons, fields, branding,
  navigation, product tiles, and image widgets.
- `lib/screens/splash_screen.dart` shows the app mark.
- `lib/screens/sign_in_screen.dart` contains the sign-in form.
- `lib/screens/register_screen.dart` contains the account registration form.
- `lib/screens/category_screen.dart` lets users choose beauty categories.
- `lib/screens/main_navigation.dart` hosts the main tab navigation.
- `lib/screens/home_screen.dart` shows the personalized home and featured items.
- `lib/screens/products_screen.dart` shows the filterable product catalog.
- `lib/screens/skin_analysis_screen.dart` shows the skin-analysis concept.
- `lib/screens/product_detail_screen.dart` shows product information and actions.
- `lib/screens/community_screen.dart` shows the community feed.
- `lib/screens/profile_screen.dart` shows profile options.

## Screen flow

The prototype starts at the splash screen. Tap the logo to open sign-in, then
continue to category selection and the main app. The main tab bar opens Home,
Products, Community, and Profile; its center action opens Skin Analysis.
Selecting a product opens its detail screen.

Authentication and product actions are UI demonstrations and are not connected
to a backend.

## Run and verify

```shell
flutter pub get
flutter run
flutter analyze
flutter test
```
