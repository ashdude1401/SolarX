import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend/model/seller.model.dart';
import 'package:shimmer/shimmer.dart';

class SolarDetails extends StatelessWidget {
  final Seller? data;
  const SolarDetails({
    super.key,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Solar Details',
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
            actions: [
              IconButton(
                icon: Image.asset(
                  "assets/images/Notification.png",
                  height: 25,
                ),
                onPressed: () {},
              ),
            ]),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 205, 221, 203),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: CachedNetworkImage(
                            imageUrl: data!.image!,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.white,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        title: Text(
                          data!.model!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromARGB(255, 18, 81, 8),
                          ),
                        ),
                        subtitle: Text(
                          data!.brand!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color.fromARGB(255, 18, 81, 8),
                          ),
                        ),
                        trailing: Column(
                          children: [
                            const Icon(
                              Icons.monetization_on_outlined,
                              color: Color.fromARGB(255, 18, 81, 8),
                            ),
                            Text(
                              data!.price.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color.fromARGB(255, 18, 81, 8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              color: Color.fromARGB(255, 18, 81, 8),
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
                            fit: BoxFit.cover,
                            height: 50,
                            width: 50,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.white,
                              child: Container(
                                height: 50,
                                width: 50,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          data!.seller!.firstName!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color.fromARGB(255, 18, 81, 8),
                          ),
                        ),
                        subtitle: Text(
                          data!.seller!.email!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.duo_outlined,
                            size: 40,
                            color: Color.fromARGB(255, 18, 81, 8),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Description',
                              style: TextStyle(
                                color: Color.fromARGB(255, 18, 81, 8),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 300,
                                  child: Text(
                                    data!.description!,
                                    softWrap: true,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text("Specifications",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 18, 81, 8),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SpecsDisplay(
                                  spec: 'Efficiency',
                                  value: data!.efficiency!.toString(),
                                  color: const Color.fromRGBO(131, 206, 121, 1),
                                ),
                                const SpecsDisplay(
                                  spec: 'Power',
                                  value: "30W",
                                  color: Color.fromRGBO(131, 206, 121, 1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class SpecsDisplay extends StatelessWidget {
  const SpecsDisplay({
    super.key,
    required this.spec,
    required this.value,
    required this.color,
  });
  final String spec;
  final String value;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color.fromRGBO(131, 206, 121, 1),
      ),
      child: Column(
        children: [
          Text(
            spec,
            style: const TextStyle(
              color: Color.fromRGBO(44, 68, 40, 1),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
