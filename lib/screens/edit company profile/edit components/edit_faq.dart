import 'package:flutter/material.dart';
import 'package:ssen_company/Models/faq_model.dart';
import 'package:ssen_company/screens/partial%20screen/edit%20company%20detail/add_faq.dart';
import 'package:ssen_company/widget/company%20detail%20widget/faq_element_widget.dart';

import '../../../utils/constants.dart';

class EditFAQ extends StatelessWidget {
  const EditFAQ({super.key, required this.faq});
  static const route = "edit_faq";
  final List<FaqModel> faq;

  @override
  Widget build(BuildContext context) {
    // Faq/
    // );
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
          'Edit FAQ',
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
                                            "Add FAQ",
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
                                        child: AddFaq(),
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
                            builder: (context) => const AddFaq()));
              },
              child: Text("Add FAQ"),
            ),
          )
        ],
      ),
      body: (faq != [] || faq != [''])
          ? ListView.builder(
              itemCount: faq.length,
              itemBuilder: (context, index) {
                return EditPreviousFaqInformation(
                  faq: faq[index],
                );
              },
            )
          : Center(
              child: Text("No Key figures set"),
            ),
    );
  }
}

class EditPreviousFaqInformation extends StatelessWidget {
  const EditPreviousFaqInformation({
    Key? key,
    required this.faq,
  }) : super(key: key);

  final FaqModel faq;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaqElementWidget(faq: faq),
        Positioned(
          top: 8.0,
          right: 8.0,
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
    );
  }
}
