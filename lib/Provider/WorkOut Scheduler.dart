import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkOutProvider extends ChangeNotifier {
  List<Map> Scheduller = [
    {
      "title": "Weak one",
      "Excersise": [
        {
          "day": "Moonday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "Tusday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "Wednsday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "Thursday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "Friday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "SaterDay",
          "todo": ["running", "jumping", "walking", "helping"],
        }
      ]
    },
    {
      "title": "Weak Two",
      "Excersise": [
        {
          "day": "Moonday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "Tusday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "Wednsday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "Thursday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "Friday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "SaterDay",
          "todo": ["running", "jumping", "walking", "helping"],
        }
      ]
    },
    {
      "title": "Weak Three",
      "Excersise": [
        {
          "day": "Moonday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "Tusday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "Wednsday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "Thursday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "Friday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "SaterDay",
          "todo": ["running", "jumping", "walking", "helping"],
        }
      ]
    },
    {
      "title": "Weak Fourth",
      "Excersise": [
        {
          "day": "Moonday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "Tusday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "Wednsday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "Thursday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "Friday",
          "todo": ["running", "jumping", "walking", "helping"],
        },
        {
          "day": "SaterDay",
          "todo": ["running", "jumping", "walking", "helping"],
        }
      ]
    },
  ];

  int selectedWorkOutIndex = 0;
  void changeIndex(int index) {
    selectedWorkOutIndex = index;
    notifyListeners();
  }

  int SubselectedWorkOutIndex = 0;
  void changeIndexSub(int index) {
    SubselectedWorkOutIndex = index;
    notifyListeners();
  }
}
