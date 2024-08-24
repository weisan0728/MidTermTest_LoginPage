import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm/loginSuccess.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog('All fields are required');
    } else if (email == "user@gmail.com" && password == "user1") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Loginsuccess(email: email)),
      );
    } else if (email == "user@gmail.com" && password != "user1") {
      _showErrorDialog('Wrong password.');
    } else if (email != "user@gmail.com" && password == "user1") {
      _showErrorDialog('Wrong email.');
    } else {
      _showErrorDialog(
          'The login Email is user@gmail.com and Password is user1 for demonstration purpose.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[200],
          title: Text(
            'Error',
            style: GoogleFonts.bonaNova(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: GoogleFonts.roboto(color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: GoogleFonts.robotoMono(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "C:/Users/Cheong Wei San/Desktop/MidTermTest/midterm/lib/images/neucLogo.png",
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Welcome To NEUC Library',
                        style: GoogleFonts.bebasNeue(fontSize: 40)),
                    SizedBox(
                      height: 50,
                    ),

                    //email
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: Size(300, 60),
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.bonaNova(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),

                    SizedBox(
                      height: 25,
                    ),
                  ]),
            ),
          ),
        ));
  }
}
