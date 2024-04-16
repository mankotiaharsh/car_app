import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:car_app/Details/login_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NgoSignInScreen extends StatefulWidget {
  const NgoSignInScreen({super.key});

  @override
  State<NgoSignInScreen> createState() => _NgoSignInScreenState();
}

class _NgoSignInScreenState extends State<NgoSignInScreen> {
  TextEditingController ngo_name = TextEditingController();
  TextEditingController ngo_owner = TextEditingController();
  TextEditingController ngo_location = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  Future<void> saveData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("Owner name", ngo_owner.text);
  }

  void signInShowMyDialog() {
    AwesomeDialog(
      context: context,
      title: "Account Created Successfully!",
      desc: "Please log in to activate account.",
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      btnOkOnPress: () {
        uploadAdminData();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      },
    ).show();
  }

  void nameShowMyDialog() {
    AwesomeDialog(
      context: context,
      title: "Error!",
      desc: "Please enter Company name.",
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
    ).show();
  }

  void ownerShowMyDialog() {
    AwesomeDialog(
      context: context,
      title: "Error!",
      desc: "Please enter Owner name.",
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
    ).show();
  }

  void locationShowMyDialog() {
    AwesomeDialog(
      context: context,
      title: "Error!",
      desc: "Please enter Shop Address.",
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

  void confirmPasswordShowMyDialog() {
    AwesomeDialog(
      context: context,
      title: "Error!",
      desc: "Please enter your password again.",
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
    ).show();
  }

  void notConfirmedDialog() {
    AwesomeDialog(
      context: context,
      title: "Error!",
      desc: "Passwords do not match.",
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Sign IN"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 180,
                  width: 300,
                  child: Image.asset(
                    'assets/images/amm.jpg',
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
                controller: ngo_name,
                decoration: const InputDecoration(
                    hintText: 'E.g.: Mankotia Rides',
                    prefixIcon: Icon(Icons.monetization_on_sharp),
                    labelText: 'Company name',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ngo_owner,
                decoration: const InputDecoration(
                    hintText: 'E.g.: ABC',
                    prefixIcon: Icon(Icons.location_history_rounded),
                    labelText: 'Owner name',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ngo_location,
                decoration: const InputDecoration(
                    hintText: 'E.g.: Jalandhar, Punjab ',
                    prefixIcon: Icon(Icons.location_pin),
                    labelText: 'Address',
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
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: 'Confirm Password',
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
                child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                      saveData();
                      print("Sign In Tapped!");
                      if (ngo_name.text.isEmpty) {
                        nameShowMyDialog();
                      } else if (ngo_owner.text.isEmpty) {
                        ownerShowMyDialog();
                      } else if (ngo_location.text.isEmpty) {
                        locationShowMyDialog();
                      } else if (emailController.text.isEmpty) {
                        emailShowMyDialog();
                      } else if (passwordController.text.isEmpty) {
                        passwordShowMyDialog();
                      } else if (confirmPasswordController.text.isEmpty) {
                        confirmPasswordShowMyDialog();
                      } else if (passwordController.text !=
                          confirmPasswordController.text) {
                        notConfirmedDialog();
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
              ),
            )),
          ],
        ),
      ),
    );
  }

  void uploadAdminData() async {
    try {
      Map<String, dynamic> data = {
        "Company_Name": ngo_name.text,
        "Owner_Name": ngo_owner.text,
        "Address": ngo_location.text,
        "Email": emailController.text,
        "Password": passwordController.text,
        "Mobile_number": phoneNumberController.text.toString()
      };
      dbRef.child("Admin_Details").push().set(data).then((value) {
        Navigator.of(context).pop();
      }).onError((error, stackTrace) {
        print("error $error");
      });
    } on Exception catch (e) {
      print("Exception in uploadToFirestore: $e");
    }
  }
}
