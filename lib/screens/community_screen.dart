import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';

class CommunityContent extends StatelessWidget {
  const CommunityContent({super.key});

  @override
  Widget build(BuildContext context) {
    const posts = [
      (
        'Mia Roberts',
        'My Sunday skincare routine ✨',
        homePortraitImage,
      ),
      (
        'Sofia Lee',
        'A little glow for the weekend 🌸',
        brushProductImage,
      ),
    ];
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 22),
      children: [
        const TopBar(),
        const SizedBox(height: 24),
        const Text('Community',
            style: TextStyle(
                color: ink, fontSize: 22, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        const Text('Beauty is better when we share it',
            style: TextStyle(color: muted, fontSize: 12)),
        const SizedBox(height: 18),
        Container(
          decoration: BoxDecoration(
            color: blushLight,
            borderRadius: BorderRadius.circular(17),
          ),
          padding: const EdgeInsets.all(16),
          child: const Row(
            children: [
              Icon(Icons.favorite_rounded, color: blush, size: 22),
              SizedBox(width: 12),
              Expanded(
                child: Text('Share your beauty moments with the community',
                    style: TextStyle(
                        color: ink, fontSize: 12, fontWeight: FontWeight.w500)),
              ),
              Icon(Icons.add_circle_rounded, color: blush, size: 25),
            ],
          ),
        ),
        const SizedBox(height: 19),
        ...posts.map((post) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFF2EAEC)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(13),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 17,
                            backgroundColor: blushLight,
                            child: Icon(Icons.person, color: blush, size: 19),
                          ),
                          const SizedBox(width: 9),
                          Expanded(
                            child: Text(post.$1,
                                style: const TextStyle(
                                    color: ink,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600)),
                          ),
                          const Icon(Icons.more_horiz, color: muted),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 185,
                      width: double.infinity,
                      child: BeautyImage(assetPath: post.$3, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 11, 14, 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.favorite_border_rounded,
                                  color: blush, size: 20),
                              SizedBox(width: 13),
                              Icon(Icons.chat_bubble_outline_rounded,
                                  color: muted, size: 19),
                              SizedBox(width: 13),
                              Icon(Icons.send_outlined, color: muted, size: 18),
                            ],
                          ),
                          const SizedBox(height: 9),
                          Text(post.$2,
                              style: const TextStyle(
                                  color: ink,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
