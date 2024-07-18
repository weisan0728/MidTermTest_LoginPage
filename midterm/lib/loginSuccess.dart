import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm/login.dart';

class Loginsuccess extends StatefulWidget {
  final String email;
  const Loginsuccess({super.key, required this.email});

  @override
  State<Loginsuccess> createState() => _LoginsuccessState();
}

class _LoginsuccessState extends State<Loginsuccess> {
  void logout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login as: ${widget.email}',
            style: GoogleFonts.bonaNova(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              logout();
            },
            color: Colors.black,
            child: Text(
              'Logout',
              style: GoogleFonts.bonaNova(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      )),
    );
  }
}
