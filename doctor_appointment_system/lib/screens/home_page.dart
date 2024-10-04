import 'package:doctor_appointment_system/components/appointment_card.dart';
import 'package:doctor_appointment_system/components/doctor_card.dart';
import 'package:doctor_appointment_system/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> medCat = [];

  @override
  void initState() {
    super.initState();
    // Initialize medCat with data, wrap in try-catch to handle exceptions
    try {
      medCat = [
        {
          "icon": FontAwesomeIcons.userDoctor,
          "category": "General",
        },
        {
          "icon": FontAwesomeIcons.heartPulse,
          "category": "Cardiology",
        },
        {
          "icon": FontAwesomeIcons.lungs,
          "category": "Respirations",
        },
        {
          "icon": FontAwesomeIcons.hand,
          "category": "Dermatology",
        },
        {
          "icon": FontAwesomeIcons.personPregnant,
          "category": "Gynecology",
        },
        {
          "icon": FontAwesomeIcons.teeth,
          "category": "Dental",
        },
      ];
    } catch (e) {
      // Handle exceptions, e.g., log the error or show an error message
      print('Error initializing medCat: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    if (medCat.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text(
            'No categories available',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shakthi', //hard code the user's name at first
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/Profile.jpg'),
                  ),
                )
              ],
            ),
            Config.spaceMedium,
            //category listing
            const Text(
              'Category', //hard code the user's name at first
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            SizedBox(
              height: 45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(6, (index) {
                  return Card(
                    margin: const EdgeInsets.only(right: 20),
                    color: Config.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FaIcon(
                            medCat[index]['icon']!,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            medCat[index]['category']!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const AppointmentCard(),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Doctors',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount:
                    3, // Change this to the number of doctors you want to display
                itemBuilder: (context, index) {
                  return const DoctorCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
