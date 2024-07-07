import 'package:flutter/material.dart';

// String? uid;
//
//
// Widget buildDivider()=>Container(
//   margin: const EdgeInsets.symmetric(
//       vertical: 10
//   ),
//   width: double.infinity,
//   height: 1,
//   color: Colors.grey[300],
// );

Future navigateTo(context,Widget)
{
  return Navigator.push(context, MaterialPageRoute(builder: (context)=>Widget));
}
// Future navigateAndFinish(context,Widget)
// {
//   return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Widget), (route) => false);
// }
//
// var passwordController = TextEditingController();
// var emailController = TextEditingController();
//
// var registerPasswordController = TextEditingController();
// var registerRepeatPasswordController = TextEditingController();
// var registerEmailController = TextEditingController();
// var registerNameController = TextEditingController();


