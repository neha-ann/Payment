// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class CardRear extends StatelessWidget {
  final String cvv;
  const CardRear({Key? key, required this.cvv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 220,
        margin: const EdgeInsets.only(bottom: 20, top: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 56, 56, 56),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              height: 50,
              width: 350,
              decoration: const BoxDecoration(color: Colors.black),
              margin: const EdgeInsets.only(top: 30),
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 200,
                  decoration: const BoxDecoration(color: Colors.grey),
                  margin: const EdgeInsets.only(top: 20, left: 25),
                ),
                Container(
                  height: 50,
                  width: 80,
                  decoration: const BoxDecoration(color: Colors.grey),
                  margin: const EdgeInsets.only(top: 20, left: 20),
                  child: Center(
                      child: Text(
                    cvv,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ],
            )
          ],
        ));
  }
}
