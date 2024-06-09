import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mlwbd/components/my_carousel_slider.dart';
import 'package:mlwbd/components/my_drawer.dart';
import 'package:mlwbd/components/my_tab_bar.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage>
    with SingleTickerProviderStateMixin {
  Map? storeApiData;
  List<dynamic> userData = [];
  String url = "https://sancbyt.000webhostapp.com/mlwbd/movies";
  String errorMessage = "";

  Future<void> getData() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        setState(() {
          userData = responseData;
        });
      } else {
        setState(() {
          errorMessage =
              "Error: ${response.statusCode} ${response.reasonPhrase}";
        });
        debugPrint(errorMessage);
      }
    } catch (e) {
      setState(() {
        errorMessage = "Exception: $e";
      });
      debugPrint(errorMessage);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    tabController = TabController(length: 27, vsync: this);
  }

  late TabController tabController;

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // My Carousel Slider
    List<Widget> carouselSliders = List.generate(27, (index) {
      return MyCarouselSlider(
        userData: userData,
      );
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'lib/images/mlwbd_logo.png',
            height: 30,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
          bottom: MyTabBar(tabController: tabController)),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            // TabBarView with Carousel
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              height: 170,
              child: TabBarView(
                controller: tabController,
                children: carouselSliders,
              ),
            ),

            // Featured movies
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Featured text
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 5,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Featured',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      // Left right indicator button
                      Row(
                        children: [
                          GestureDetector(
                            child: const Icon(
                              Icons.arrow_left,
                              size: 30,
                            ),
                          ),
                          GestureDetector(
                            child: const Icon(
                              Icons.arrow_right,
                              size: 30,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
