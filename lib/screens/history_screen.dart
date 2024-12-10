import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_classification_app/screens/home_screen.dart';
import 'package:dog_classification_app/utils/colors.dart';
import 'package:dog_classification_app/widgets/button_widget.dart';
import 'package:dog_classification_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: primary,
        title: TextWidget(
          text: 'History',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('History')
              .orderBy('dateTime', descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return const Center(child: Text('Error'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                )),
              );
            }

            final data = snapshot.requireData;
            return ListView.builder(
              itemCount: data.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ResultHistoryScreen(
                              data: data.docs[index],
                            )));
                  },
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Scanned: ${data.docs[index]['name']}',
                        fontSize: 18,
                        fontFamily: 'Bold',
                      ),
                      TextWidget(
                        text: DateFormat.yMMMd()
                            .add_jm()
                            .format(data.docs[index]['dateTime'].toDate()),
                        fontSize: 12,
                        fontFamily: 'Medium',
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right_outlined,
                  ),
                );
              },
            );
          }),
    );
  }
}

class ResultHistoryScreen extends StatefulWidget {
  dynamic data;
  ResultHistoryScreen({
    super.key,
    required this.data,
  });

  @override
  State<ResultHistoryScreen> createState() => _ResultHistoryScreenState();
}

class _ResultHistoryScreenState extends State<ResultHistoryScreen> {
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
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'Result: ${widget.data['name']}',
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
                  text: 'Treatment: ${widget.data['treatment']}',
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'Medium',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextWidget(
                  maxLines: 20,
                  text: 'Days: ${widget.data['days']}',
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
