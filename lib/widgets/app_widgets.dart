import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BeautyBottomBar extends StatelessWidget {
  const BeautyBottomBar({
    required this.selectedTab,
    required this.onSelect,
    required this.onOpenAnalysis,
    super.key,
  });

  final int selectedTab;
  final ValueChanged<int> onSelect;
  final VoidCallback onOpenAnalysis;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 63,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFF4EFF0))),
        ),
        child: Row(
          children: [
            _BottomIcon(
              icon: Icons.home_outlined,
              selectedIcon: Icons.home_rounded,
              selected: selectedTab == 0,
              label: 'Home',
              onTap: () => onSelect(0),
            ),
            _BottomIcon(
              icon: Icons.grid_view_outlined,
              selectedIcon: Icons.grid_view_rounded,
              selected: selectedTab == 1,
              label: 'Products',
              onTap: () => onSelect(1),
            ),
            Expanded(
              child: Center(
                child: Material(
                  color: blush,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: onOpenAnalysis,
                    child: const SizedBox(
                      width: 43,
                      height: 43,
                      child: Icon(
                        Icons.face_retouching_natural_rounded,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            _BottomIcon(
              icon: Icons.chat_bubble_outline_rounded,
              selectedIcon: Icons.chat_bubble_rounded,
              selected: selectedTab == 2,
              label: 'Community',
              onTap: () => onSelect(2),
            ),
            _BottomIcon(
              icon: Icons.person_outline_rounded,
              selectedIcon: Icons.person_rounded,
              selected: selectedTab == 3,
              label: 'Profile',
              onTap: () => onSelect(3),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomIcon extends StatelessWidget {
  const _BottomIcon({
    required this.icon,
    required this.selectedIcon,
    required this.selected,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final IconData selectedIcon;
  final bool selected;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        tooltip: label,
        onPressed: onTap,
        icon: Icon(
          selected ? selectedIcon : icon,
          color: selected ? blush : const Color(0xFFB8B2B4),
          size: 21,
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({this.showSearch = false, super.key});
  final bool showSearch;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BrandMark(size: 23),
        const Spacer(),
        if (showSearch)
          IconButton(
            tooltip: 'Search',
            onPressed: () => showAppMessage(context, 'Search products'),
            icon: const Icon(Icons.search_rounded, color: ink, size: 22),
          ),
        const SizedBox(width: 5),
        const _ProfileAvatar(size: 32),
      ],
    );
  }
}

class BrandMark extends StatelessWidget {
  const BrandMark({required this.size, super.key});
  final double size;

  @override
  Widget build(BuildContext context) {
    final diamond = size * .39;
    return SizedBox(
      width: size,
      height: size * .72,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.translate(
            offset: Offset(-diamond * .4, -diamond * .28),
            child: Transform.rotate(
              angle: .78,
              child: Container(
                width: diamond,
                height: diamond,
                decoration: BoxDecoration(
                  color: const Color(0xFFF26F91),
                  borderRadius: BorderRadius.circular(size * .07),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(diamond * .4, -diamond * .28),
            child: Transform.rotate(
              angle: .78,
              child: Container(
                width: diamond,
                height: diamond,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9A7B8),
                  borderRadius: BorderRadius.circular(size * .07),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-diamond * .4, diamond * .28),
            child: Transform.rotate(
              angle: .78,
              child: Container(
                width: diamond,
                height: diamond,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFC0CB),
                  borderRadius: BorderRadius.circular(size * .07),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(diamond * .4, diamond * .28),
            child: Transform.rotate(
              angle: .78,
              child: Container(
                width: diamond,
                height: diamond,
                decoration: BoxDecoration(
                  color: const Color(0xFFEE7896),
                  borderRadius: BorderRadius.circular(size * .07),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({required this.hint, required this.icon, super.key});
  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFF1E8EA)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFF1E8EA)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: blush),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    this.height = 50,
    super.key,
  });
  final String label;
  final VoidCallback onPressed;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: blush,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          textStyle: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: .5),
        ),
        child: Text(label),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({required this.icon, required this.onTap, super.key});
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFFF1E8EA)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: icon,
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    required this.title,
    this.action,
    this.onTap,
    super.key,
  });
  final String title;
  final String? action;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title,
              style: const TextStyle(
                  color: ink, fontSize: 15, fontWeight: FontWeight.w600)),
        ),
        if (action != null)
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            child: Text(action!,
                style: const TextStyle(color: blush, fontSize: 10)),
          ),
      ],
    );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({
    required this.name,
    required this.subtitle,
    required this.shade,
    required this.icon,
    this.imageAsset,
    this.onTap,
    super.key,
  });
  final String name;
  final String subtitle;
  final Color shade;
  final IconData icon;
  final String? imageAsset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 132,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: shade,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: imageAsset == null
                    ? ProductArt(icon: icon, shade: shade)
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BeautyImage(
                          assetPath: imageAsset!,
                          fit: BoxFit.cover,
                          fallbackIcon: icon,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 7),
            Text(name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: ink, fontSize: 11, fontWeight: FontWeight.w600)),
            const SizedBox(height: 3),
            Text(subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: muted, fontSize: 9)),
          ],
        ),
      ),
    );
  }
}

class BeautyImage extends StatelessWidget {
  const BeautyImage({
    required this.assetPath,
    this.fit = BoxFit.cover,
    this.fallbackIcon = Icons.spa_outlined,
    super.key,
  });

  final String assetPath;
  final BoxFit fit;
  final IconData fallbackIcon;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => Container(
        color: blushLight,
        child: Center(
          child: Icon(fallbackIcon, color: blush, size: 42),
        ),
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        height: size,
        width: size,
        child: const BeautyImage(
          assetPath: homePortraitImage,
          fit: BoxFit.cover,
          fallbackIcon: Icons.person_rounded,
        ),
      ),
    );
  }
}

class AnalysisMarker extends StatelessWidget {
  const AnalysisMarker({
    required this.top,
    this.left,
    this.right,
    super.key,
  });
  final double top;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.sizeOf(context).height * top,
      left: left == null ? null : MediaQuery.sizeOf(context).width * left!,
      right: right == null ? null : MediaQuery.sizeOf(context).width * right!,
      child: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          color: const Color(0x44FFFFFF),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.5),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
      ),
    );
  }
}

class AnalysisProduct extends StatelessWidget {
  const AnalysisProduct({
    required this.color,
    required this.icon,
    required this.imageAsset,
    super.key,
  });

  final Color color;
  final IconData icon;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(11),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: BeautyImage(
            assetPath: imageAsset,
            fit: BoxFit.cover,
            fallbackIcon: icon,
          ),
        ),
      ),
    );
  }
}

class ProductArt extends StatelessWidget {
  const ProductArt({required this.icon, required this.shade, super.key});

  final IconData icon;
  final Color shade;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(color: shade),
        Positioned(
          bottom: 11,
          child: Icon(icon, color: blush.withOpacity(0.82), size: 42),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            height: 7,
            width: 7,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileOption extends StatelessWidget {
  const ProfileOption({required this.icon, required this.label, super.key});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      leading: Icon(icon, color: blush),
      title: Text(label,
          style: const TextStyle(
              color: ink, fontSize: 13, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right_rounded, color: muted),
      onTap: () => showAppMessage(context, label),
    );
  }
}

void showAppMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: ink,
      ),
    );
}
