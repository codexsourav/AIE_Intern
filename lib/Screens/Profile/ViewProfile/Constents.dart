import 'package:flutter/material.dart';

Map viewProfileTabs = {
  "Student": {
    'bgcolor': const Color.fromARGB(255, 255, 251, 230),
    "darkcolor": const Color.fromARGB(255, 254, 214, 0),
    "tabs": [
      {
        "tabtitle": "Profile",
        "dbindex": "profile",
      },
      {
        "tabtitle": "Academics",
        "dbindex": "Academics",
      },
      {
        "tabtitle": "Attendance",
        "dbindex": "Attendance",
      },
      {
        "tabtitle": "Performance",
        "dbindex": "Performance",
      },
    ],
  },
  "Teacher": {
    'bgcolor': const Color.fromARGB(255, 250, 237, 239),
    "darkcolor": const Color.fromARGB(255, 211, 76, 97),
    "tabs": [
      {
        "tabtitle": "Profile",
        "dbindex": "profile",
      },
      {
        "tabtitle": "Academics",
        "dbindex": "Academics",
      },
      {
        "tabtitle": "Attendance",
        "dbindex": "Attendance",
      },
      {
        "tabtitle": "Performance",
        "dbindex": "Performance",
      },
    ],
  },
  "Parent": {
    'bgcolor': const Color(0xFFEEFCF3),
    "darkcolor": const Color(0xFF56E484),
    "tabs": [
      {
        "tabtitle": "Profile",
        "dbindex": "profile",
      },
      {
        "tabtitle": "Performance",
        "dbindex": "Performance",
      },
    ],
  },
  "management": {
    'bgcolor': const Color(0xFFEBE4F5),
    "darkcolor": const Color(0xFF9163D7),
    'tabs': [
      {
        "tabtitle": "Profile",
        "dbindex": "profile",
      },
      {
        "tabtitle": "School performace",
        "dbindex": "Performance",
      },
    ]
  }
};
