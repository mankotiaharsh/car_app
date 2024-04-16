import 'package:car_app/add_post.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminWelcomePageScreen extends StatefulWidget {
  const AdminWelcomePageScreen({Key? key}) : super(key: key);

  @override
  State<AdminWelcomePageScreen> createState() => _AdminWelcomePageScreenState();
}

class _AdminWelcomePageScreenState extends State<AdminWelcomePageScreen> {
  String? savedOwnerName;

  Future<void> loadData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      savedOwnerName = preferences.getString("Owner name");
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "WELCOME",
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              ),
              const Row(
                children: [
                  Text(
                    "Mr.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.orange),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                 TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Lastname',
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Lastname',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                    controller:
                        TextEditingController(text: savedOwnerName ?? ""),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddPostScreen()));
                },
                child: const Icon(
                  Icons.ac_unit,
                  size: 60,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
