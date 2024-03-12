// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class bmwScreenPage extends StatefulWidget {
  const bmwScreenPage({super.key});

  @override
  State<bmwScreenPage> createState() => _bmwScreenPage();
}

class _bmwScreenPage extends State<bmwScreenPage> {
  void googleFormSheet() async {
    const url = 'https://forms.gle/R6gYv2KWRWC8QEu5A';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch Study Material';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.black87,
          title: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white60,
              size: 30,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.white60,
                size: 30,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopMenuAndShowcase(),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 15, 0, 10),
                child: const Text(
                  "Specifications",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/icons/ic_speedometer.png",
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: '300'),
                                    TextSpan(
                                      text: ' km/h',
                                      style: TextStyle(
                                        color: Colors.white38,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/icons/ff.png",
                                height: 40,
                                width: 80,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: 'Petrol'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RotatedBox(
                                quarterTurns: 1,
                                child: Image.asset(
                                  "assets/icons/ic_cartopview.png",
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: '2 Door'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Jalandhar, Punjab",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: '₹'),
                          TextSpan(
                            text: "79,000",
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '/day',
                            style: TextStyle(color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        print("PRESSED");
                        googleFormSheet();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Book now",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TopMenuAndShowcase extends StatelessWidget {
  const TopMenuAndShowcase({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 70,
            right: 20,
            left: 20,
            bottom: 0,
            child: Image.asset(
              "assets/images/bb.png",
              width: 300,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 18, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 7,
                                spreadRadius: 0.5)
                          ],
                        ),
                        child: Image.asset(
                          "assets/logos/BMW.png",
                          width: 25,
                          height: 25,
                        ),
                      ),
                      const Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "BMW M8",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "2023",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          Text(
                            "4.8",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
