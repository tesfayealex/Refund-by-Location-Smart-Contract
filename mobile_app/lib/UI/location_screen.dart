import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:trial/constants.dart';
import 'package:trial/utils/eth_utils.dart';

class LocationScreen extends ConsumerStatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends ConsumerState<LocationScreen> {
  String val = "";
  bool isTestMode = false;

  late double latitude = 0.0;
  late double longitude = 0.0;

  late Timer timer;

  @override
  void initState() {
    super.initState();
  }

  Future<Position?> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);
      return position;
    } catch (e) {
      print(e);
      return null;
    }
  }

  checkPermission() async {
    PermissionStatus permission =
        await LocationPermissions().checkPermissionStatus();
    return permission;
  }

  void checkLocation(ethUtils) async {
    PermissionStatus st = await checkPermission();
    if (st == PermissionStatus.granted) {
      Position? position = await getCurrentLocation();
      if (position != null) {
        print(
            "##############GETTING LOCATION ${position.latitude} and ${position.latitude}################");
        setState(() {
          latitude = position.latitude;
          longitude = position.longitude;
        });
        // final ethUtils = ref.watch(ethUtilsProviders.notifier);
        BigInt lt = BigInt.from(
            int.parse(position.latitude.toString().split('.').join("")));
        BigInt ln = BigInt.from(
            int.parse(position.latitude.toString().split('.').join("")));
        ethUtils.setValue2(lt, ln);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: kErrorColor,
          content: Text(
            "Location Error",
            style: TextStyle(
              fontSize: 15,
              color: kPrimaryColor,
            ),
          ),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ));
      }
    } else {
      await LocationPermissions().requestPermissions();
      checkLocation(ethUtils);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(ethUtilsProviders);
    final ethUtils = ref.watch(ethUtilsProviders.notifier);
    if (!isTestMode) {
      timer = Timer.periodic(const Duration(seconds: 60), (t) {
        checkLocation(ethUtils);
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOCATION"),
      ),
      body: !isTestMode
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child:
                    // ethUtils.isLoading
                    //     ? Center(
                    //         child: Column(
                    //         children: const [
                    //           CircularProgressIndicator(),
                    //           SizedBox(
                    //             height: kDefaultPadding,
                    //           ),
                    //           Text("Loading.....")
                    //         ],
                    //       ))
                    //     :
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text("Latitude: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(latitude.toString()),
                      ],
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Longitude: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(longitude.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(14.0),
              child: ethUtils.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(ethUtils.deployedName == null
                            ? "."
                            : ethUtils.deployedName!),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            ethUtils.setValue("IT WORKS");
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            padding:
                                const EdgeInsets.all(kDefaultPadding * 0.75),
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(kDefaultPadding),
                              ),
                              boxShadow: [boxShadow],
                            ),
                            child: Text(
                              "TEST",
                              style:
                                  Theme.of(context).textTheme.button!.copyWith(
                                        color: kBlackColor,
                                      ),
                            ),
                          ),
                        )
                      ],
                    ),
            ),
    );
  }
}
