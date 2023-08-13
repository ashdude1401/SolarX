import 'package:flutter/material.dart';
import 'package:frontend/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../model/energy.model.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  static const routeName = '/calculator';

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Calculator',
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
                "assets/images/percent-square.png",
                height: 25,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FeatureCard(
                heading: "Solar Calculator",
                headingImg: "assets/images/connect.png",
                content:
                    "Calculate the amount of energy you can save by installing solar panels on your roof",
                color: const Color.fromARGB(255, 0, 97, 70).withOpacity(0.9),
              ),
            ],
          ),
        ));
  }
}

class FeatureCard extends StatefulWidget {
  const FeatureCard({
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
  final bool showChip;
  final Color color;

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  TextEditingController billController = TextEditingController();

  TextEditingController areaController = TextEditingController();

  TextEditingController unitController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  Future<Map<String, dynamic>> getResponse() async {
    try {
      var res = await http
          .post(Uri.parse('http://52.90.82.158:3000/user/calc'), body: {
        "area": areaController.text,
        "unit": unitController.text,
        "monthlyCost": billController.text,
        "price": priceController.text,
        "stateNo": "1",
        "PerformanceRatio": "70",
        "efficiency": "40",
      });
      print(res.body);
      var calc = calcFromJson(res.body);
      return calc.energy!.toJson();
    } catch (e) {
      print("Error during HTTP request: $e");
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    widget.heading,
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
                  widget.headingImg,
                  color: Colors.white,
                  height: 25,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            widget.showChip
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
              widget.content,
              style: GoogleFonts.quicksand(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: billController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter your monthly electricity bill',
                hintStyle: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: areaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter your Area in sqmetres',
                hintStyle: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: unitController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter your Monthly unit consumption',
                hintStyle: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter your Solar Panel Price ',
                hintStyle: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (areaController.text.isEmpty ||
                    billController.text.isEmpty ||
                    unitController.text.isEmpty ||
                    priceController.text.isEmpty) {
                  showSnackBar("Fill The Data", context);
                } else {
                  getResponse();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 97, 70),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.8,
                  50,
                ),
              ),
              child: const Text(
                "Calculate",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
