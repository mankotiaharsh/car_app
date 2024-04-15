import 'package:car_app/add_post.dart';
import 'package:flutter/material.dart';

class AdminWelcomePageScreen extends StatefulWidget {
  const AdminWelcomePageScreen({Key? key}) : super(key: key);

  @override
  State<AdminWelcomePageScreen> createState() => _AdminWelcomePageScreenState();
}

class _AdminWelcomePageScreenState extends State<AdminWelcomePageScreen> {
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
