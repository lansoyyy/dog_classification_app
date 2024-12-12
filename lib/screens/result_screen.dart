import 'dart:io';

import 'package:dog_classification_app/data/disease_data.dart';
import 'package:dog_classification_app/screens/home_screen.dart';
import 'package:dog_classification_app/widgets/button_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/text_widget.dart';

class ResultScreen extends StatefulWidget {
  File file;
  int index;

  ResultScreen({
    super.key,
    required this.file,
    required this.index,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primary,
        title: TextWidget(
          text: 'Result',
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(widget.file), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'Result: ${diseaseData[widget.index]['name']}',
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
                  maxLines: 20,
                  text: 'Treatment: ${diseaseData[widget.index]['treatment']}',
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'Bold',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextWidget(
                  maxLines: 20,
                  text: 'Days: ${diseaseData[widget.index]['daysOfTreatment']}',
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'Bold',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextWidget(
                  maxLines: 2,
                  text: 'Advice: ${diseaseData[widget.index]['advice']}',
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: 'Medium',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonWidget(
                radius: 20,
                height: 75,
                label: 'Back to Home',
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
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
