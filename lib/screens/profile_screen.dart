import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(22),
      children: const [
        TopBar(),
        SizedBox(height: 34),
        CircleAvatar(
          radius: 42,
          backgroundColor: blushLight,
          child: Icon(Icons.person_rounded, color: blush, size: 45),
        ),
        SizedBox(height: 13),
        Text('Natalia Bueno',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ink, fontSize: 19, fontWeight: FontWeight.w600)),
        SizedBox(height: 5),
        Text('natalia@email.com',
            textAlign: TextAlign.center,
            style: TextStyle(color: muted, fontSize: 12)),
        SizedBox(height: 28),
        ProfileOption(icon: Icons.favorite_border, label: 'My favorites'),
        ProfileOption(
            icon: Icons.shopping_bag_outlined, label: 'Orders and returns'),
        ProfileOption(
            icon: Icons.notifications_none_rounded, label: 'Notifications'),
        ProfileOption(icon: Icons.settings_outlined, label: 'Settings'),
      ],
    );
  }
}
