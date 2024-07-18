import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm/login.dart';

class Animationboot extends StatefulWidget {
  const Animationboot({super.key});

  @override
  State<Animationboot> createState() => _AnimationbootState();
}

class _AnimationbootState extends State<Animationboot> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Have you READ for  today? ',
              style: GoogleFonts.bungee(color: Colors.white, fontSize: 60),
            ),
            Expanded(
              child: Stack(
                children: [
                  Icon(
                    Icons.menu_book_sharp,
                    color: Colors.white,
                    size: 500,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
