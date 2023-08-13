import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../model/seller.model.dart';

class SolarProductHeader extends StatelessWidget {
  final Seller? data;
  const SolarProductHeader({
    super.key,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedNetworkImage(
              imageUrl: data!.image!,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        ListTile(
          title: Text(
            data!.model!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFFFFFFFF),
            ),
          ),
          subtitle: Text(
            data!.brand!,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFFFFFFFF),
            ),
          ),
          trailing: Column(
            children: [
              const Icon(
                Icons.monetization_on_outlined,
                color: Color(0xFFFFFFFF),
              ),
              Text(
                data!.price.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Divider(
                color: Colors.white,
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
            child: Image.network(
              "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
              fit: BoxFit.cover,
              height: 50,
              width: 50,
            ),
          ),
          title: Text(
            data!.seller!.firstName!,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(0xFFFFFFFF),
            ),
          ),
          subtitle: Text(
            data!.seller!.companyName!,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFFFFFFFF),
            ),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.duo_outlined,
              size: 40,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
