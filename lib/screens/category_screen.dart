import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    required this.selected,
    required this.onToggle,
    required this.onContinue,
    super.key,
  });

  final Set<String> selected;
  final ValueChanged<String> onToggle;
  final VoidCallback onContinue;

  static const categories = [
    ('Makeup', Icons.brush_outlined),
    ('Skincare', Icons.spa_outlined),
    ('Haircare', Icons.content_cut_rounded),
    ('Fragrance', Icons.local_florist_outlined),
    ('Gift cards', Icons.card_giftcard_rounded),
    ('Tools', Icons.auto_awesome_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(28),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 440),
                  child: Column(
                    children: [
                      const SizedBox(height: 34),
                      const Text(
                        'Select your favorite\ncategory',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23,
                          height: 1.25,
                          fontWeight: FontWeight.w500,
                          color: ink,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'You can select more than one category',
                        style: TextStyle(color: muted, fontSize: 12),
                      ),
                      const SizedBox(height: 36),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 13,
                        runSpacing: 14,
                        children: categories.map((item) {
                          final isSelected = selected.contains(item.$1);
                          return InkWell(
                            borderRadius: BorderRadius.circular(22),
                            onTap: () => onToggle(item.$1),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 180),
                              width: constraints.maxWidth > 420 ? 140 : 132,
                              height: 46,
                              decoration: BoxDecoration(
                                color: isSelected ? blush : Colors.white,
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                  color: isSelected
                                      ? blush
                                      : const Color(0xFFF0E8EA),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    item.$2,
                                    size: 17,
                                    color: isSelected ? Colors.white : blush,
                                  ),
                                  const SizedBox(width: 5),
                                  Flexible(
                                    child: Text(
                                      item.$1,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: isSelected ? Colors.white : ink,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 48),
                      PrimaryButton(label: 'CONTINUE', onPressed: onContinue),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: onContinue,
                        child: const Text(
                          'Skip for now',
                          style: TextStyle(color: muted, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
