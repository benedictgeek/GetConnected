import 'package:flutter/material.dart';

class MyColors {
  // static const MaterialColor primarySwatch = Color(0xFFF76C6C);
  static const MaterialColor primarySwatch = MaterialColor(0xFFEF686A, {
    50: Color(0xFFF6B4AC),
    100: Color(0xFFEF6A6C),
    200: Color(0xFFEE5155),
  });

  static const Color accentColor = Color(0xFFF8E9A1);
  static const Color body = Color(0XFF6D6D6D);
  static const Color altTextColor = Color(0XFFF6F6F6);
}

class AppBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MyColors.primarySwatch,
            MyColors.accentColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class CallBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MyColors.primarySwatch[50],
            MyColors.accentColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class DummyData {
  static final List<Map<String, String>> usersData = [
    {
      "name": "Davidson",
      "last_name": "Jack",
      "age": "22",
      "location": "Paris, France",
      "occupation": "Artist"
    },
    {
      "name": "Adefemi",
      "last_name": "Ozz",
      "age": "25",
      "location": "Lagos, Nigeria",
      "occupation": "Singer"
    },
    {
      "name": "Jeniffer",
      "last_name": "Lopex",
      "age": "20",
      "location": "NY, UK",
      "occupation": "Developer"
    },
    {
      "name": "Praise-El ",
      "last_name": "Mike",
      "age": "23",
      "location": "Moscow, Russia",
      "occupation": "UX/UI"
    },
    {
      "name": "Damilare",
      "last_name": "John",
      "age": "22",
      "location": "Ogun, Nigeria",
      "occupation": "Data Scientist"
    },
    {
      "name": "Oliver",
      "last_name": "Gucci",
      "age": "26",
      "location": "Delta, Nigeria",
      "occupation": "Finance Analyst"
    },
    {
      "name": "Chyker",
      "last_name": "Halil",
      "age": "25",
      "location": "Kampala, Uganda",
      "occupation": "Social Media Influencer"
    },
    {
      "name": "Olushola",
      "last_name": "Ben",
      "age": "24",
      "location": "Kwara, Nigeria",
      "occupation": "Freelance Photographer"
    },
    {
      "name": "Olayemi",
      "last_name": "Eazy",
      "age": "23",
      "location": "Dubai, UAE",
      "occupation": "Marketer"
    },
    {
      "name": "Temi",
      "last_name": "Onye",
      "age": "22",
      "location": "LA, USA",
      "occupation": "Accountant"
    },
  ];
}
