import 'package:flutter/material.dart';

const kPrimaryColor = Colors.white;
const kWhiteColor = Color(0xFFF3F4F8);
const kYellowColor = Color(0xFFF7EA00);

const kSecondaryColor = Color(0xFF3A665E);
const kGreyColor = Color(0xFF707070);
const kBlackColor = Color(0xFF101010);
const kErrorColor = Color(0xFFee1632);

const double kDefaultPadding = 20.0;

final boxShadow = BoxShadow(
    blurRadius: 10,
    color: Colors.black.withOpacity(0.1),
    offset: const Offset(1, 3));

const textFieldInputDecorator = InputDecoration(
  labelStyle: TextStyle(color: kGreyColor),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kGreyColor),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kBlackColor),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: kBlackColor),
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  ),
);
