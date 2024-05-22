import 'package:flutter/material.dart';
import 'package:ssen_company/Models/faq_model.dart';
import 'package:ssen_company/widget/company%20detail%20widget/faq_element_widget.dart';

class EditFAQ extends StatelessWidget {
  const EditFAQ({super.key, required this.faq});
  static const route = "edit_faq";
  final List<FaqModel> faq;

  @override
  Widget build(BuildContext context) {
    FaqModel faq = FaqModel(
      identification: "778",
      title: "what are the main functions of stock market?",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      companyId: "",
    );
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
              onPressed: () {},
              child: Text("Add FAQ"),
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
                EditPreviousFaqInformation(faq: faq),
                EditPreviousFaqInformation(faq: faq),
                EditPreviousFaqInformation(faq: faq),
                EditPreviousFaqInformation(faq: faq),
                EditPreviousFaqInformation(faq: faq),

                // Your form fields for editing FAQ can go here
              ],
            ),
          ),
        ),
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
