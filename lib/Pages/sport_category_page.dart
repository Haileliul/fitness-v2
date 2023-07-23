import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/constants.dart';
import '../Provider/exercises_categories.dart';

int activeIndex = 0;


class SportsCategory extends StatefulWidget {
  const SportsCategory({Key? key}) : super(key: key);

  @override
  State<SportsCategory> createState() => _SportsCategoryState();
}

class _SportsCategoryState extends State<SportsCategory> {
  var productState;
  var productStateModifier;
  @override
  Widget build(BuildContext context) {
    productState = Provider.of<ExerciseCategories>(context);
    productStateModifier =
        Provider.of<ExerciseCategories>(context, listen: false);
    final Map arg = ModalRoute.of(context)?.settings.arguments as Map;
    // final int val = arg["Index"];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${productState.containerData[productState.selectedCategoryIndex]["exerciseCategoryName"]}',
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarouselSlider.builder(
            itemCount: productState
                .containerData[productState.selectedCategoryIndex]
                    ["SubExercises"]
                .length,
            itemBuilder: (context, index, realIndex) {
              return SizedBox(
                width: double.infinity,
                child: Image.network(
                  productState.containerData[productState.selectedCategoryIndex]
                      ["SubExercises"][index]["Img"],
                  fit: BoxFit.cover,
                ),
              );
            },
            options: CarouselOptions(
              height: 250,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
          ),
          const SizedBox(height: 10),
          buildIndicator(productState.selectedCategoryIndex),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: GridView.builder(
                itemCount: productState
                    .containerData[productState.selectedCategoryIndex]
                        ["SubExercises"]
                    .length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/Detail',
                              arguments: {
                                "Index": index,
                              },
                            );
                            productStateModifier.changeIndexSub(index);
                          },
                          child: Image.network(
                            productState.containerData[
                                    productState.selectedCategoryIndex]
                                ["SubExercises"][index]["Img"],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator(int val) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedSmoothIndicator(
            effect: const ExpandingDotsEffect(
              dotColor: Colors.white,
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: kSecondaryColor,
            ),
            activeIndex: activeIndex,
            count: productState.containerData[val]["SubExercises"].length,
          ),
        ],
      );
}

Widget buildImage(String urlImage, int index) => SizedBox(
      width: double.infinity,
      child: Image.network(
        urlImage,
        fit: BoxFit.cover,
      ),
    );
