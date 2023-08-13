import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:frontend/views/home.screen.dart';
import 'package:frontend/views/solar_details.dart';

import '../components/solarproducthdr.dart';
import 'package:http/http.dart' as http;
import '../model/seller.model.dart';

class MarketPlace extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MarketPlace({super.key});

  static const routeName = '/marketplace';

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Seller>> getResponse() async {
    try {
      var res = await http.get(Uri.parse('http://52.90.82.158:3000/seller'));
      // print(res.body);
      var seller = sellerFromJson(res.body);
      return seller;
    } catch (e) {
      print("Error during HTTP request: $e");
      return [];
    }
  }

  final List<Widget> items = [
    const Padding(
      padding: EdgeInsets.all(8.0),
      child: FeatureCard(
        heading: "Best Deals",
        headingImg: "assets/images/Flame.png",
        content:
            "Get Best Deals on Solar Panels that are available in the market",
        color: Color.fromARGB(255, 23, 139, 43),
      ),
    ),
    const Padding(
      padding: EdgeInsets.all(8.0),
      child: FeatureCard(
          heading: "Best Vendors",
          headingImg: "assets/images/Box.png",
          content:
              "Get your Solar pannel from the best vendors available in market",
          color: Color.fromARGB(255, 10, 64, 131)),
    ),
    const Padding(
      padding: EdgeInsets.all(8.0),
      child: FeatureCard(
        heading: "Custom filters",
        headingImg: "assets/images/Flame.png",
        content: "Sort the Solar Panels as per your needs",
        color: Color.fromARGB(255, 13, 107, 73),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 243, 237),
      appBar: AppBar(
        title: const Text(
          'Market Place',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF369708),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 220,
              width: double.infinity,
              child: CarouselSlider(
                items: items,
                options: CarouselOptions(
                  height: 220,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1,
                ),
              ),
            ),
            //A container containg the heading and attaractive card design

            const Text(
              "Solar Panels",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 6, 111, 29),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // GestureDetector(
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const SolarDetails(),
            //         ),
            //       );
            //     },
            //     child: const SolarProductCard())

            FutureBuilder<List<Seller>>(
              future:
                  getResponse(), // Provide the future function that fetches the data
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return const SizedBox(
                    height: 100,
                    child: Center(
                      child: Text('Error loading data.'),
                    ),
                  );
                }
                // If the data is successfully loaded, display the ListView.builder
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SolarDetails(),
                            ),
                          );
                        },
                        child: const SolarProductCard(),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class SolarProductCard extends StatelessWidget {
  const SolarProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 6, 46, 8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const SolarProductHeader(),
    );
  }
}
