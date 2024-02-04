import 'dart:convert';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../Provider/exercises_categories.dart';

class MainCategory extends StatefulWidget {
  const MainCategory({Key? key}) : super(key: key);

  @override
  State<MainCategory> createState() => _MainCategoryState();
}

class _MainCategoryState extends State<MainCategory> {
  var productState;
  var productStateModifier;
  List<Map<String, dynamic>> mainList = [];

  Future<void> fetchData() async {
    const url =
        "https://fitness-backend-production-a63d.up.railway.app/showfitts";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final data = jsonDecode(response.body);
    setState(() {
      mainList = List<Map<String, dynamic>>.from(data);
    });
  }

  @override
  void initState() {
    fetchData(); // Fetch data when the page is first initialized
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    productState = Provider.of<ExerciseCategories>(context);
    productStateModifier =
        Provider.of<ExerciseCategories>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: const Text("Exercises"),
        centerTitle: true,
        actions: const [
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 25,
                    ),
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                          left: 15.0,
                          bottom: 8.0,
                          top: 8.0,
                        ),
                        suffixIcon: Icon(
                          FontAwesomeIcons.search,
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
          ),
          Expanded(
            child: CustomMaterialIndicator(
              onRefresh: fetchData, // Your refresh logic
              indicatorBuilder: (context, controller) {
                return const Icon(
                  Icons.ac_unit,
                  color: Colors.blue,
                  size: 30,
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GlowingOverscrollIndicator(
                  axisDirection: AxisDirection.down,
                  color: const Color(0xFFE81818),
                  child: GridView.builder(
                    itemCount: mainList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
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
                                    // mainList[index]["exerciseCategoryImage"],
                                    productState.containerData[index]
                                        ["exerciseCategoryImage"],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    // mainList[index]["exerciseCategoryName"],
                                    productState.Language[index]
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
