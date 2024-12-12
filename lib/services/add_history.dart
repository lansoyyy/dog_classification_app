import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_classification_app/utils/const.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addHistory(name, treatment, days) async {
  final docUser = FirebaseFirestore.instance.collection('History').doc();

  final json = {
    'name': name,
    'treatment': treatment,
    'days': days,
    'id': docUser.id,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}
