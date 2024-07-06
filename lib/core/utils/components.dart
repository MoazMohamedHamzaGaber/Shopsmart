import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shimmer/shimmer.dart';

AppBar buildAppBar({
  required String image,
  required String text,
  bool action = false,
   required Function delete,
}) =>
    AppBar(
      title: Row(
        children: [
          Image.asset(
            image,
            height: 40,
          ),
          const SizedBox(
            width: 5,
          ),
          Shimmer.fromColors(
            period: const Duration(seconds: 15),
            baseColor: Colors.purple,
            highlightColor: Colors.red,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      actions: [
        action
            ? MaterialButton(
          onPressed: () {
            delete();
          },
          child: const Icon(Icons.delete_forever),
        )
            : Container(),
      ],
    );

AppBar appBar({
  context,
  String? text,
  IconData? iconData,
  bool centerTitle = false,
}) =>
    AppBar(
      centerTitle: centerTitle,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          IconlyLight.arrowLeft2,
        ),
      ),
      title: Shimmer.fromColors(
        period: const Duration(seconds: 15),
        baseColor: Colors.purple,
        highlightColor: Colors.red,
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconData,
            color: Colors.red,
          ),
        ),
      ],
    );

// Widget buildTextField({
//   context,
//   required TextEditingController controller,
//   required String title,
//   required IconData prefixIcon,
//   IconData? suffixIcon,
//   Function? suffixFunction,
//   required TextInputType keyboardType,
//   bool obscureText = false,
//   String? validate,
// }) =>
//     SizedBox(
//       height: 50,
//       child: TextFormField(
//         cursorColor: Colors.transparent,
//         keyboardType: keyboardType,
//         obscureText: obscureText,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return validate;
//           }
//         },
//         style: TextStyle(
//           color: ProfileCubit
//               .get(context)
//               .isDark ? Colors.white : Colors.black,
//         ),
//         controller: controller,
//         decoration: InputDecoration(
//           filled: true,
//           hintText: title,
//           hintStyle: const TextStyle(
//             color: Colors.grey,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide.none,
//           ),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(
//                   color: ProfileCubit
//                       .get(context)
//                       .isDark
//                       ? Colors.white
//                       : Colors.black,
//                   width: 1)),
//           prefixIcon: Icon(
//             prefixIcon,
//             color: Colors.grey,
//           ),
//           suffixIcon: IconButton(
//             onPressed: () {
//               suffixFunction!();
//             },
//             icon: Icon(suffixIcon),
//             //color: Colors.red,
//           ),
//         ),
//       ),
//     );
//
// Widget buildMaterialButton({
//   required String text,
//   required Function function,
//   double height = 50,
//   double fontSize = 19,
//   bool google = false,
// }) =>
//     Container(
//       width: double.infinity,
//       height: height,
//       decoration: BoxDecoration(
//           color: Colors.grey[300], borderRadius: BorderRadius.circular(12)),
//       child: MaterialButton(
//         onPressed: () {
//           function();
//         },
//         child: google
//             ? Row(
//           children: [
//             const Icon(
//               Ionicons.logo_google,
//               color: Colors.red,
//             ),
//             const SizedBox(
//               width: 3,
//             ),
//             Expanded(
//               child: Text(
//                 text,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(fontSize: fontSize, color: Colors.black),
//               ),
//             ),
//           ],
//         )
//             : Text(
//           text,
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(fontSize: fontSize, color: Colors.black),
//         ),
//       ),
//     );

// Widget myHeart({
//   double size = 18,
//   IconData iconData = IconlyLight.heart,
//   Color? color,
//   required Function function,
//   Color backgroundColor = Colors.transparent,
//   bool circle = false,
// }) {
//   return Material(
//     color: circle ? backgroundColor : Colors.transparent,
//     shape: const CircleBorder(),
//     child: circle
//         ? IconButton(
//       onPressed: () {},
//       icon: Icon(
//         iconData,
//         size: size,
//         color: color,
//       ),
//     )
//         : Icon(
//       iconData,
//       size: size,
//       color: color,
//     ),
//   );
// }

