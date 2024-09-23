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
          text: 'Aspin',
          fontSize: 18,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/aspin.jfif',
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'Breed: Aspin',
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
                  maxLines: 10,
                  text:
                      'The Aspin, short for Asong Pinoy (Filipino Dog), is a native dog breed from the Philippines known for its mixed ancestry and versatility. Aspins are not a standardized breed with specific physical traits, but they are generally medium-sized, with short to medium coats that can come in a variety of colors, including brown, black, white, and brindle. They have a hardy and muscular build, well-suited for the tropical climate and outdoor living.',
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
              const SizedBox(
                height: 20,
              ),
            ],
          ),
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

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ResultScreen(
                file: _image!,
              )));
    }
  }
}
