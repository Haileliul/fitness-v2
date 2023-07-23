import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/exercises_categories.dart';

class GridViewBuilder extends StatelessWidget {
  var productState;
  var productStateModifier;

  GridViewBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    productState = Provider.of<ExerciseCategories>(context);
    productStateModifier =
        Provider.of<ExerciseCategories>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: const Color(0xFFE81818),
        child: GridView.builder(
          itemCount: productState.containerData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/SportCat',
                    arguments: {"Index": index},
                  );

                  productStateModifier.changeIndex(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade500,
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Opacity(
                        opacity: 0.45,
                        child: Image.asset(
                          productState.containerData[index]
                              ["exerciseCategoryImage"],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Text(
                          productState.containerData[index]
                              ["exerciseCategoryName"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
