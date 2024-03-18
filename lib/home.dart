// ignore_for_file: library_private_types_in_public_api

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/card_front.dart';
import 'package:payment_app/card_rear.dart';
import 'package:payment_app/widgets/textFeild.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  final GlobalKey<FlipCardState> _cardKey = GlobalKey<FlipCardState>();

  @override
  void initState() {
    super.initState();
    // Add listener to CVV controller
    _cvvController.addListener(_handleCVVChange);
  }

  @override
  void dispose() {
    // Dispose listener to avoid memory leaks
    _cvvController.removeListener(_handleCVVChange);
    super.dispose();
  }

  void _handleCVVChange() {
    if (_cvvController.text.isNotEmpty) {
      // If CVV controller has data, flip the card
      _cardKey.currentState?.toggleCard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text(
            "My Wallet",
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FlipCard(
                key: _cardKey,
                front: MyCard(
                  number: _numberController.text,
                  nameOnCard: _nameController.text,
                  expiryDate: _dateController.text,
                ),
                back: CardRear(
                  cvv: _cvvController.text,
                ),
                flipOnTouch: true, // Set to true to allow flipping when touched
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTextField(
                  hintText: "Enter the card number (xxxx-xxxx-xxxx-xxxx)",
                  textEditingController: _numberController,
                  onChanged: (value) {
                    setState(() {
                      String text = value.replaceAll(
                          RegExp(r'\D'), ''); // Remove non-digit characters
                      String formattedText = '';
                      for (var i = 0; i < 16; i++) {
                        formattedText += text[i];
                        if ((i + 1) % 4 == 0 && i != 16 - 1) {
                          formattedText +=
                              ' '; // Add a dash after every four digits
                        }
                      }
                      _numberController.value =
                          _numberController.value.copyWith(
                        text: formattedText,
                        selection: TextSelection.collapsed(
                            offset: formattedText.length),
                      );
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTextField(
                  hintText: "Enter the card Holder Name",
                  textEditingController: _nameController,
                  onChanged: (_) => setState(() {}),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTextField(
                  hintText: "Enter the expiry date (MM/YY)",
                  textEditingController: _dateController,
                  onChanged: (value) {
                    setState(() {
                      String text = value.replaceAll(
                          RegExp(r'\D'), ''); // Remove non-digit characters
                      if (text.length > 4) {
                        text = text.substring(
                            0, 4); // Limit the text to MMYY format
                      }
                      String formattedText = '';
                      for (var i = 0; i < text.length; i++) {
                        formattedText += text[i];
                        if (i == 1) {
                          formattedText +=
                              '/'; // Add a slash after the second character (MM)
                        }
                      }
                      _dateController.value = _dateController.value.copyWith(
                        text: formattedText,
                        selection: TextSelection.collapsed(
                            offset: formattedText.length),
                      );

                      // Check if both month and year are entered
                      if (text.length == 4) {
                        int month = int.tryParse(text.substring(0, 2)) ?? 0;
                        //int year = int.tryParse(text.substring(2)) ?? 0;
                        if (month > 12) {
                          // Truncate month if it exceeds 12
                          _dateController.text = '12/${text.substring(2)}';
                        }
                      }
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTextField(
                  hintText: "Enter CVV",
                  textEditingController: _cvvController,
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
