import 'package:flutter/material.dart';

class CarItem extends StatelessWidget {
  final String photoAsset;
  final String name;
  final String price;
  final String year;

  const CarItem({
    Key? key,
    required this.photoAsset,
    required this.name,
    required this.price,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 20, top: 20),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "Year: $year",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            const TextSpan(text: '₹'),
                            TextSpan(
                                text: price,
                                style: const TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold)),
                            const TextSpan(
                                text: '/day',
                                style: TextStyle(color: Colors.black38)),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 5,
            child: Image.asset(
              photoAsset,
              width: 150,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
