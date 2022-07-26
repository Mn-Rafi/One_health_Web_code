import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_submit_button.dart';

class AdminAmbulance extends StatelessWidget {
  const AdminAmbulance({Key? key}) : super(key: key);

  confirmAmbulance(AmbulanceBookingResponse ambulanceBookingResponse,
      BuildContext context) async {
    final donor = FirebaseFirestore.instance
        .collection('ambulance')
        .doc(ambulanceBookingResponse.id);
    await donor.set(ambulanceBookingResponse.toJson()).then((value) {
      // Get.snackbar(
      //   'Success',
      //   'Registered Successfully',
      //   snackPosition: SnackPosition.TOP,
      //   backgroundColor: Colors.green,
      //   colorText: Colors.white,
      // );
      // Navigator.pop(context);
      // Navigator.pop(context);
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Ambulance Booking',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                'New Requests',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          StreamBuilder<List<AmbulanceBookingResponse>?>(
              stream: readDonorsData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final datas = snapshot.data!
                      .where((element) => element.isrejected == null)
                      .toList();
                  if (datas.isEmpty) {
                    return Center(
                      child: Text('No New Requests'),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: datas.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (datas[index].isrejected == null) {
                            Get.defaultDialog(
                                title: 'Confirm Ambulance!',
                                middleText:
                                    'Confirm booking if any ambulance is available',
                                actions: [
                                  InkWell(
                                    onTap: () {
                                      confirmAmbulance(
                                        AmbulanceBookingResponse(
                                          isRequested: true,
                                          isrejected: true,
                                          address: datas[index].address,
                                          dateTime: datas[index].dateTime,
                                          id: datas[index].id,
                                        ),
                                        context,
                                      );
                                      Get.back();
                                    },
                                    child: CustomSubmitButton(
                                        text: 'Ambulance Not Available',
                                        bgColor: Colors.red),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        confirmAmbulance(
                                          AmbulanceBookingResponse(
                                            isRequested: false,
                                            isrejected: false,
                                            address: datas[index].address,
                                            dateTime: datas[index].dateTime,
                                            id: datas[index].id,
                                          ),
                                          context,
                                        );
                                        Get.back();
                                      },
                                      child: CustomSubmitButton(
                                          text: 'Confirm',
                                          bgColor: Colors.blue))
                                ]);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              title: Text(
                                datas[index].isrejected == null
                                    ? "Requested"
                                    : datas[index].isrejected != null &&
                                            datas[index].isrejected! == true
                                        ? "Ambulance was busy"
                                        : "Ambulance Sent",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                datas[index].address,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                DateFormat('yyyy-MM-dd – kk:mm').format(
                                    DateTime.parse(datas[index].dateTime)),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                'All Requests',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          StreamBuilder<List<AmbulanceBookingResponse>?>(
              stream: readDonorsData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('No Requests Found'),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: snapshot.data![index].isrejected != null &&
                                  snapshot.data![index].isrejected!
                              ? Colors.red
                              : Colors.green,
                          child: ListTile(
                            title: Text(
                              snapshot.data![index].isrejected == null
                                  ? "Requested"
                                  : snapshot.data![index].isrejected != null &&
                                          snapshot.data![index].isrejected! ==
                                              true
                                      ? "Ambulance was busy"
                                      : "Ambulance Sent",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              snapshot.data![index].address,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Text(
                              DateFormat('yyyy-MM-dd – kk:mm').format(
                                  DateTime.parse(
                                      snapshot.data![index].dateTime)),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ],
      ),
    );
  }

  Stream<List<AmbulanceBookingResponse>> readDonorsData() {
    log('hereee');
    return FirebaseFirestore.instance
        .collection('ambulance')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((e) => AmbulanceBookingResponse.fromJson(e.data()))
          .toList();
    });
  }
}

class AmbulanceBookingResponse {
  final bool isRequested;
  final String dateTime;
  final String id;
  final String address;
  final bool? isrejected;
  AmbulanceBookingResponse({
    required this.isRequested,
    required this.dateTime,
    required this.id,
    this.isrejected,
    required this.address,
  });
  Map<String, dynamic> toJson() => {
        'requsted': isRequested,
        'datetime': dateTime,
        'id': id,
        'address': address,
        'isrejected': isrejected,
      };
  static AmbulanceBookingResponse fromJson(Map<String, dynamic> json) =>
      AmbulanceBookingResponse(
        isRequested: json['requsted'],
        dateTime: json['datetime'],
        id: json['id'],
        address: json['address'],
        isrejected: json['isrejected'],
      );
}
