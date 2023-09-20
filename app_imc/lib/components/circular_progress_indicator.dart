import 'package:flutter/material.dart';

Widget circularProgressIndicator(BuildContext context, {Color? color}) {
  return Center(
    child: CircularProgressIndicator(color:color ??Colors.green),
  );
}

/*
 * Show icon circular for expect loading next step 
 * @author  SGV - 2020312
 * @version 1.0 - 2020312 - initial release
 * @return  <component> showDialog and redirect to previous page
 */
Future<void> showCircularLoadingDialog(BuildContext context ,{Color? color}) async {  
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () => Future.value(false),
        child: circularProgressIndicator(context, color:color)
      );
    }
  );
}