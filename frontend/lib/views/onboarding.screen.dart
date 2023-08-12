import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'welcome.screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  LiquidController controller = LiquidController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        LiquidSwipe(
          liquidController: controller,
          enableLoop: false,
          onPageChangeCallback: (page) {
            setState(() {});
          },
          slideIconWidget: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 30,
          ),
          fullTransitionValue: 500,
          waveType: WaveType.liquidReveal,
          pages: pages(context),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSmoothIndicator(
                    activeIndex: controller.currentPage,
                    count: pages(context).length,
                    onDotClicked: (index) {
                      controller.animateToPage(page: index, duration: 100);
                    },
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.white,
                      dotColor: Colors.white54,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 5,
                    ),
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}

List<Widget> pages(context) {
  return [
    const PageOne(),
    const PageTwo(),
    const PageThree(),
  ];
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/page1.jpg'),
          fit: BoxFit.cover,
        ),
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            'Welcome to SolarX',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            'SolarX is a Marketplace for Solar Energy. We connect people who have solar panels with people who want to buy solar energy.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/page2.jpg'),
            fit: BoxFit.cover,
          ),
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'Why SolarX?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              'SolarX is a Marketplace for Solar Energy. We connect people who have solar panels with people who want to buy solar energy.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/page4.jpg'),
          fit: BoxFit.cover,
        ),
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      child: Column(
        children: [
          // Lets Get started
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Lets Get Started',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            'SolarX is a Marketplace for Solar Energy. We connect people who have solar panels with people who want to buy solar energy.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              minimumSize: const Size(200, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomePage()));
            },
            child: const Text(
              'Get Started',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          )
        ],
      ),
    );
  }
}
