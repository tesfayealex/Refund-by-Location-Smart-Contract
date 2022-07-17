import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trial/UI/location_screen.dart';
import 'package:trial/constants.dart';

class InputAddress extends StatefulWidget {
  const InputAddress({Key? key}) : super(key: key);

  @override
  State<InputAddress> createState() => _InputAddressState();
}

class _InputAddressState extends State<InputAddress> {
  String address = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Input Address"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                TextField(
                  style: const TextStyle(color: kBlackColor),
                  onChanged: (val) {
                    address = val;
                  },
                  decoration: textFieldInputDecorator.copyWith(
                    labelText: "Address:",
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString("p_key", json.encode(address));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LocationScreen()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(kDefaultPadding),
                      ),
                      boxShadow: [boxShadow],
                    ),
                    child: Text(
                      "Next",
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color: kBlackColor,
                          ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
