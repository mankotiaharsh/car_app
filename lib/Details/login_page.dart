import 'package:car_app/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:awesome_dialog/awesome_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void loginShowMyDialog() {
    AwesomeDialog(
      context: context,
      title: "Login Done Successfully!",
      desc: "Click on ok to go further",
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      btnOkOnPress: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomePageScreen()));
      },
    ).show();
  }

  void usernameShowMyDialog() {
    AwesomeDialog(
      context: context,
      title: "Error!",
      desc: "Please enter your username.",
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
    ).show();
  }

  void passwordShowMyDialog() {
    AwesomeDialog(
      context: context,
      title: "Error!",
      desc: "Please enter your password.",
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
    ).show();
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Log In Page")),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: 250,
                width: 300,
                child: Image.asset(
                  'assets/images/lgg.jpg',
                  fit: BoxFit.cover,
                )),
          ),
          const Text(
            "Login to account",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                  hintText: 'Username or email',
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock_outlined),
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2))),
            ),
          ),
          Center(
              child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.95,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black),
                onPressed: () {
                  if (usernameController.text.isEmpty) {
                    usernameShowMyDialog();
                  } else if (passwordController.text.isEmpty) {
                    passwordShowMyDialog();
                  } else {
                    loginShowMyDialog();
                  }
                },
                child: const Text(
                  "Log In",
                  style: TextStyle(fontSize: 20),
                )),
          )),
        ])));
  }
}
