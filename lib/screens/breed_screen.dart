import 'package:dog_classification_app/screens/details_screen.dart';
import 'package:dog_classification_app/screens/auth/login_screen.dart';
import 'package:dog_classification_app/widgets/button_widget.dart';
import 'package:dog_classification_app/widgets/logout_widget.dart';
import 'package:dog_classification_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/const.dart';

class BreedScreen extends StatefulWidget {
  const BreedScreen({super.key});

  @override
  State<BreedScreen> createState() => _BreedScreenState();
}

class _BreedScreenState extends State<BreedScreen> {
  final List<String> dogBreeds = [
    'Aspin',
  ];

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primary,
      ),
      body: Expanded(
          child: GridView.builder(
        itemCount: dogBreeds.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DetailsScreen()));
              },
              child: Card(
                color: Colors.white,
                elevation: 3,
                child: Center(
                  child: TextWidget(
                    text: dogBreeds[index],
                    fontSize: 32,
                    fontFamily: 'Bold',
                    color: primary,
                  ),
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
