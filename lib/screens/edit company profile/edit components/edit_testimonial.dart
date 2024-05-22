import 'package:flutter/material.dart';
import 'package:ssen_company/screens/partial%20screen/edit%20company%20detail/add_testimonial.dart';
import 'package:ssen_company/widget/company%20detail%20widget/bank_account.dart';
import 'package:ssen_company/widget/edit%20profile/edit_testimonial.dart';

import '../../../Models/testimonial_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/constants/image_Strings.dart';
import '../../../widget/company detail widget/testimonial_widget.dart';

class EditTestimonial extends StatelessWidget {
  const EditTestimonial({super.key, required this.testmonyies});
  static const route = "edit_testimonial";
  final List<TestimonialModel> testmonyies;

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
          'Edit Testimonial',
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
                                            "Add Testimony",
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
                                        child: AddTestimony(),
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
                            builder: (context) => const AddTestimony()));
              },
              child: Text("Add Testimonial"),
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
    TestimonialModel test = TestimonialModel(
        name: 'Wubet',
        position: "CEO",
        image: [SImages.empolyee1],
        testimony:
            'who they are, whatrelationship you havewith them and howwill you reach them.(Customerrelationships,Customer segments,Channels');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          TestimonialWidget(
            testimonial: test,
          ),
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
