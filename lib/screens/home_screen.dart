import 'package:dog_classification_app/screens/auth/login_screen.dart';
import 'package:dog_classification_app/screens/breed_screen.dart';
import 'package:dog_classification_app/screens/details_screen.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              logout(context, const LoginScreen());
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
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
          content: TextWidget(
            align: TextAlign.start,
            maxLines: 15,
            text:
                'Laboris tempor commodo tempor nulla veniam labore irure adipisicing. Eu eu commodo fugiat non qui. Non proident sit ad adipisicing cillum cillum consequat elit laboris aute veniam sint consequat.',
            fontSize: 14,
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
