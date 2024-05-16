import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ssen_company/services/theme/text_theme.dart';

import '../../utils/constants.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_Strings.dart';
import '../../utils/constants/size.dart';
import '../../utils/helper_function.dart';
import '../../utils/utils.dart';


class AddAnnouncement extends StatefulWidget {
  const AddAnnouncement({Key? key}) : super(key: key);

  @override
  State<AddAnnouncement> createState() => _AddTestimonialState();
}

class _AddTestimonialState extends State<AddAnnouncement> {
   Uint8List? mainImage;
  List<Uint8List>? images;
  bool _isImageSelected = false;

  // void _selectImages() async {
  //   List<XFile> im = await ImagePicker().pickMultiImage();
  //   images = await convertXFileListToUint8ListList(im);
  //   _isImageSelected = true;
  //   if (images!.length == 0) {
  //     _isImageSelected = false;
  //   }
  //   setState(() {});
  // }

 void _selectMainImage() async {
  Uint8List? im = await pickImage(ImageSource.gallery);

  if (im != null) {
    setState(() {
      mainImage = im;
    });
  }
}

void _selectIndividualImage() async {
  Uint8List? im = await pickImage(ImageSource.gallery);
  if (im != null) {
    images!.add(im);
    setState(() {});
  }
}

  void _deleteMainImage() async {
    mainImage = null;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      body: Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Testimonial',
          style: dark
              ? STextTheme.darkTextTheme.titleLarge
              : STextTheme.lightTextTheme.titleLarge,
        ),),
        body: 
      SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'authority',
                                      style: dark
                                          ? STextTheme.darkTextTheme.bodyLarge
                                          : STextTheme.lightTextTheme.bodyLarge,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Enter the authority'),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Description',
                                      style: dark
                                          ? STextTheme.darkTextTheme.bodyLarge
                                          : STextTheme.lightTextTheme.bodyLarge,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      minLines: 7,
                                      maxLines: 10,
                                      keyboardType: TextInputType.multiline,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Add Image ',
                                      style: dark
                                          ? STextTheme.darkTextTheme.bodyLarge
                                          : STextTheme.lightTextTheme.bodyLarge,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        AddMainImage(
                                                // file: _images![0],
                                                file: mainImage,
                                                deleteCallback: () {
                                                  _deleteMainImage();
                                                },
                                                callback: () {
                                                  _selectMainImage();
                                                  // _selectImages();
                                                },
                                              ),
                                            
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                          
                                          ElevatedButton(onPressed: (){}, child: Text('Discard')),
                                          ElevatedButton(onPressed: (){}, child: Text('Save')),

                                        ],)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
      
      ),
    );
    
  }
}


class AddMainImage extends StatelessWidget {
  const AddMainImage({
    Key? key,
    required this.deleteCallback,
    required this.callback,
    this.file,
  }) : super(key: key);
  final VoidCallback deleteCallback;

  final VoidCallback callback;
  // final PlatformFile? file;
  final Uint8List? file;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Column(
        children: [
          Row(
            
            children: [
              Container(
                margin: const EdgeInsets.all(60),
                child: Column(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width > phoneSize)
                          ? 500
                          : MediaQuery.of(context).size.width - 150,
                      height: (MediaQuery.of(context).size.width > phoneSize)
                          ? 430
                          : MediaQuery.of(context).size.width - 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(34, 33, 149, 243), width: 2),
                        color: Colors.white,
                      ),
                      child: (file == null)
                          ? Container(
                             
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Center(
                                        child: Text(
                                          "Add Main Image",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Icon(
                                        Icons.add,
                                        color: Colors.blue,
                                        size: 30,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                // Image.file(
                                //   File(file!.path.toString()),
                                //   width: 400,
                                //   height: 430,
                                //   fit: BoxFit.cover,
                                // ),
                                Container(
                                  width: 900,
                                  height: 830,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: MemoryImage(file!))),
                                ),
                                IconButton(
                                    onPressed: deleteCallback,
                                    icon: const Icon(
                                      Icons.delete_outline_outlined,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddImage extends StatelessWidget {
  const AddImage({
    Key? key,
    required this.callback,
    this.file,
    required this.deleteCallback,
  }) : super(key: key);
  final VoidCallback callback;
  final VoidCallback deleteCallback;
  final Uint8List? file;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
          child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(6),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(34, 33, 149, 243)),
                        color: Colors.white,
                      ),
                      width: (MediaQuery.of(context).size.width > phoneSize)
                          ? 150
                          : 110,
                      height: (MediaQuery.of(context).size.width > phoneSize)
                          ? 150
                          : 110,
                      child: (file == null)
                          ? Container(
                              margin: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          "Add Image",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: (MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      phoneSize)
                                                  ? 17
                                                  : 13,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Icon(
                                        Icons.add,
                                        color: Colors.blue,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                // Image.file(
                                //   File(file!.path.toString()),
                                //   width: 150,
                                //   height: 130,
                                //   fit: BoxFit.cover,
                                // ),
                                Container(
                                  width: 150,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: MemoryImage(file!))),
                                ),
                                IconButton(
                                    onPressed: deleteCallback,
                                    icon: const Icon(
                                      Icons.delete_outline_outlined,
                                      color: Colors.red,
                                      size: 20,
                                    ))
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
