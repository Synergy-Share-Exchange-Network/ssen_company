import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_company/services/theme/text_theme.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helper_function.dart';

class EditDescription extends StatelessWidget {
  final String title;
  const EditDescription({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    return GestureDetector(
            onTap:  (){
              showDialog(context: context, builder: (context)=>AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Spacer between icon and title
                Text(
                  title,
                  style: dark
                    ? STextTheme.darkTextTheme.bodyLarge
                    : STextTheme.lightTextTheme.bodyLarge,
                ),
                 // Cancel Icon
              
                Icon(Icons.cancel), 
              ],
            ),
              
                content: SizedBox(
                  height: 100,
                  child:TextFormField(
                    
                    minLines: 7,
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                  )
                ),
                actions: [
               Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                     ElevatedButton(onPressed:()=>Navigator.pop(context) , child: Text('cancel'),),
                     ElevatedButton(onPressed:()=>Navigator.pop(context) , child: Text('Submit'),),


                ],
               )
                  
                  
                ],
              ));
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
                    
                     Text("  $title",
                     style:dark? STextTheme.darkTextTheme.titleLarge :STextTheme.lightTextTheme.titleLarge,
                     ),
                     Icon(Icons.edit,
                      size: 25, 
                     )
                   ],
                 ),
                 
                 ),
           );
    
  }
}