import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:health_icons/health_icons.dart';

class BloodDetails {
  int? units;
  String? bloodType;
  String? hospital;
  BloodDetails(this.bloodType, this.units, this.hospital);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // This widget is the root of your application.
  BloodDetails bloodDetails1 = BloodDetails(
    "O-",
    3,
    'Khulna City Medical College Hospital,KDA avenue',
  );
  BloodDetails bloodDetails2 = BloodDetails(
    "O+",
    2,
    'Khulna City Medical College Hospital,KDA avenue',
  );
  List<BloodDetails> bloodCardList = [
    BloodDetails('O-', 3, 'Khulna City Medical College Hospital,KDA'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey, title: Text("My app")),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Center(
            child: Text(
              "Blood Requests",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          BloodCard(bloodDetails: bloodDetails1),
          SizedBox(height: 20),
          BloodCard(bloodDetails: bloodDetails2),
        ],
      ),
    );
  }
}

class BloodCard extends StatelessWidget {
  const BloodCard({super.key, required this.bloodDetails});

  final BloodDetails bloodDetails;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 30,
            top: 20,
            bottom: 20,
            right: 20,
          ),
          margin: const EdgeInsets.only(left: 8),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2), // Shadow color
                spreadRadius: 2, // Explodes the shadow size
                blurRadius: 8, // Blurs the edges
                offset: const Offset(0, 4), // Shifts shadow (x, y)
              ),
            ],
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200),
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(120, 252, 215, 215),
                    ),
                    child: const Text(
                      "URGENT",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      const Icon(Icons.water_drop, color: Colors.red, size: 22),
                      const SizedBox(width: 4),
                      Text("${bloodDetails.units} Units"),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Text(
                "${bloodDetails.bloodType} Blood Needed",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Icon(Icons.location_on_outlined, color: Colors.grey[400]),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      bloodDetails.hospital ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(199, 35, 35, 134),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "View Details",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          left: 8,
          top: 2,
          bottom: 2,
          child: Container(
            width: 15,

            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
