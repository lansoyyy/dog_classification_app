// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dog_classification_app/screens/auth/login_screen.dart';
// import 'package:dog_classification_app/utils/colors.dart';
// import 'package:dog_classification_app/utils/const.dart';
// import 'package:dog_classification_app/widgets/button_widget.dart';
// import 'package:dog_classification_app/widgets/logout_widget.dart';
// import 'package:dog_classification_app/widgets/text_widget.dart';
// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         backgroundColor: primary,
//         title: TextWidget(
//           text: 'Profile',
//           fontSize: 18,
//           color: Colors.white,
//         ),
//         centerTitle: true,
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection('Users')
//               .doc(userId)
//               .snapshots(),
//           builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//             if (!snapshot.hasData) {
//               return const Center(child: Text('Loading'));
//             } else if (snapshot.hasError) {
//               return const Center(child: Text('Something went wrong'));
//             } else if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             dynamic data = snapshot.data;

//             return Center(
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   const Icon(
//                     Icons.account_circle,
//                     size: 150,
//                     color: secondary,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   TextWidget(
//                     text: 'Name',
//                     fontSize: 14,
//                     fontFamily: 'Regular',
//                     color: Colors.grey,
//                   ),
//                   TextWidget(
//                     text: data['name'],
//                     fontSize: 24,
//                     fontFamily: 'Bold',
//                     color: Colors.black,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   TextWidget(
//                     text: 'Email',
//                     fontSize: 14,
//                     fontFamily: 'Regular',
//                     color: Colors.grey,
//                   ),
//                   TextWidget(
//                     text: data['email'],
//                     fontSize: 24,
//                     fontFamily: 'Bold',
//                     color: Colors.black,
//                   ),
//                   const SizedBox(
//                     height: 75,
//                   ),
//                   ButtonWidget(
//                     radius: 20,
//                     height: 75,
//                     label: 'Logout',
//                     onPressed: () {
//                       logout(context, const LoginScreen());
//                     },
//                   ),
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }
