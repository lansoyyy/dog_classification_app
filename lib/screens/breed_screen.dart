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
    'Golden Retriever',
    'German Shepherd',
    'Bulldog',
    'Poodle',
    'Labrador Retriever',
    'Beagle',
    'Chihuahua',
    'Siberian Husky',
    'Dachshund',
    'Shih Tzu',
  ];

  final searchController = TextEditingController();
  String nameSearched = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primary,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Regular',
                        fontSize: 14),
                    onChanged: (value) {
                      setState(() {
                        nameSearched = value;
                      });
                    },
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        hintText: 'Search Breed',
                        hintStyle:
                            TextStyle(fontFamily: 'Regular', fontSize: 18),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        )),
                    controller: searchController,
                  ),
                ),
              ),
            ),
            Expanded(
                child: GridView.builder(
              itemCount: dogBreeds.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
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
                          fontSize: 18,
                          fontFamily: 'Bold',
                          color: primary,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
