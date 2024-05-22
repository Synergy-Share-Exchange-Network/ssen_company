import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_company/Models/key_figure_model.dart';

import '../../utils/constants/image_Strings.dart';

class PartnersWidget extends StatelessWidget {
  final String image;
  const PartnersWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(8.0),
      //   border: Border.all(color: Colors.black),
      // ),
      width: 150.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(
        radius: 50.0,
        backgroundImage: AssetImage(image),
      ),
    );
  }
}
