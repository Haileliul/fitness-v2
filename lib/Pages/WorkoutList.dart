import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quickalert/quickalert.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:fan_side_drawer/fan_side_drawer.dart';
import 'package:provider/provider.dart';
import 'package:side_sheet/side_sheet.dart';
import '../Provider/exercises_categories.dart';

class WorkoutList extends StatefulWidget {
  WorkoutList({
    super.key,
  });
  static String myVideoId = 'T_X5rb3G5lk';

  @override
  State<WorkoutList> createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: WorkoutList.myVideoId,
    flags: const YoutubePlayerFlags(
      // autoPlay: true,

      mute: false,
      autoPlay: false,
      disableDragSeek: false,
      loop: true,
      isLive: false,
      forceHD: false,
      /*  enableCaption: true, */
      hideThumbnail: true,
    ),
  );

//  drower lists
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<DrawerMenuItem> get menuItems => [
        DrawerMenuItem(
            title: '${todo[0]["Name"]}',
            icon: Icons.radio_button_checked,
            iconSize: 15,
            onMenuTapped: () {
              print("drower must closed");
            }),
        DrawerMenuItem(
            title: '${todo[1]["Name"]}',
            icon: Icons.radio_button_checked,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: '${todo[3]["Name"]}',
            icon: Icons.radio_button_checked,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: '${todo[4]["Name"]}',
            icon: Icons.radio_button_checked,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: '${todo[5]["Name"]}',
            icon: Icons.radio_button_checked,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: '${todo[6]["Name"]}',
            icon: Icons.radio_button_checked,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: '${todo[7]["Name"]}',
            icon: Icons.radio_button_checked,
            iconSize: 15,
            onMenuTapped: () {}),
      ];

  var WorkoutState;
  var WorkoutUpdater;
  var todo;
  var IdTodo = 0;
  late double rate;
  var weak;
  var todoIndex;
  double endvalue = 1;
  @override
  Widget build(BuildContext context) {
    WorkoutState = Provider.of<ExerciseCategories>(context);
    WorkoutUpdater = Provider.of<ExerciseCategories>(context, listen: false);
    todo = WorkoutState.Scheduller[WorkoutState.weekIndicatorIndex]["Excersise"]
        [WorkoutState.selectedWorkOutIndex]["todo"];
    weak = WorkoutState.Scheduller[WorkoutState.weekIndicatorIndex];
    todoIndex = WorkoutState.todoIndex;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Directionality(
        textDirection: TextDirection.rtl,
        child: Drawer(
          width: 200,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: FanSideDrawer(
              drawerType: DrawerType.pipe,
              menuItems: menuItems,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();

            WorkoutUpdater.todoIndexReset();
            WorkoutUpdater.cleaner();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // scaffoldKey.currentState!.openEndDrawer();
              /*  SideSheet.right(
                body: Container(
                  margin: EdgeInsets.only(top: 60, left: 10, bottom: 20),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          Icons.radio_button_checked,
                          color: Colors.white70,
                          size: 20,
                        ),
                      );
                    },
                  ),
                ),
                context: context,
                sheetColor: kDefaultIconDarkColor,
                width: size.width * 0.4,
                barrierDismissible: true,
              ); */
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Work Out",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      // here it is

                      "${todo[todoIndex]["Name"]}",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "${todoIndex + 1}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFA70808),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "/",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "${WorkoutState.Scheduller[WorkoutState.weekIndicatorIndex]["Excersise"][WorkoutState.selectedWorkOutIndex]["todo"].length}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "workouts",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 25,
                bottom: 7,
              ),
              width: size.width,
              height: size.height * 0.3,
              child: YoutubePlayer(
                controller: _controller,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "${todo[todoIndex]["Name"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Next:  "),
                        Text(
                          "${todo[todoIndex + 1]["Name"]}",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: indicaor(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${weak["rep"]}x",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  " reps ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // this is the place for Next set Button and Next Exercise
                  Container(
                    height: 48,
                    width: 124,
                    margin: const EdgeInsets.only(left: 0, top: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(56),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFF43800),
                          Color.fromRGBO(244, 56, 0, 0),
                          Color(0xFFF43800),
                        ],
                        stops: [0.0153, 0.9821, 0.9821],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(56),
                        ),
                      ),
                      child: Text(
                        "Click me",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 48,
                    width: 124,
                    margin: const EdgeInsets.only(left: 0, top: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(56),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(244, 56, 0, 0),
                          Color(0xFFF43800),
                          Color(0xFFF43800),
                        ],
                        stops: [0.0153, 0.9821, 0.9821],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(56),
                        ),
                      ),
                      child: Text(
                        "Click me",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class indicaor extends StatefulWidget {
  const indicaor({super.key});

  @override
  State<indicaor> createState() => _indicaorState();
}

class _indicaorState extends State<indicaor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation animation;

  _showPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("hi"),
          actions: [
            Text("this "),
            Text("and this "),
            TextButton(
              onPressed: () {
                print("hellow dialoge");
                Navigator.pop(context);
                todoAdder();
                _controller.reset();
                _controller.forward();
              },
              child: Text("Next"),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _controller.forward();
    _controller.addListener(() {
      print(_controller.value);
      setState(() {});
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _showPopup();
      }
    });
  }

  late var WorkoutState;
  late var WorkoutUpdater;
  var weak;
  var todoIndex;
  var todoAdder;
  @override
  Widget build(BuildContext context) {
    WorkoutState = Provider.of<ExerciseCategories>(context);
    WorkoutUpdater = Provider.of<ExerciseCategories>(context, listen: false);
    weak = WorkoutState.Scheduller[WorkoutState.weekIndicatorIndex];
    int indicate = (_controller.value * weak["rep"]).toInt();
    todoIndex = WorkoutState.todoIndex;
    todoAdder = WorkoutUpdater.todoIndexadder;
    return CircularPercentIndicator(
      radius: 60,
      lineWidth: 15,
      percent: _controller.value,
      progressColor: const Color(0xFFA70808),
      backgroundColor: Colors.white,
      circularStrokeCap: CircularStrokeCap.round,
      center: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${indicate}",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFFA70808),
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "/",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "${weak["rep"]}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
