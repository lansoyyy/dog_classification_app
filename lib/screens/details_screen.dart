import 'dart:io';

import 'package:dog_classification_app/data/disease_data.dart';
import 'package:dog_classification_app/screens/result_screen.dart';
import 'package:dog_classification_app/services/add_history.dart';
import 'package:dog_classification_app/widgets/button_widget.dart';
import 'package:dog_classification_app/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

import '../utils/colors.dart';
import '../widgets/text_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late String output = '';

  late File pickedImage;

  bool isImageLoaded = false;

  late List result;

  late String accuracy = '';

  late String name = '';

  late String numbers = '';

  getImageCamera(String imgsrc) async {
    setState(() {
      hasLoaded = false;
    });
    var tempStore = await ImagePicker().pickImage(
      source: imgsrc == 'camera' ? ImageSource.camera : ImageSource.gallery,
    );

    setState(() {
      pickedImage = File(tempStore!.path);
      isImageLoaded = true;
      applyModel(File(tempStore.path));
      hasLoaded = true;
    });
  }

  List works = [];

  loadmodel() async {
    try {
      await Tflite.loadModel(
        model: "assets/model/model_unquant.tflite",
        labels: "assets/model/labels.txt",
      );
    } catch (e) {
      print('error $e');
    }

    // works = jsonDecode(await rootBundle.loadString('assets/data/main.json'));

    setState(() {
      hasLoaded = true;
    });
  }

  String str = '';

  applyModel(File file) async {
    var res = await Tflite.runModelOnImage(
        path: file.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true);
    setState(() {
      result = res!;

      str = result[0]['label'].toString().split(' ')[0];
    });

    if (result[0]['confidence'] > 0.90) {
      addHistory(
          diseaseData[int.parse(str)]['name'],
          diseaseData[int.parse(str)]['treatment'],
          diseaseData[int.parse(str)]['daysOfTreatment']);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ResultScreen(
                index: int.parse(str),
                file: pickedImage,
              )));
    } else {
      showToast('This is not a dog!');
    }
  }

  bool hasLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadmodel();
  }

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
                  getImageCamera('camera');
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
                  getImageCamera('galllery');
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
}
