import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/size.dart';
import '../../utils/constants/text_string.dart';
import '../../utils/helper_function.dart';

class ShareHolderProfile extends StatelessWidget {
  const ShareHolderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          SText.profile,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                        image: AssetImage('asset/demo_image/demo1.JPG')),
                  ),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${SText.firstName}: Dawit Nigus ',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '${SText.shares} :1000',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
