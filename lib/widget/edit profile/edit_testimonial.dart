import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ssen_company/services/theme/text_theme.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/constants.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_Strings.dart';
import '../../utils/constants/pop_up_dialog.dart';
import '../../utils/constants/size.dart';
import '../../utils/helper_function.dart';
import '../../utils/utils.dart';

// this class is used for displaying the widget of testimonial widget
class EditTestimonial extends StatelessWidget {
  final String title;
  const EditTestimonial({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  EditAddTestimonial()), // Replace ShareholderDetailPage() with your actual detail page
        );
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: dark ? SColors.darkContainer : SColors.lightContainer,
          // borderRadius: BorderRadius.circular(14),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
              width: 1,
              color: dark
                  ? Colors.black
                  : SColors.darkeGery), // Adjust border properties as needed
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "  $title",
              style: dark
                  ? STextTheme.darkTextTheme.titleLarge
                  : STextTheme.lightTextTheme.titleLarge,
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 25,
            )
          ],
        ),
      ),
    );
  }
}

class EditAddTestimonial extends StatefulWidget {
  const EditAddTestimonial({Key? key}) : super(key: key);

  @override
  State<EditAddTestimonial> createState() => _EditAddTestimonialState();
}

class _EditAddTestimonialState extends State<EditAddTestimonial> {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Testimonial',
            style: dark
                ? STextTheme.darkTextTheme.titleLarge
                : STextTheme.lightTextTheme.titleLarge,
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddTestimonial()), // Replace ShareholderDetailPage() with your actual detail page
                  );
                },
                child: Icon(
                  Icons.add,
                  size: 40,
                )),
            const SizedBox(
              width: 30,
            )
          ],
        ),
        body: VerticalScrollableTestimonial());
  }
}

class AddTestimonial extends StatefulWidget {
  const AddTestimonial({Key? key}) : super(key: key);

  @override
  State<AddTestimonial> createState() => _AddTestimonialState();
}

class _AddTestimonialState extends State<AddTestimonial> {
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
    print(im);
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
          ),
        ),
        body: SingleChildScrollView(
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
                  decoration: InputDecoration(hintText: 'Enter the authority'),
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
                        ElevatedButton(
                            onPressed: () {}, child: Text('Discard')),
                        ElevatedButton(onPressed: () {}, child: Text('Save')),
                      ],
                    )
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

class VerticalScrollableTestimonial extends StatelessWidget {
  final List<ScrollableItem> items = [
    ScrollableItem(
      image: SImages.empolyee1,
      title: 'Wubet Ayalew',
      authority: 'CEO',
      description:
          'If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. ',
    ),
    ScrollableItem(
      image: SImages.employee2,
      title: 'Birhan Mulugeta',
      authority: 'CEO',
      description:
          'If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. ',
    ),
    ScrollableItem(
      image: SImages.employee3,
      title: 'Director ',
      authority: 'CEO',
      description:
          'If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. ',
    ),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        children: items.map((item) => ScrollableListItem(item: item)).toList(),
      ),
    );
  }
}

class ScrollableItem {
  final String image;
  final String title;
  final String description;
  final String authority;

  ScrollableItem(
      {required this.image,
      required this.title,
      required this.description,
      required this.authority});
}

class ScrollableListItem extends StatelessWidget {
  final ScrollableItem item;

  ScrollableListItem({required this.item});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      width: double.infinity, // Expand container to full width
      margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: SColors.primaryColor,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(item.image),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: dark
                          ? STextTheme.darkTextTheme.headlineSmall
                          : STextTheme.lightTextTheme.headlineSmall,
                    ),
                    Text(
                      item.authority,
                      style: dark
                          ? STextTheme.darkTextTheme.titleMedium
                          : STextTheme.lightTextTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.description,
            style: dark
                ? STextTheme.darkTextTheme.bodySmall
                : STextTheme.lightTextTheme.bodySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ), // Icon to display
                onPressed: () {
                  // showWarningDialog(context,'Are You Sure to delete');
                },
              ),
              Icon(
                Icons.edit,
                color: Colors.green,
              ),
            ],
          )
        ],
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
