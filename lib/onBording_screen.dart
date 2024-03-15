import 'package:car_app/onbord_model.dart';
import 'package:car_app/welcome_page.dart';
import 'package:flutter/material.dart';

class OnBoradingScreenPage extends StatefulWidget {
  const OnBoradingScreenPage({Key? key}) : super(key: key);

  @override
  State<OnBoradingScreenPage> createState() => _OnBoradingScreenPageState();
}

class _OnBoradingScreenPageState extends State<OnBoradingScreenPage> {
  @override
  Widget build(BuildContext context) {
    final c = PageController();

    final list = [
      //onboarding 1
      Onboard(
        title: 'Welcome to GadiWale',
        subtitle: "Start Your Journey Here.",
        image: 'assets/images/oh.png',
      ),

      //onboarding 2
      Onboard(
        title: 'Imagination to Reality',
        subtitle: 'Where Every Mile Tells a Story.',
        image: 'assets/images/mc.gif',
      ),
    ];

    return Scaffold(
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (ctx, ind) {
          final isLast = ind == list.length - 1;

          return Column(
            children: [
              // Image asset
              Image.asset(
                list[ind].image,
                height: MediaQuery.of(context).size.height * .6,
                width: isLast ? MediaQuery.of(context).size.width * .9 : null,
              ),

              // Title
              Text(
                list[ind].title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: .5,
                ),
              ),

              // Spacer
              SizedBox(height: MediaQuery.of(context).size.height * .015),

              // Subtitle
              SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                child: Text(
                  list[ind].subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13.5,
                    letterSpacing: .5,
                  ),
                ),
              ),

              const Spacer(),

              // Dots
              Wrap(
                spacing: 10,
                children: List.generate(
                  list.length,
                  (i) => Container(
                    width: i == ind ? 15 : 10,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == ind ? Colors.orange : Colors.black,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                onPressed: () {
                  if (isLast) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => const WelcomePage(),
                    ));
                  } else {
                    c.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.ease,
                    );
                  }
                },
                child: Text(
                  isLast ? 'Finish' : 'Next',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),

              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}
