import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String number;
  final String nameOnCard;
  final String expiryDate;

  const MyCard({
    Key? key,
    required this.number,
    required this.nameOnCard,
    required this.expiryDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 350,
          height: 220,
          margin: const EdgeInsets.only(bottom: 20, top: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 56, 56, 56),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "CREDIT CARD",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Image.asset(
                  'lib/assest/chip.png',
                  width: 70,
                  height: 70,
                  color: const Color.fromARGB(255, 56, 56, 56),
                  colorBlendMode: BlendMode.dst,
                ),
                Text(
                  number,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 33,
                    color: Color.fromARGB(196, 196, 196, 196),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(nameOnCard,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),
                    const SizedBox(
                      width: 100,
                    ),
                    Text(expiryDate,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
