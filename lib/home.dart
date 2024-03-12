import 'package:car_app/brands.dart';
import 'package:car_app/cars_card.dart';
import 'package:car_app/screens/bmw_screen.dart';
import 'package:car_app/screens/gclass_screen.dart';
import 'package:car_app/screens/tesla_screen_page.dart';
import 'package:car_app/screens/urus_screen.dart';
import 'package:car_app/web_views/audi_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  void BmwUrl() async {
    const url = 'https://www.carwale.com/bmw-cars/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch Study Material';
    }
  }

  void MercUrl() async {
    const url = 'https://www.mercedes-amg.com/en/home.html';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch Study Material';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          title: RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 24,
                color: Colors.black87,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: 'Gadi',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text: 'Wale',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.orange)),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black87,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Choose',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' your '),
                      TextSpan(
                          text: 'RIDE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange)),
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: RichText(
              //     textAlign: TextAlign.center,
              //     text: const TextSpan(
              //       style: TextStyle(
              //         fontSize: 24,
              //         color: Colors.black87,
              //       ),
              //       children: <TextSpan>[
              //         TextSpan(
              //             text: '"Explore German automotive excellence with',
              //             style: TextStyle(fontSize: 16)),
              //         TextSpan(
              //             text: ' Audi, BMW, and Mercedes-Benz ',
              //             style: TextStyle(
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.orange)),
              //         TextSpan(
              //             text:
              //                 '– where engineering meets luxury in perfect harmony."',
              //             style: TextStyle(fontSize: 16)),
              //       ],
              //     ),
              //   ),
              // ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                child: Text("Brands",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AudiViewPage()));
                      },
                      child: const CustomLogoWidget(
                        name: "AUDI",
                        imagePath: "assets/logos/audi.png",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        BmwUrl();
                      },
                      child: const CustomLogoWidget(
                        name: "BMW",
                        imagePath: "assets/logos/BMW.png",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        MercUrl();
                      },
                      child: const CustomLogoWidget(
                        name: "AMG",
                        imagePath: "assets/logos/benz.png",
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  "Available Car",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const teslaScreenPage()));
                    },
                    child: const CarItem(
                      photoAsset: "assets/images/tesla_1.png",
                      name: "Tesla Model X",
                      price: "69,000",
                      year: "2021",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const bmwScreenPage()));
                    },
                    child: const CarItem(
                      photoAsset: "assets/images/bb.png",
                      name: "BMW M8",
                      price: "79,000",
                      year: "2023",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const gClassScreenPage()));
                    },
                    child: const CarItem(
                      photoAsset: "assets/images/gg.png",
                      name: "G-Wagon",
                      price: "89,000",
                      year: "2020",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const lamboScreenPage()));
                    },
                    child: const CarItem(
                      photoAsset: "assets/images/uu.png",
                      name: "Lamborghini Urus",
                      price: "99,000",
                      year: "2022",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
