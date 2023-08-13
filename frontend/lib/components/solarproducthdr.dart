
import 'package:flutter/material.dart';

class SolarProductHeader extends StatelessWidget {
  const SolarProductHeader({
    super.key,
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
          child: Image.network(
            "https://plus.unsplash.com/premium_photo-1668078530961-32f4a1107791?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
            fit: BoxFit.cover,
          ),
        ),
        const ListTile(
          title: Text(
            "Solar Panel",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFFFFFFFF),
            ),
          ),
          subtitle: Text(
            "Brand Name",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFFFFFFFF),
            ),
          ),
          trailing: Column(
            children: [
              Icon(
                Icons.monetization_on_outlined,
                color: Color(0xFFFFFFFF),
              ),
              Text(
                " 10000",
                style: TextStyle(
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
          title: const Text(
            "Sellor Name",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(0xFFFFFFFF),
            ),
          ),
          subtitle: const Text(
            "Renter",
            style: TextStyle(
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
        )
      ],
    );
  }
}
