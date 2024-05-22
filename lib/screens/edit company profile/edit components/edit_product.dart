import 'package:flutter/material.dart';
import 'package:ssen_company/Models/product_and_service_model.dart';
import 'package:ssen_company/screens/partial%20screen/edit%20company%20detail/add_product.dart';
import 'package:ssen_company/utils/constants/image_Strings.dart';
import 'package:ssen_company/widget/company%20detail%20widget/product_and_service_widget.dart';

import '../../../utils/constants.dart';

class EditProduct extends StatelessWidget {
  const EditProduct({super.key, required this.product});
  static const route = "edit_product";
  final List<ProductModel> product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Edit Product',
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.blue,
            // fontSize: 27,
            // fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                (MediaQuery.of(context).size.width > phoneSize)
                    ? showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              actions: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  width: (MediaQuery.of(context).size.width >
                                          phoneSize)
                                      ? MediaQuery.of(context).size.width - 600
                                      : MediaQuery.of(context).size.width,
                                  height: (MediaQuery.of(context).size.width >
                                          phoneSize)
                                      ? MediaQuery.of(context).size.height - 150
                                      : MediaQuery.of(context).size.height -
                                          100,
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Add Key Figure",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 18),
                                          ),
                                          IconButton(
                                              onPressed: () => Navigator.of(
                                                      context,
                                                      rootNavigator: true)
                                                  .pop(),
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.red,
                                              ))
                                        ],
                                      ),
                                      const Expanded(
                                        child: AddProduct(),
                                        // child: AddKeyFigure(),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ))
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddProduct()));
              },
              child: Text("Add Product"),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditBankPreviousTestimonial(),
                EditBankPreviousTestimonial(),
                EditBankPreviousTestimonial(),
                EditBankPreviousTestimonial(),

                // Your form fields for editing bank account details can go here
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditBankPreviousTestimonial extends StatelessWidget {
  const EditBankPreviousTestimonial({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel x = ProductModel(
        image: [SImages.NIB1],
        description:
            'who they are, whatrelationship you havewith them and howwill you reach them.(Customerrelationships,Customer segments,Channels)');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ProductServiceWidget(productservice: x),
          Positioned(
            top: 15.0,
            right: 20.0,
            child: PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: ListTile(
                    title: Text('Edit'),
                    onTap: () {
                      // Handle Option 1
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: Text('Delete'),
                    onTap: () {
                      // Handle Option 2
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
