import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../translations/local_keys.g.dart';

List<Map> generaded = [];

class ExerciseCategories extends ChangeNotifier {
  ExerciseCategories();
  // an iterater to access each value of List

  List containerData = [
    {
      'exerciseCategoryImage': 'assets/images/cat0n.png',
      'exerciseCategoryName': LocaleKeys.ABs.tr(),
      "SubExercises": [
        {
          "Img":
              'https://images.unsplash.com/photo-1545346315-f4c47e3e1b55?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGFic3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
          "V_url": "RD_A-Z15ER4",
          "Name": "Hanging Knee Raise",
          "Details":
              "The hanging knee raise is an effective exercise that primarily targets the muscles of the abdominal region, particularly the lower abs. It is often performed using a pull-up bar or a set of parallel bars, which allows for hanging from the hands while lifting the knees.  "
        },
        {
          "Img":
              'https://images.unsplash.com/photo-1601986313624-28c11ac26334?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YWJzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
          "V_url": "7FwGZ8qY5OU",
          "Name": "Hanging Straight Leg Raise",
          "Details":
              "The hanging straight leg raise is a challenging abdominal exercise that targets the lower abs, hip flexors, and core muscles. It is performed by hanging from a pull-up bar or parallel bars while lifting the legs straight up towards the ceiling. Here's a short description of the hanging straight leg raise"
        },
        {
          "Img":
              'https://images.unsplash.com/photo-1577221084712-45b0445d2b00?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YWJzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
          "V_url": "-OUSBPnHvsQ",
          "Name": "Machine Crunch",
          "Details":
              "Machine crunches are a popular exercise for targeting and strengthening the abdominal muscles. Unlike traditional crunches done on the floor, machine crunches involve using a specialized machine that provides resistance and support. Here's a brief description of machine crunches:"
        },
      ],
    },
    {
      'exerciseCategoryImage': 'assets/images/cat1n.png',
      'exerciseCategoryName': LocaleKeys.Back.tr(),
      "SubExercises": [
        {
          "Img":
              "https://fitnessup.online/wp-content/uploads/2022/01/photo-1605296867424-35fc25c9212a.jpeg",
          "V_url": "8ygapPMYK1I",
          "Name": "Assisted Normal Grip Pullup",
          "Details":
              "Assisted normal grip pull-ups are a modified version of the traditional pull-up exercise that provide assistance for individuals who may not have the strength to perform full pull-ups yet. This variation allows you to gradually build strength in your back, shoulders, and arms. Here's a brief description of assisted normal grip pull-ups"
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqYbUX0WJFHrkCIfZBPj8q5YoJE5T8EG71yyOQd_AUmkpJjIws5mmWo_SXQigvSuAjZmY&usqp=CAU',
          "V_url": "GdsRZAeeDUc",
          "Name": "Assisted Parallel Pullup",
          "Details":
              "An assisted parallel pull-up refers to a variation of the pull-up exercise that utilizes assistance to make it more achievable for individuals who may not have the strength to perform full parallel pull-ups yet. The exercise typically involves using resistance bands or an assisted pull-up machine to provide assistance during the movement."
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxSwjovKmmAtpa1mj14gYjC85X3S1XIyUdzA&usqp=CAU',
          "V_url": "0UBRfiO4zDs",
          "Name": "Chest Supported Row",
          "Details":
              "The chest supported row is a compound exercise that primarily targets the muscles of the back, particularly the rhomboids, rear delts, and middle traps. It also engages the biceps and forearms as secondary muscles. The exercise is typically performed using a chest supported row machine or a bench set at an incline angle with dumbbells. Here's a description of the chest supported row"
        },
      ],
    },
    {
      'exerciseCategoryImage': 'assets/images/cat2n.png',
      'exerciseCategoryName': LocaleKeys.Biceps.tr(),
      "SubExercises": [
        {
          "Img":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrs6noMJGSd8NBfmrwex96APUX14qHBKd6-Q&usqp=CAU",
          "V_url": "iixND1P2lik",
          "Name": "Alternating Dumbbell Curl",
          "Details":
              "The alternating dumbbell curl is a popular exercise that primarily targets the biceps, with secondary involvement from the forearms and brachialis muscles. It is a unilateral exercise, meaning it works one arm at a time. Here's a description of the alternating dumbbell curl"
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOWUWmgyKrTgq5pKqbU-pLTSXxPXmWdlUwXQ&usqp=CAU',
          "V_url": "pUS6HBQjRmc",
          "Name": "Barbell Curl Narrow Grip",
          "Details":
              "The barbell curl with a narrow grip is a variation of the traditional barbell curl exercise that targets the biceps, brachialis, and forearms. By using a narrower grip, you place more emphasis on the inner portion of the biceps. Here's a description of the barbell curl with a narrow grip."
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLRPprnpfb2qrmB-WLwE5lMbUsvYIy1IBnbRvA5oNNPA70Mo6ZRl0Fdva1XBTro7Kzm1I&usqp=CAU',
          "V_url": "ke2shAeQ0O8",
          "Name": "Dumbbell Spider Curl",
          "Details":
              "The dumbbell spider curl is a variation of the traditional bicep curl exercise that targets the biceps brachii muscles. It specifically emphasizes the short head of the biceps and helps to isolate and develop the peak of the biceps. Here's a description of the dumbbell spider curl"
        },
      ]
    },
    {
      'exerciseCategoryImage': 'assets/images/cat3n.png',
      'exerciseCategoryName': LocaleKeys.Calf.tr(),
      "SubExercises": [
        {
          "Img":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSD6CqCaJn75tRdNq8PKwtqV_UG4ce1D3UUEg&usqp=CAU",
          "V_url": "N3awlEyTY98",
          "Name": "Calf Machine",
          "Details":
              "The calf machine, also known as a calf raise machine or calf raise apparatus, is a piece of exercise equipment commonly found in gyms and fitness centers. Its primary function is to target and strengthen the calf muscles, which are located on the back of the lower leg.The calf machine typically consists of a platform or footpad where the user places their feet. This platform is attached to a lever or weight stack system that allows the user to lift the weight by raising their heels, thus engaging the calf muscles. Some calf machines have adjustable seats or pads to accommodate users of different heights."
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQB0sLXIRc_nTsCT6Yi3cdmoWjvy4cHVyWdw&usqp=CAU',
          "V_url": "KxEYX_cuesM",
          "Name": "Leg Press Calves",
          "Details":
              "Leg press calves, also known as calf raises on a leg press machine, is an exercise variation that targets the calf muscles using a leg press apparatus. While the leg press machine is typically used for working the leg muscles, you can also modify it to focus on the calves by adjusting your foot position and range of motion."
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTEJtEvfcSa9Tz0wISu6eW3mV_-h9Bvj1qBg&usqp=CAU',
          "V_url": "ke2shAeQ0O8",
          "Name": "Single Leg Stair Claves",
          "Details":
              "Maintain control throughout the exercise, avoiding any jerking or bouncing movements.Focus on using the strength of your calf muscle to raise your heel, rather than relying too much on momentum.Keep your foot and ankle aligned in a neutral position throughout the movement.Use the railing or a wall for support if you need assistance with balance.Adjust the range of motion by lowering your heel more or less depending on your comfort and flexibility."
        },
      ]
    },
    {
      'exerciseCategoryImage': 'assets/images/cat4n.png',
      'exerciseCategoryName': LocaleKeys.Chest.tr(),
      "SubExercises": [
        {
          "Img":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrs6noMJGSd8NBfmrwex96APUX14qHBKd6-Q&usqp=CAU",
          "V_url": "iixND1P2lik",
          "Name": "Alternating Dumbbell Curl",
          "Details":
              "The alternating dumbbell curl is a popular exercise that primarily targets the biceps, with secondary involvement from the forearms and brachialis muscles. It is a unilateral exercise, meaning it works one arm at a time. Here's a description of the alternating dumbbell curl"
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOWUWmgyKrTgq5pKqbU-pLTSXxPXmWdlUwXQ&usqp=CAU',
          "V_url": "pUS6HBQjRmc",
          "Name": "Barbell Curl Narrow Grip",
          "Details":
              "The barbell curl with a narrow grip is a variation of the traditional barbell curl exercise that targets the biceps, brachialis, and forearms. By using a narrower grip, you place more emphasis on the inner portion of the biceps. Here's a description of the barbell curl with a narrow grip."
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTEJtEvfcSa9Tz0wISu6eW3mV_-h9Bvj1qBg&usqp=CAU',
          "V_url": "ke2shAeQ0O8",
          "Name": "Dumbbell Spider Curl",
          "Details":
              "The dumbbell spider curl is a variation of the traditional bicep curl exercise that targets the biceps brachii muscles. It specifically emphasizes the short head of the biceps and helps to isolate and develop the peak of the biceps. Here's a description of the dumbbell spider curl"
        },
      ]
    },
    {
      'exerciseCategoryImage': 'assets/images/cat5n.png',
      'exerciseCategoryName': LocaleKeys.Forearm.tr(),
      "SubExercises": [
        {
          "Img":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkK7R7PxU4Y3pbS0z27crtGfN7akGcj2vvyQ&usqp=CAU",
          "V_url": " WVAaKJvToe0",
          "Name": "Cable Wrist Curl",
          "Details":
              "The cable wrist curl is an exercise commonly used to target the muscles of the forearms and wrists. It is an isolation exercise that focuses on building strength and improving the flexibility of the wrist joint. This exercise is popular among athletes, weightlifters, and those involved in grip-intensive sport Here's how you can perform the cable wrist curl:Equipment needed:A cable machine with a low pulley attachment A straight bar or an EZ-bar attachment.."
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTestmooZQvMgK40VDlNfwLr64oyERr_UFK2g&usqp=CAU',
          "V_url": "2wPpcJBe03o",
          "Name": "Dumbbell Bench Wrist Curl",
          "Details":
              "The dumbbell bench wrist curl is an exercise that primarily targets the muscles of the forearms and wrists. It is a variation of the wrist curl exercise that allows you to isolate and strengthen the forearm flexors while providing support for your upper body. This exercise is commonly performed on a flat bench using dumbbells.Here's how you can perform the dumbbell bench wrist curl:Equipment needed:A flat benchDumbbells of appropriate weight."
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnEsCahGE-JD7e9coG7u0P_xUOHwH6JUdSAw&usqp=CAU',
          "V_url": "iQ4JjOK73PE",
          "Name": "Dumbbell Standing Wrist Curl",
          "Details":
              "The dumbbell standing wrist curl is an exercise that targets the muscles of the forearms and wrists. It is similar to the dumbbell bench wrist curl, but performed in a standing position, which adds an element of stabilization and engages the core muscles as well. This exercise can help strengthen your grip and improve forearm strength and flexibility."
        },
      ]
    },
    {
      'exerciseCategoryImage': 'assets/images/cat6n.png',
      'exerciseCategoryName': LocaleKeys.Legs.tr(),
      "SubExercises": [
        {
          "Img":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrl69nPiy_bmQzCDFHNOaRkFHbCjeyvfMpww&usqp=CAU",
          "V_url": "-eO_VydErV0",
          "Name": "Feet Forward Smith Squat",
          "Details":
              "The feet forward Smith squat is a variation of the traditional squat exercise that involves using a Smith machine. It primarily targets the muscles of the lower body, including the quadriceps, hamstrings, and glutes. The feet forward position places more emphasis on the quads compared to the standard squat.Here's how you can perform the feet forward Smith squat: Equipment needed: Smith machine"
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOWUWmgyKrTgq5pKqbU-pLTSXxPXmWdlUwXQ&usqp=CAU',
          "V_url": "0DQvn2qsOG4",
          "Name": "Front Squat Cross Grip",
          "Details":
              "The front squat with a cross grip, also known as the clean grip or Olympic grip, is a variation of the front squat exercise that involves holding the barbell across the front of your shoulders with your arms crossed. This grip allows for greater control and stability of the barbell during the squat movement. Here's how you can perform the front squat with a cross grip: Equipment needed:Barbell Weight plates Power rack or squat rack."
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuZ8eHpiycuhb9riU8EgBUzqxhq9wmIPCJMg&usqp=CAU',
          "V_url": "rYgNArpwE7E",
          "Name": "Hack Squat",
          "Details":
              "The hack squat is a lower body exercise that primarily targets the quadriceps muscles, but also engages the hamstrings and glutes. It is performed using a hack squat machine or a barbell. Here's how you can perform the hack squat using a machine:"
        },
      ]
    },
    {
      'exerciseCategoryImage': 'assets/images/cat7n.png',
      'exerciseCategoryName': LocaleKeys.Shoulders.tr(),
      "SubExercises": [
        {
          "Img":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrs6noMJGSd8NBfmrwex96APUX14qHBKd6-Q&usqp=CAU",
          "V_url": "iixND1P2lik",
          "Name": "Alternating Dumbbell Curl",
          "Details":
              "The alternating dumbbell curl is a popular exercise that primarily targets the biceps, with secondary involvement from the forearms and brachialis muscles. It is a unilateral exercise, meaning it works one arm at a time. Here's a description of the alternating dumbbell curl"
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOWUWmgyKrTgq5pKqbU-pLTSXxPXmWdlUwXQ&usqp=CAU',
          "V_url": "pUS6HBQjRmc",
          "Name": "Barbell Curl Narrow Grip",
          "Details":
              "The barbell curl with a narrow grip is a variation of the traditional barbell curl exercise that targets the biceps, brachialis, and forearms. By using a narrower grip, you place more emphasis on the inner portion of the biceps. Here's a description of the barbell curl with a narrow grip."
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOWUWmgyKrTgq5pKqbU-pLTSXxPXmWdlUwXQ&usqp=CAU',
          "V_url": "ke2shAeQ0O8",
          "Name": "Dumbbell Spider Curl",
          "Details":
              "The dumbbell spider curl is a variation of the traditional bicep curl exercise that targets the biceps brachii muscles. It specifically emphasizes the short head of the biceps and helps to isolate and develop the peak of the biceps. Here's a description of the dumbbell spider curl"
        },
      ]
    },
    {
      'exerciseCategoryImage': 'assets/images/cat8n.png',
      'exerciseCategoryName': LocaleKeys.Triceps.tr(),
      "SubExercises": [
        {
          "Img":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSIqcGMId-ys6u5pgk3p1b9YocOdKSyyzPiA&usqp=CAU",
          "V_url": "q5X9thiKofE",
          "Name": "Barbell Triceps Overhead Extension",
          "Details":
              "ChatGPT The barbell triceps overhead extension, also known as the barbell skull crusher, is an effective exercise for targeting the triceps muscles. It primarily focuses on the long head of the triceps, which is responsible for the size and overall development of the muscle group. This exercise is typically performed using a barbell, but it can also be done with an EZ-bar or dumbbells.Here's how you can perform the barbell triceps overhead extension:Equipment needed:Barbell and weightsWeight bench (optional)"
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiLCTj4REOfyIHxRDVr4PINtTRODR7B78mJw&usqp=CAU',
          "V_url": "yZ83t4mrPrI",
          "Name": "Assisted Dip",
          "Details":
              "Assisted dips are a variation of the traditional dip exercise that can help individuals gradually build strength in their upper body, particularly the chest, shoulders, and triceps. Assisted dips involve using a machine or assistance from a resistance band to offset a portion of your body weight, making the exercise more manageable for those who may not yet have the strength to perform full bodyweight dips.Here's how you can perform assisted dips:Equipment needed:Dip machine or resistance band."
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN-0dhx4NeZjI7Cc00fag0U1ojcUts8Esexg&usqp=CAU',
          "V_url": "ke2shAeQ0O8",
          "Name": "Barbell Skullcrusher",
          "Details":
              "The barbell skull crusher, also known as the lying triceps extension or barbell triceps extension, is an exercise that primarily targets the triceps muscles. It is an effective compound movement that helps build strength and size in the triceps while also engaging the shoulders and chest to a lesser extent.Here's how you can perform the barbell skull crusher: Equipment needed: Barbell Weight plates Weight bench (optional)"
        },
      ]
    },
    {
      'exerciseCategoryImage': 'assets/images/cat9n.png',
      'exerciseCategoryName': LocaleKeys.All.tr(),
      "SubExercises": [
        {
          "Img":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrs6noMJGSd8NBfmrwex96APUX14qHBKd6-Q&usqp=CAU",
          "V_url": "iixND1P2lik",
          "Name": "Alternating Dumbbell Curl",
          "Details":
              "The alternating dumbbell curl is a popular exercise that primarily targets the biceps, with secondary involvement from the forearms and brachialis muscles. It is a unilateral exercise, meaning it works one arm at a time. Here's a description of the alternating dumbbell curl"
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOWUWmgyKrTgq5pKqbU-pLTSXxPXmWdlUwXQ&usqp=CAU',
          "V_url": "pUS6HBQjRmc",
          "Name": "Barbell Curl Narrow Grip",
          "Details":
              "The barbell curl with a narrow grip is a variation of the traditional barbell curl exercise that targets the biceps, brachialis, and forearms. By using a narrower grip, you place more emphasis on the inner portion of the biceps. Here's a description of the barbell curl with a narrow grip."
        },
        {
          "Img":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOWUWmgyKrTgq5pKqbU-pLTSXxPXmWdlUwXQ&usqp=CAU',
          "V_url": "ke2shAeQ0O8",
          "Name": "Dumbbell Spider Curl",
          "Details":
              "The dumbbell spider curl is a variation of the traditional bicep curl exercise that targets the biceps brachii muscles. It specifically emphasizes the short head of the biceps and helps to isolate and develop the peak of the biceps. Here's a description of the dumbbell spider curl"
        },
      ]
    },
  ];

