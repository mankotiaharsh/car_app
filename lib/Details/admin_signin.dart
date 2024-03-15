import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:car_app/Details/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class NgoSignInScreen extends StatefulWidget {
  const NgoSignInScreen({super.key});

  @override
  State<NgoSignInScreen> createState() => _NgoSignInScreenState();
}

class _NgoSignInScreenState extends State<NgoSignInScreen> {
  TextEditingController ngo_name = TextEditingController();
  TextEditingController ngo_owner = TextEditingController();
  TextEditingController ngo_location = TextEditingController();

  void signInShowMyDialog() {
    AwesomeDialog(
      context: context,
      title: "Account Created Successfully!",
      desc: "Please log in to activate account.",
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      btnOkOnPress: () {
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
                      print("Sign In Tapped!");
                      if (ngo_name.text.isEmpty) {
                        nameShowMyDialog();
                      } else if (ngo_owner.text.isEmpty) {
                        ownerShowMyDialog();
                      } else if (ngo_location.text.isEmpty) {
                        locationShowMyDialog();
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
}
