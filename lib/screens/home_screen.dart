import 'package:dog_classification_app/screens/auth/login_screen.dart';
import 'package:dog_classification_app/screens/breed_screen.dart';
import 'package:dog_classification_app/screens/details_screen.dart';
import 'package:dog_classification_app/screens/history_screen.dart';
import 'package:dog_classification_app/screens/profile_screen.dart';
import 'package:dog_classification_app/widgets/button_widget.dart';
import 'package:dog_classification_app/widgets/logout_widget.dart';
import 'package:dog_classification_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: TextWidget(
          text: 'Home',
          fontSize: 18,
          color: Colors.white,
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       logout(context, const LoginScreen());
        //     },
        //     icon: const Icon(
        //       Icons.logout,
        //       color: Colors.white,
        //     ),
        //   ),
        // ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // Logo Placeholder
              Image.asset(
                logo,
                height: 200,
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonWidget(
                radius: 20,
                height: 75,
                label: 'Aspin',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DetailsScreen()));
                },
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              // ButtonWidget(
              //   radius: 20,
              //   height: 75,
              //   label: 'Profile',
              //   onPressed: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => const ProfileScreen()));
              //   },
              // ),
              const SizedBox(
                height: 30,
              ),
              ButtonWidget(
                radius: 20,
                height: 75,
                label: 'History',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HistoryScreen()));
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonWidget(
                radius: 20,
                height: 75,
                label: 'Help',
                onPressed: () {
                  showHelp();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  showHelp() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: TextWidget(
            text: 'How to Use PetSkin',
            fontSize: 18,
            fontFamily: 'Bold',
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextWidget(
                  align: TextAlign.start,
                  maxLines: 50,
                  text: '''
          Welcome to PetSkin! To get started, you can either take a photo of your dog's skin condition using your device's camera or upload an existing image from your gallery. Make sure that the photo is clear and focuses on the affected area to ensure an accurate diagnosis. Once the image is uploaded, PetSkin will analyze it and identify the potential skin disease affecting your pet. The result will provide the name of the condition, a brief description, and care suggestions. If you’re not satisfied with the result, you can upload a new image for further analysis.
          
          In addition to the diagnosis feature, PetSkin offers sign-up and login functionalities for enhanced features. By creating an account, you can save your pet’s diagnoses, track the progress of skin conditions over time, and receive notifications about new treatments or tips. To sign up, simply click the Sign Up button and fill in the necessary information, such as your email and password. Don’t forget to verify your email to complete the registration. If you already have an account, use the Login screen to enter your email and password. In case you forget your password, you can reset it by clicking on Forgot Password.
          
          For the best results, we recommend taking the photo in good lighting, ensuring the skin area is clearly visible and not obstructed by fur. Avoid using blurry or unclear images to guarantee the most accurate diagnosis possible.
          ''',
                  fontSize: 14,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: TextWidget(
                text: 'Close',
                fontSize: 18,
              ),
            ),
          ],
        );
      },
    );
  }
}
