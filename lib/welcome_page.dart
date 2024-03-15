import 'package:car_app/Details/admin_signin.dart';
import 'package:car_app/Details/customer_sign_page.dart';
import 'package:car_app/Details/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Welcome",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const Text("   Start your journey with us today!",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.orange,
                    fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width * 1,
              child: Image.asset(
                'assets/images/wel3.jpg',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: () {
                      showBottomSheet();
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.orange),
                    onPressed: () {
                      print("Sign In Tapped!");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showBottomSheet() async {
    await showModalBottomSheet<void>(
        context: context,
        barrierColor: Colors.black.withOpacity(0.7),
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(color: Colors.white),
            height: 200,
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    print("NGO Tapped");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NgoSignInScreen()));
                  },
                  child: SizedBox(
                    height: 180,
                    child: Image.asset(
                      "assets/images/ad.png",
                    ),
                  ),
                )),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    print("Volunteer Tapped");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                  },
                  child: SizedBox(
                    height: 180,
                    child: Image.asset(
                      "assets/images/cs.jpg",
                    ),
                  ),
                )),
              ],
            ),
          );
        });
  }
}