  int selectedCategoryIndex = 0;
  void changeIndex(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  int SubselectedCategoryIndex = 0;
  void changeIndexSub(int index) {
    SubselectedCategoryIndex = index;
    notifyListeners();
  }

  ListGenarater(int index) {
    List<Map> temp;
    // an iterater to access each value of List
    containerData.forEach((Items) {
      generaded.add(Items["SubExercises"][index]);
    });
  }

  cleaner() {
    generaded.clear();
  }

  List<Map> Scheduller = [
    {
      "title": "Weak one",
      "rep": 10,
      "Excersise": [
        {
          "day": "Moonday",
          "todo": generaded,
        },
        {
          "day": "Tusday",
          "todo": generaded,
        },
        {
          "day": "Wednsday",
          "todo": generaded,
        },
        {
          "day": "Thursday",
          "todo": generaded,
        },
        {
          "day": "Friday",
          "todo": generaded,
        },
        {
          "day": "SaterDay",
          "todo": generaded,
        }
      ]
    },
    {
      "title": "Weak Two",
      "rep": 15,
      "Excersise": [
        {
          "day": "Moonday",
          "todo": generaded,
        },
        {
          "day": "Tusday",
          "todo": generaded,
        },
        {
          "day": "Wednsday",
          "todo": generaded,
        },
        {
          "day": "Thursday",
          "todo": generaded,
        },
        {
          "day": "Friday",
          "todo": generaded,
        },
        {
          "day": "SaterDay",
          "todo": generaded,
        }
      ]
    },
    {
      "title": "Weak Three",
      "rep": 20,
      "Excersise": [
        {
          "day": "Moonday",
          "todo": generaded,
        },
        {
          "day": "Tusday",
          "todo": generaded,
        },
        {
          "day": "Wednsday",
          "todo": generaded,
        },
        {
          "day": "Thursday",
          "todo": generaded,
        },
        {
          "day": "Friday",
          "todo": generaded,
        },
        {
          "day": "SaterDay",
          "todo": generaded,
        }
      ]
    },
    {
      "title": "Weak Fourth",
      "rep": 25,
      "Excersise": [
        {
          "day": "Moonday",
          "todo": generaded,
        },
        {
          "day": "Tusday",
          "todo": generaded,
        },
        {
          "day": "Wednsday",
          "todo": generaded,
        },
        {
          "day": "Thursday",
          "todo": generaded,
        },
        {
          "day": "Friday",
          "todo": generaded,
        },
        {
          "day": "SaterDay",
          "todo": generaded,
        }
      ]
    },
  ];
  int weekIndicatorIndex = 0;
  void WeekChangerIndex(int index) {
    weekIndicatorIndex = index;
    notifyListeners();
  }

  int selectedWorkOutIndex = 0;
  void changeWorkoutIndex(int index) {
    selectedWorkOutIndex = index;
    notifyListeners();
  }

  int SubselectedWorkOutIndex = 0;
  void changeSubWorkIndexSub(int index) {
    SubselectedWorkOutIndex = index;
    notifyListeners();
  }

  int todoIndex = 0;

  void todoIndexadder() {
    todoIndex += 1;
    notifyListeners();
  }

  void todoIndexReset() {
    todoIndex = 0;
    notifyListeners();
  }
  // this id the end of the class
}