// Widget buildItem(final products, context, ProductModel model)  {
//   Size size = MediaQuery
//       .of(context)
//       .size;
//   User? user = FirebaseAuth.instance.currentUser;
//   return BlocConsumer<CartCubit, CartStates>(
//     listener: (BuildContext context, state) {
//       if (state is CreateCartSuccessStates) {
//         showToast(text: 'Product has been added into cart');
//       }
//     },
//     builder: (BuildContext context, Object? state) {
//       final cartId = const Uuid().v4();
//       return InkWell(
//         onTap: () {
//           navigateTo(
//               context,
//               DetailsView(
//                 image: model.productImage,
//                 title: model.productTitle,
//                 price: model.productPrice,
//                 category: model.productCategory,
//                 description: model.productDescription,
//               ));
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             color: ProfileCubit
//                 .get(context)
//                 .isDark
//                 ? Colors.white24
//                 : Colors.grey[300],
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image(
//                     image: NetworkImage(model.productImage),
//                     height: size.height * 0.18,
//                     width: size.width * 0.3,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         model.productTitle,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           //color: ProfileCubit.get(context).isDark?Colors.black:Colors.black
//                         ),
//                       ),
//                     ),
//                     const Spacer(),
//                     myHeart(size: 20, function: () {}),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       '\$${model.productPrice}',
//                       style: const TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const Spacer(),
//                     Container(
//                       width: 30,
//                       height: 30,
//                       decoration: BoxDecoration(
//                           color: Colors.lightBlue,
//                           borderRadius: BorderRadius.circular(12)),
//                       child: MaterialButton(
//                         padding: EdgeInsets.zero,
//                         onPressed:  () {
//                           // final cartId = const Uuid().v4();
//                           if(user !=null) {
//                               CartCubit().get(context).cartCreate(
//                               title: products['productTitle'],
//                               price: products['productPrice'],
//                               description:
//                               products['productDescription'],
//                               quantity: 1,
//                               productId: model.productId,
//                               category: products['productCategory'],
//                               image: products['productImage'],
//                               context: context,
//                               cartId: cartId,
//                             );
//                           }
//                           else if(user ==null){
//                             buildShowDialog(
//                               context: context,
//                               image: 'admin assets/assets/images/warning.png',
//                               name: 'Please login and continues',
//                               function: () {
//                                 Navigator.pop(context);
//                               },
//                             );
//                           }
//                           //CartCubit().get(context).checkIconStatus(cartId);
//                          // showToast(text: 'This is product already exit');
//                         },
//                         child: const Icon(
//                            Icons
//                               .add_shopping_cart,
//                           size: 18,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }

// Future<void> buildShowDialog({
//   context,
//   required String image,
//   required String name,
//   required Function function,
//   bool cancel = false,
// }) =>
//     showDialog(
//       context: context,
//       builder: (context) =>
//           AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             backgroundColor: Theme
//                 .of(context)
//                 .scaffoldBackgroundColor,
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(
//                   image,
//                   height: 60,
//                   width: 60,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(name),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 cancel
//                     ? Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text('Cancel'),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         function();
//                       },
//                       child: const Text('OK'),
//                     ),
//                   ],
//                 )
//                     : Center(
//                   child: TextButton(
//                     onPressed: () {
//                       function();
//                     },
//                     child: const Text('OK'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//     );

// void showToast({
//   required String text,
// }) =>
//     Fluttertoast.showToast(
//         msg: text,
//         toastLength: Toast.LENGTH_SHORT,
//         textColor: Colors.white,
//         fontSize: 16.0);
//
// Future buildShowLoading(context) async {
//   return await showDialog(
//       context: context,
//       builder: (context) {
//         return const AlertDialog(
//           title: Text('Please Wait'),
//           content: SizedBox(
//             height: 50,
//             child: Center(child: CircularProgressIndicator()),
//           ),
//         );
//       });
// }
