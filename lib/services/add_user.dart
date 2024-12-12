import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_classification_app/utils/const.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addUser(name, email, number) async {
  final docUser = FirebaseFirestore.instance.collection('Users').doc();

  final json = {
    'name': name,
    'number': number,
    'email': email,
    'id': docUser.id,
    'isVerified': false,
    'favs': [],
    'profile': '',
  };

  await docUser.set(json);
}
