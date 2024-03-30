import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:car_app/Details/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_database/firebase_database.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  void signInShowMyDialog() {
    AwesomeDialog(
      context: context,
      title: "Account Created Successfully!",
      desc: "Please log in to activate account.",
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      btnOkOnPress: () {
        uploadCustomerData();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      },
    ).show();
  }

  void phoneShowMyDialog() {
    AwesomeDialog(
      context: context,
      title: "Error!",
      desc: "Please enter your phone number.",
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
    ).show();
  }

  void emailShowMyDialog() {
    AwesomeDialog(
      context: context,
      title: "Error!",
      desc: "Please enter your email.",
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

  void firstNameShowMyDialog() {
    AwesomeDialog(
      context: context,
      title: "Error!",
      desc: "Please enter your firstname.",
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
    ).show();
  }

  void LastNameShowMyDialog() {
    AwesomeDialog(
      context: context,
      title: "Error!",
      desc: "Please enter your Lastname.",
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
    ).show();
  }

  TextEditingController FirstnameController = TextEditingController();
  TextEditingController LastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign In")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 180,
                  width: 300,
                  child: Image.asset(
                    'assets/images/si2.jpg',
                    fit: BoxFit.cover,
                  )),
            ),
            const Text(
              "Create Account",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: FirstnameController,
                decoration: const InputDecoration(
                    hintText: 'Firstname',
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Firstname',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: LastnameController,
                decoration: const InputDecoration(
                    hintText: 'Lastname',
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Lastname',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'Eg: abc@gmail.com',
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: phoneNumberController,
                decoration: const InputDecoration(
                    hintText: 'Phone number',
                    prefixIcon: Icon(Icons.phone),
                    labelText: 'Phone number',
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
                    print("Sign In Tapped!");
                    if (FirstnameController.text.isEmpty) {
                      firstNameShowMyDialog();
                    } else if (LastnameController.text.isEmpty) {
                      LastNameShowMyDialog();
                    } else if (emailController.text.isEmpty) {
                      emailShowMyDialog();
                    } else if (passwordController.text.isEmpty) {
                      passwordShowMyDialog();
                    } else if (phoneNumberController.text.isEmpty) {
                      phoneShowMyDialog();
                    } else {
                      signInShowMyDialog();
                    }
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20),
                  )),
            )),
          ],
        ),
      ),
    );
  }

  void uploadCustomerData() async {
    try {
      Map<String, dynamic> data = {
        "First_Name": FirstnameController.text,
        "Last_Name": LastnameController.text,
        "Email": emailController.text,
        "Password": passwordController.text,
        "Mobile_number": phoneNumberController.text.toString()
      };
      dbRef.child("Customer_Details").push().set(data).then((value) {
        Navigator.of(context).pop();
      }).onError((error, stackTrace) {
        print("error $error");
      });
    } on Exception catch (e) {
      print("Exception in uploadToFirestore: $e");
    }
  }
}
