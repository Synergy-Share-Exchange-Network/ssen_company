import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:iconsax/iconsax.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants/size.dart';
import '../../utils/helper_function.dart';

class SocialShareButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Social Medias",
              style: dark
                  ? STextTheme.darkTextTheme.headlineSmall
                  : STextTheme.lightTextTheme.headlineSmall,
            ),
          ),

const SizedBox(
            height: SSizes.iconXS,
          ),
          Row(
            children: [
              SocialShareButton(
                icon: Icons.facebook,
                onPressed: () => _shareOnFacebook(context),
              ),
              SocialShareButton(
                icon: Icons.whatsapp,
                

                onPressed: () => _shareOnTwitter(context),
              ),
              SocialShareButton(
                icon: Icons.telegram,
                onPressed: () => _shareOnLinkedIn(context),
              ),
              // Add more buttons as needed
            ],
          ),
        ],
      ),
    );
  }

  void _shareOnFacebook(BuildContext context) async {
    await FlutterShare.share(
      title: 'Share via Facebook',
      text: 'Your sharing message',
      linkUrl: 'https://your-link-url.com',
      chooserTitle: 'Share via',
    );
  }

  void _shareOnTwitter(BuildContext context) async {
    await FlutterShare.share(
      title: 'Share via Twitter',
      text: 'Your sharing message',
      linkUrl: 'https://your-link-url.com',
      chooserTitle: 'Share via',
    );
  }

  void _shareOnLinkedIn(BuildContext context) async {
    await FlutterShare.share(
      title: 'Share via LinkedIn',
      text: 'Your sharing message',
      linkUrl: 'https://your-link-url.com',
      chooserTitle: 'Share via',
    );
  }
}

class SocialShareButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const SocialShareButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}
