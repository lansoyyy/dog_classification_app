import 'package:dog_classification_app/screens/home_screen.dart';
import 'package:dog_classification_app/widgets/button_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/text_widget.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

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
              text: 'Disease: Golden Retriever',
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
                    'Advice: Proident cillum mollit proident eiusmod minim ad duis eiusmod nisi pariatur Lorem qui. Laborum minim proident et ad. Cupidatat anim velit eiusmod aute ea non adipisicing sunt consequat ut. Irure ex consequat veniam do elit pariatur fugiat.',
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
              label: 'Back to Home',
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
