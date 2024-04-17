import 'package:car_app/add_post.dart';
import 'package:car_app/screens/bmw_screen.dart';
import 'package:car_app/screens/gclass_screen.dart';
import 'package:car_app/screens/tesla_screen_page.dart';
import 'package:car_app/screens/urus_screen.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class AdminWelcomePageScreen extends StatefulWidget {
  const AdminWelcomePageScreen({Key? key}) : super(key: key);

  @override
  State<AdminWelcomePageScreen> createState() => _AdminWelcomePageScreenState();
}

class _AdminWelcomePageScreenState extends State<AdminWelcomePageScreen> {
  String getGreeting() {
    var now = DateTime.now();
    var hour = now.hour;

    if (hour >= 0 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon";
    } else if (hour >= 17 && hour < 21) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getGreeting(),
                  style: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.bold),
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
                    Text(
                      "Harsh Mankotia",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Welcome to ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              TextSpan(
                                text: 'Gadi',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              TextSpan(
                                  text: 'Wale',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                            ],
                          ),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Your ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      TextSpan(
                          text: 'Cars',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CarCard(
                  name: "BMW",
                  breed: "M8",
                  gender: "Petrol",
                  color: "300Km/h",
                  age: "2 Door",
                  location: "₹ 79000",
                  imagePath: 'assets/images/bb.png',
                  onTapCallback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const bmwScreenPage()));
                  },
                  petName: "Lucy's Name",
                  bread: "Lucy's Breed",
                  aboutPet: "Lucy's About Info",
                  address: "Lucy's Address",
                  zipCode: "Lucy's Zip Code",
                  contactNumber: "Lucy's Contact Number",
                ),
                CarCard(
                  name: "Mercedes",
                  breed: "G-Wagon",
                  gender: "Diesel",
                  color: "220Km/h",
                  age: "4 Door",
                  location: "₹ 89000",
                  imagePath: 'assets/images/gg.png',
                  onTapCallback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const gClassScreenPage()));
                  },
                  petName: "Lucy's Name",
                  bread: "Lucy's Breed",
                  aboutPet: "Lucy's About Info",
                  address: "Lucy's Address",
                  zipCode: "Lucy's Zip Code",
                  contactNumber: "Lucy's Contact Number",
                ),
                CarCard(
                  name: "Lamborghini",
                  breed: "Urus",
                  gender: "Hybrid",
                  color: "280Km/h",
                  age: "4 Door",
                  location: "₹ 99000",
                  imagePath: 'assets/images/uu.png',
                  onTapCallback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const lamboScreenPage()));
                  },
                  petName: "Lamborghini",
                  bread: "Urus",
                  aboutPet: "Lucy's About Info",
                  address: "Lucy's Address",
                  zipCode: "Lucy's Zip Code",
                  contactNumber: "Lucy's Contact Number",
                ),
                CarCard(
                  name: "Tesla",
                  breed: "Model X",
                  gender: "Electric",
                  color: "330Km/h",
                  age: "4 Door",
                  location: "₹ 69000",
                  imagePath: 'assets/images/tesla_1.png',
                  onTapCallback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const teslaScreenPage()));
                  },
                  petName: "Lamborghini",
                  bread: "Urus",
                  aboutPet: "Lucy's About Info",
                  address: "Lucy's Address",
                  zipCode: "Lucy's Zip Code",
                  contactNumber: "Lucy's Contact Number",
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddPostScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.black,
                      ),
                      child: const Text(
                        "Add Post",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final String name;
  final String breed;
  final String gender;
  final String color;
  final String age;
  final String location;
  final String imagePath;
  final Function onTapCallback;

  // Add these new fields
  final String petName;
  final String bread;
  final String aboutPet;
  final String address;
  final String zipCode;
  final String contactNumber;

  const CarCard({
    super.key,
    required this.name,
    required this.breed,
    required this.gender,
    required this.color,
    required this.age,
    required this.location,
    required this.imagePath,
    required this.onTapCallback,
    // Add these new parameters
    required this.petName,
    required this.bread,
    required this.aboutPet,
    required this.address,
    required this.zipCode,
    required this.contactNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              onTapCallback();
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 150,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 150,
                width: 160,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            left: 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  breed,
                  style: const TextStyle(fontSize: 13),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(1, 5, 0, 0),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 5, 0, 0),
                        child: Text(
                          gender,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 10),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 5, 0, 0),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 5, 0, 0),
                        child: Text(
                          color,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      location,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
