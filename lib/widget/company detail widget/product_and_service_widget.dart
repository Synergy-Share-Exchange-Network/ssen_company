import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_company/Models/product_and_service_model.dart';
import 'package:ssen_company/utils/constants/colors.dart';

import '../../utils/helper_function.dart';

class ProductServiceWidget extends StatelessWidget {
  final ProductModel productservice;
  const ProductServiceWidget({
    Key? key,
    required this.productservice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        // margin: EdgeInsets.all(8),
        // color: Colors.white,
        width: 400,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(productservice.image[0]))),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 7),
            width: 400,
            // height: 70,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 400,
                  child: Text(
                    productservice.description,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
