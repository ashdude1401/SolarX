import 'package:flutter/material.dart';
import 'package:frontend/views/connect_with_expert.dart';
import 'package:frontend/views/market_place.dart';
import 'package:google_fonts/google_fonts.dart';

import 'calculator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get Set Solar !',
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color(0xFF369708),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            "assets/images/menu_fries.png",
            height: 25,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              "assets/images/Notification.png",
              height: 25,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Marketplace
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MarketPlace.routeName);
                },
                child: FeatureCard(
                  heading: "Marketplace",
                  headingImg: "assets/images/shopping.png",
                  content:
                      "Get the best deals on Solar Panels, Inverters, Batteries, etc. from our trusted partners",
                  color:
                      const Color.fromARGB(255, 23, 157, 79).withOpacity(0.9),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //Connect to Experts
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConnectWithExpert(),
                  ),
                ),
                child: FeatureCard(
                  heading: "Connect to Experts ",
                  headingImg: "assets/images/connect.png",
                  content:
                      "Get over a 1-1 call with our experts, get complete info. on the domain before going ahead",
                  color: const Color.fromARGB(255, 0, 97, 70).withOpacity(0.9),
                ),
              ),

              //Calculator
              const SizedBox(
                height: 20,
              ),

              GestureDetector(
                onTap: () => Navigator.pushNamed(context, Calculator.routeName),
                child: FeatureCard(
                    content:
                        "Let’s calculate conventional vs Solar Panel cost as per your consumption",
                    heading: 'Calculator',
                    headingImg: "assets/images/percent-square.png",
                    showChip: true,
                    color: const Color(0xFF123507)),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  FeatureCard({
    super.key,
    required this.heading,
    required this.headingImg,
    required this.content,
    this.showChip = false,
    required this.color,
  });

  final String heading;
  final String headingImg;
  final String content;
  bool showChip;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(40))),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  heading,
                  softWrap: true,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Image.asset(
                headingImg,
                height: 25,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          showChip
              ? Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Day",
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Month",
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 8.0),
                      ),
                      onPressed: () {},
                      child: Text(
                        "year",
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          const SizedBox(
            height: 30,
          ),
          Text(
            content,
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
