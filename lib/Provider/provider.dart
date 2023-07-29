import 'package:flutter/material.dart';
// import 'dart:async';

class PayDataProvider extends ChangeNotifier {
  final List paymentM = [
    {
      "titleimage": "assets/images/payment_getway/telebirr.png",
    },
    {
      "titleimage": "assets/images/payment_getway/chapa.png",
    },
  ];
  int selectedPaymentIndex = 0;

  int changePaymentIndex(int index) {
    selectedPaymentIndex = index;
    notifyListeners();
    return selectedPaymentIndex;
  }

  final List chapa = [
    {
      "imagename": "assets/images/payment_getway/telebirrLogo.png",
      "name": "telebirr",
    },
    {
      "imagename": "assets/images/payment_getway/CBEbirr.png",
      "name": "CBE Birr",
    },
    {
      "imagename": "assets/images/payment_getway/awash.png",
      "name": "AwashBirr",
    },
    {
      "imagename": "assets/images/payment_getway/paypal.png",
      "name": "Paypal",
    },
    {
      "imagename": "assets/images/payment_getway/hellocash.png",
      "name": "Hello Cash",
    },
    {
      "imagename": "assets/images/payment_getway/amole.png",
      "name": "Amole",
    },
    {
      "imagename": "assets/images/payment_getway/enatbank.png",
      "name": "EnatBank",
    },
    {
      "imagename": "assets/images/payment_getway/CDCard.png",
      "name": "Credit/Debit Card",
    },
    {
      "imagename": "assets/images/payment_getway/Ebirr.png",
      "name": "E-Birr",
    },
  ];

  int selectedChapaIndex = 0;
  void changeChapaIndex(int index) {
    selectedChapaIndex = index;
    notifyListeners();
  }

  DateTime time = DateTime.now();
  DateTime changeTime() {
    time = DateTime.now();
    notifyListeners();
    return time;
  }

  int timers = 170;
  timechangeDown(int timers) {
    timers--;
    notifyListeners();
  }
}
