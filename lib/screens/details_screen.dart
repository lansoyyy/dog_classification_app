import 'dart:io';

import 'package:dog_classification_app/screens/result_screen.dart';
import 'package:dog_classification_app/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/colors.dart';
import '../widgets/text_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primary,
        title: TextWidget(
          text: 'Golden Retriever',
          fontSize: 18,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bg.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: 'Breed: Golden Retriever',
              fontSize: 18,
              color: Colors.black,
              fontFamily: 'Bold',
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextWidget(
                maxLines: 5,
                text:
                    'Proident cillum mollit proident eiusmod minim ad duis eiusmod nisi pariatur Lorem qui. Laborum minim proident et ad. Cupidatat anim velit eiusmod aute ea non adipisicing sunt consequat ut. Irure ex consequat veniam do elit pariatur fugiat.',
                fontSize: 14,
                color: Colors.grey,
                fontFamily: 'Medium',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ButtonWidget(
              radius: 20,
              height: 75,
              label: 'Capture',
              onPressed: () {
                _pickImage(ImageSource.camera);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              radius: 20,
              height: 75,
              label: 'Gallery',
              onPressed: () {
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  File? _image;
  // To store the picked image
  final ImagePicker _picker = ImagePicker();
  // Instance of ImagePicker
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ResultScreen()));
    }
  }
}
