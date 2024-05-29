import 'package:flutter/material.dart';
import 'package:ssen_company/Models/key_figure_model.dart';
import 'package:ssen_company/screens/partial%20screen/edit%20company%20detail/add_key_figure.dart';
import 'package:ssen_company/screens/partial%20screen/edit%20company%20detail/add_key_figure.dart';
import 'package:ssen_company/utils/constants/image_Strings.dart';
import 'package:ssen_company/widget/company%20detail%20widget/employees_widget.dart';

import '../../../utils/constants.dart';
import '../../partial screen/add_share.dart';

class EditKeyFigure extends StatelessWidget {
  const EditKeyFigure({super.key, required this.keyFigure});
  static const route = "edit_key_figure";
  final List<KeyFigureModel> keyFigure;

  @override
  Widget build(BuildContext context) {
    // KeyFigureModel x = KeyFigureModel(
    //     name: "Wubet", position: "CEO", image: [SImages.empolyee1]);
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
          'Edit Key Figure',
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
              onPressed: () async {
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
                                        child: AddKeyFigure(),
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
                            builder: (context) => const AddKeyFigure()));
              },
              child: Text("Add Key Figure"),
            ),
          )
        ],
      ),
      // body: SingleChildScrollView(
      //   child: Container(
      //     decoration: const BoxDecoration(),
      //     width: MediaQuery.of(context).size.width,
      //     child: Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           // Your form fields for editing key figures can go here
      //           EditKeyPreviousFigureWidget(x: x),
      //           EditKeyPreviousFigureWidget(x: x),
      //           EditKeyPreviousFigureWidget(x: x),
      //           EditKeyPreviousFigureWidget(x: x),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: (keyFigure != [])
          ? ListView.builder(
              itemCount: keyFigure.length,
              itemBuilder: (context, index) {
                return EditKeyPreviousFigureWidget(
                  keyFigure: keyFigure[index],
                );
              },
            )
          : Center(
              child: Text("No Key figures set"),
            ),
    );
  }
}

class EditKeyPreviousFigureWidget extends StatelessWidget {
  const EditKeyPreviousFigureWidget({
    Key? key,
    required this.keyFigure,
  }) : super(key: key);

  final KeyFigureModel keyFigure;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EmployeesWidget(keyfigure: keyFigure),
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
