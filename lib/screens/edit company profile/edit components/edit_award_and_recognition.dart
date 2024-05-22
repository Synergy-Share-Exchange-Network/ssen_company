import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:ssen_company/screens/partial%20screen/edit%20company%20detail/add_award_recognition.dart';

import '../../../utils/constants.dart';
import '../../../utils/constants/size.dart';

class EditAwardAndRecognition extends StatelessWidget {
  const EditAwardAndRecognition({super.key, required this.awardAndRecognition});
  static const route = "edit_award_and_recognition";
  final List<String> awardAndRecognition;

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
          'Edit Award and Recognition',
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
                                            "Add Award And Recognition",
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
                                        child: AddAwardRecognition(),
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
                            builder: (context) => const AddAwardRecognition()));
              },
              child: Text("Add Award or Recognition"),
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
                PhotoWidget(
                    image:
                        'https://firebasestorage.googleapis.com/v0/b/synergy-share-exchange-network.appspot.com/o/shareLicense%2FW2BRqNIa5Cf3blzEFhQ6s2XiaVm2%2Fimage%2Fdc5e1b00-ed70-1fd3-bf94-038f7860ca31%2FW2BRqNIa5Cf3blzEFhQ6s2XiaVm2?alt=media&token=697fbfdb-2bf0-45ed-a910-1824bca7996b',
                    action: () {},
                    delete: () {}),
                PhotoWidget(
                    image:
                        'https://firebasestorage.googleapis.com/v0/b/synergy-share-exchange-network.appspot.com/o/shareLicense%2FW2BRqNIa5Cf3blzEFhQ6s2XiaVm2%2Fimage%2Fdc5e1b00-ed70-1fd3-bf94-038f7860ca31%2FW2BRqNIa5Cf3blzEFhQ6s2XiaVm2?alt=media&token=697fbfdb-2bf0-45ed-a910-1824bca7996b',
                    action: () {},
                    delete: () {})
                // Your form fields for editing awards and recognitions can go here
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({
    Key? key,
    required this.image,
    required this.action,
    required this.delete,
  }) : super(key: key);

  final String image;
  final VoidCallback action;
  final VoidCallback delete;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: (MediaQuery.of(context).size.width > phoneSize) ? 400 : 225,
        width: (MediaQuery.of(context).size.width > phoneSize) ? 400 : 225,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Material(
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          PhotoView(
                            imageProvider: NetworkImage(image),
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                // height: 250,
                // width: 200,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(image)),
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.all(8),
            //   width: 150,
            //   height: 30,
            //   decoration: BoxDecoration(
            //       color: (!isAbsent)
            //           ? const Color.fromARGB(134, 76, 175, 79)
            //           : Colors.red,
            //       borderRadius: const BorderRadius.all(Radius.circular(20))),
            //   child: Center(
            //     child: Text(
            //       (isAbsent) ? 'Absent' : clockText,
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            // )
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: action, child: Text("Change Image")),
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Change this to the desired color
                      ),
                      onPressed: action,
                      child: Text(" Delete Image ")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
