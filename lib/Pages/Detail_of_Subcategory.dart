import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_slide/we_slide.dart';
// import '../Widgets/animatedIcon.dart';
import '../Widgets/backButton.dart';
import '../Widgets/YotubePlayerPage.dart';
import '../Provider/exercises_categories.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';

class DetailSubList extends StatelessWidget {
  var productState;
  var productStateModifier;

  DetailSubList({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //create a new player
    // final assetsAudioPlayer = AssetsAudioPlayer();
    productState = Provider.of<ExerciseCategories>(context);

    Provider.of<ExerciseCategories>(context, listen: false);
    return Scaffold(
      body: WeSlide(
        hideAppBar: true,
        panelMaxSize: size.height,
        panelMinSize: size.height * 0.1,
        appBarHeight: 55,
        body: Container(
          decoration: const BoxDecoration(
              // color: Colors.white.withOpacity(0.4),
              ),
          child: Column(
            children: [
              Expanded(
                flex: 17,
                child: Container(
                  decoration: const BoxDecoration(
                    // color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      youtubplayer(
                          myVideoId: productState.containerData[productState
                                  .selectedCategoryIndex]["SubExercises"]
                              [productState.SubselectedCategoryIndex]["V_url"]),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: Image.network(
                                  "${productState.containerData[productState.selectedCategoryIndex]["SubExercises"][productState.SubselectedCategoryIndex]["Img"]}"),
                              title: Text(
                                  "${productState.containerData[productState.selectedCategoryIndex]["SubExercises"][productState.SubselectedCategoryIndex]["Name"]}"),
                              subtitle: const Text("this is detaile"),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28.0,
                                vertical: 20,
                              ),
                              child: Text(
                                  "${productState.containerData[productState.selectedCategoryIndex]["SubExercises"][productState.SubselectedCategoryIndex]["Details"]}"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // here will the music go
            ],
          ),
        ),
        appBar: AppBar(),
        panel: Expanded(
          child: Container(
            color: Colors.transparent,
            width: size.width,
            child: Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                    )),
                const Text("This is the Panel Part "),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Click me "),
                ),
              ],
            ),
          ),
        ),
        panelHeader: Container(
          width: size.width,
          height: size.height,
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
          child: Row(
            children: [
              // AnimatedIcon(icon: , progress: progress)
            ],
          ),
        ),
      ),
    );
  }
}
