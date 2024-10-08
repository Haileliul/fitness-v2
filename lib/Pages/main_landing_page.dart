import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../Provider/exercises_categories.dart';
import '../Widgets/grid_view_builder.dart';
import '../Widgets/BottomNavigationBar.dart';
import '../Widgets/notification.dart';

class MainLandingPage extends StatefulWidget {
  const MainLandingPage({Key? key}) : super(key: key);

  @override
  State<MainLandingPage> createState() => _MainLandingPageState();
}

class _MainLandingPageState extends State<MainLandingPage> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  } // final Notificationa notification = Notificationa();

  @override
  void dispose() {
    _focusNode.dispose(); // Dispose the focus node to avoid memory leaks
    super.dispose();
  }

  Future Refresh() async {
    await productUpdate.fetchData();
  }

  var productState;
  var productUpdate;
  @override
  Widget build(BuildContext context) {
    productState = Provider.of<ExerciseCategories>(context);
    productUpdate = Provider.of<ExerciseCategories>(context, listen: false);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(
          FocusNode(),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              notificationWidget.showscheduledNotification(
                  title: 'not title',
                  body: 'not body',
                  ScheduleTime: DateTime.now().add(Duration(seconds: 1)));
              productUpdate.fetchData();

              print("haha");
            },
            icon: const Icon(Icons.menu),
          ),
          title: const Text("Exercises"),
          centerTitle: true,
          actions: const [
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60'),
            ),
          ],
        ),

        /// delegate with configuration

        body: CustomRefreshIndicator(
          builder: MaterialIndicatorDelegate(
            builder: (context, controller) {
              return Icon(
                Icons.ac_unit,
                color: Colors.blue,
                size: 30,
              );
            },
          ),
          onRefresh: Refresh,
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 25),
                        child: TextField(
                          focusNode: _focusNode,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                left: 15.0, bottom: 8.0, top: 8.0),
                            suffixIcon: Icon(
                              FontAwesomeIcons.magnifyingGlass,
                              color: Colors.grey.shade600,
                            ),
                            constraints: const BoxConstraints(
                              maxHeight: 45.0,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFD9D9D9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintText: 'Search... Sweat... Repeat!',
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GridViewBuilder(),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomnavigationBar(),
      ),
    );
  }
}
