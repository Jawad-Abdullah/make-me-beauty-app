import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab_mid/main.dart';
import 'package:lab_mid/theme/app_theme.dart';
import 'package:lab_mid/widgets/app_widgets.dart';

void main() {
  test('beauty photos are bundled as local assets', () async {
    final imageAssets = [
      homePortraitImage,
      skinAnalysisImage,
      brushProductImage,
      creamProductImage,
      serumProductImage,
      makeupProductImage,
    ];

    for (final assetPath in imageAssets) {
      final asset = await rootBundle.load(assetPath);
      expect(asset.lengthInBytes, greaterThan(0), reason: assetPath);
    }
  });

  testWidgets('welcome, registration, and sign-in reach all beauty screens',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MakeMeApp());

    expect(find.byType(BrandMark), findsOneWidget);
    await tester.tap(find.byType(BrandMark).first);
    await tester.pumpAndSettle();

    expect(find.text('SIGN IN'), findsOneWidget);
    await tester.tap(find.text('REGISTER'));
    await tester.pumpAndSettle();

    expect(find.text('Create your account'), findsOneWidget);
    await tester.tap(find.text('SIGN IN'));
    await tester.pumpAndSettle();
    expect(find.text('Don’t have an account yet? '), findsOneWidget);

    await tester.tap(find.text('SIGN IN'));
    await tester.pumpAndSettle();

    expect(find.text('Select your favorite\ncategory'), findsOneWidget);
    await tester.tap(find.text('CONTINUE'));
    await tester.pumpAndSettle();

    expect(find.text('Hi 👋 Natalia Bueno'), findsOneWidget);
    await tester.tap(find.text('Daily skin routine'));
    await tester.pumpAndSettle();

    expect(find.text('Skin analysis'), findsOneWidget);
    expect(find.text('View all products'), findsOneWidget);
    await tester.tap(find.text('View all products'));
    await tester.pumpAndSettle();

    expect(find.text('Products'), findsWidgets);
    final productName = find.text('Radiant Glow').first;
    await tester.ensureVisible(productName);
    await tester.pumpAndSettle();
    await tester.tap(productName);
    await tester.pumpAndSettle();
    expect(find.text('Makeup brushes\n“Special blending”'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded).first);
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.chat_bubble_outline_rounded));
    await tester.pumpAndSettle();
    expect(find.text('Community'), findsWidgets);

    await tester.tap(find.byIcon(Icons.person_outline_rounded));
    await tester.pumpAndSettle();
    expect(find.text('Natalia Bueno'), findsOneWidget);
  });
}
