import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 71, 233, 133),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.04,
            ),
          ),
        ),
      ),
    );
  }
}

class MyButtonAgree extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButtonAgree({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 71, 233, 133),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.04,
            ),
          ),
        ),
      ),
    );
  }
}
