import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        padding: EdgeInsets.fromLTRB(
            20, MediaQuery.of(context).padding.top + 10, 20, 0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: InkWell(
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
                onTap: () => Navigator.pop(context),
              ),
            ),
            SizedBox(height: 40),
            Image.asset(
              'lib/assets/logo.png',
              width: 100,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 18),
            Text(
              'ListDown',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'ListDown mobile application is generally used to maintain your day-to-day tasks or list everything that we have to do, with the most important tasks at the top of the list, and the least important tasks at the bottom. It is helpful in planning your daily schedules.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 14),
            Text(
              'Developer: Sayan Saha',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
