import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ssen_company/utils/constants.dart';

void showSuccessDialog(BuildContext context,String description) {
 AwesomeDialog(context: context,
 dialogType: DialogType.success,
 animType: AnimType.topSlide,
 showCloseIcon: true,
 title: 'success',
 desc:description,
 ).show();
}
void showWarningDialog(BuildContext context,  String description, ) {
  double dialogWidth = MediaQuery.of(context).size.width >phoneSize ? 600 : 300;
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.topSlide,
    showCloseIcon: true,
    width: dialogWidth,
    title: 'Warning',
    desc: description,
   btnOkText: 'Yes', // Change button text to "Yes"
    btnCancelText: 'No', 
    btnOkOnPress: () {},
    btnCancelOnPress: (){},
  ).show();
}

void showErrorDialog(BuildContext context,String description,) {
 AwesomeDialog(context: context,
 dialogType: DialogType.error,
 animType: AnimType.topSlide,
 showCloseIcon: true,
 title: 'Error',
 desc:description,

 btnOkOnPress: (){},

 ).show();
}
