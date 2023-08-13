import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:frontend/views/home.screen.dart';
import 'package:frontend/views/solar_details.dart';

import '../components/solarproducthdr.dart';

class MarketPlace extends StatelessWidget {
  MarketPlace({super.key});

  static const routeName = '/marketplace';

  final List<Widget> items = [
    Padding(
      padding: const EdgeInsets.all(8.0),
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
    Padding(
      padding: const EdgeInsets.all(8.0),
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
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SolarDetails(),
                    ),
                  );
                },
                child: const SolarProductCard())

            // //List card of solar panels available in the market
            // Container(
            //   height: 380,
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: 5,
            //     itemBuilder: (BuildContext context, int index) {
            //       return Card(
            //         child: GestureDetector(
            //           onTap: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => const SolarDetails(),
            //               ),
            //             );
            //           },
            //           child: ListTile(
            //             leading: ClipRRect(
            //               borderRadius: BorderRadius.circular(8.0),
            //               child: Image.network(
            //                   "https://plus.unsplash.com/premium_photo-1668078530961-32f4a1107791?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"),
            //             ),
            //             title: const Text("Solar Panel"),
            //             subtitle: const Text("Rs. 1000"),
            //             trailing: const Icon(Icons.arrow_forward_ios),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // )
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
        color: Color.fromARGB(255, 6, 46, 8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const SolarProductHeader(),
    );
  }
}
