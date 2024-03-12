import 'package:flutter/material.dart';

class CustomLogoWidget extends StatelessWidget {
  final String name;
  final String imagePath;

  const CustomLogoWidget({
    Key? key,
    required this.name,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 12, 0, 0),
      child: SizedBox(
        height: 140,
        width: 140,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                height: 90,
                width: 90,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(6, 2, 0, 0),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: const Color.fromARGB(255, 255, 153, 0),
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5), // Shadow color
                          blurRadius: 2, // Blur radius
                          offset: const Offset(0, 2), // Offset
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 25,
              child: Image.asset(
                imagePath,
                height: 80,
                width: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
