import 'dart:ui';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

var _kPages = {
  'home': Icons.home,
  'map': Icons.map,
  'List': Image.asset('assets/img.png',
      height: 50, scale: 10, fit: BoxFit.fitHeight),
  'message': Image.asset('assets/bookmark.png'),
  'people': Icons.people,
};
var category_list = {
  1: "Films & Photography",
  2: "Party & Events",
  3: "Home & Outdoors",
  4: "Electronics",
  5: "Top Rentals",
  6: "Musical Instruments",
  7: "Cleaning Equipment",
  8: "Clothing & Accesories",
  9: "Heavy Machinery",
  10: "New to Market"
};

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TabStyle _tabStyle = TabStyle.reactCircle;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Text("Post \nAd", textAlign: TextAlign.center),
            hoverElevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.padded,
            elevation: 0,
            shape: CircleBorder(eccentricity: 1),
            backgroundColor: Color.fromRGBO(247, 208, 63, 1),
            onPressed: () {
              print("button pressed");
            }),
        body: Column(
          children: [
            const Divider(),
            Expanded(
              child: TabBarView(
                viewportFraction: 500,
                children: [
                  HomePage(),
                  Icon(Icons.map, size: 64),
                  Image.asset('assets/img.png', height: 10, scale: 4),
                  Image.asset('assets/bookmark.png'),
                  Icon(Icons.home, size: 64),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          // Optional badge argument: keys are tab indices, values can be
          // String, IconData, Color or Widget.
          // /*badge=*/ const <int, dynamic>{3: '99+'}
// curve: CatmullRomCurve.precompute([Offset(0.1, 0.9),Offset(0.9, 0.1)],tension: 1),
          height: 70, curveSize: 0, top: -30,
          backgroundColor: Colors.white,
          color: Colors.black,
          activeColor: Colors.black,
          style: TabStyle.fixed, shadowColor: Colors.transparent,

          items: <TabItem>[
            TabItem(
              icon: Container(
                  child: Image(
                image: AssetImage('assets/home.png'),
              )),
              title: "home",
              activeIcon: Image.asset('assets/home_active.png'),
            ),
            TabItem(
                icon: Image.asset('assets/chat.png'),
                title: "chats",
                activeIcon: Image.asset('assets/chat_active.png')),
            TabItem(
                icon: Image.asset('assets/img.png', scale: 0.2),
                title: "List",
                activeIcon: Image.asset('assets/img.png')),
            TabItem(
                icon: Image.asset('assets/bookmark.png'),
                title: "Bookings",
                activeIcon: Image.asset('assets/bookmark_active.png')),
            TabItem(
                icon: Image.asset('assets/people.png'),
                title: "Bookings",
                activeIcon: Image.asset('assets/people_active.png')),
          ],
          onTap: (int i) => print('click index=$i'),
        ),
      ),
    );
  }

  // Select style enum from dropdown menu:
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// scrollDirection: Axis.vertical,

          // shrinkWrap: false,
          // padding: EdgeInsets.symmetric(horizontal: 10),
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.88,
                child: Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 250,
              child: Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.88,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(112, 40, 228, 0.7),
                            Color.fromRGBO(255, 123, 112, 0.7),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(20)),
                  child: Image.asset('assets/homecard.png'),
                ),
                Positioned(
                    left: 28,
                    bottom: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,

                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 1,
                              offset: Offset(0, 2),
                              spreadRadius: 1)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // color: Colors.white,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: Colors.grey.shade400,
                          hintText: "Seach",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          suffixIcon: Icon(
                            Icons.mic,
                          ),
                          suffixIconColor: Colors.grey.shade400,
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ))
              ]),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.88,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        textBaseline: TextBaseline.alphabetic,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width * 0.9,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: category_list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 100,
                    crossAxisCount: 5),
                itemBuilder: (BuildContext context, int index) {
                  index = index + 1;
                  return Container(
                    height: 150,
                    width: 60,
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            height: 55,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/icons/$index.png',
                                fit: BoxFit.contain,
                              ),
                            )),
                        SizedBox(height: 8),
                        Text(
                          category_list[index]!,
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                        // SizedBox(height:7),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.88,
                child: Text(
                  "Chance to win",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width * 0.99,

              child: PageView(
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                // scrollBehavior: MaterialScrollBehavior(),
                controller: PageController(viewportFraction: 0.9, initialPage: 0),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Image.asset('assets/banner.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Image.asset('assets/banner.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Image.asset('assets/banner.png'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.88,
                child: Text(
                  "Chance to win",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 240,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: card,
                  );
                },
              ),
            ),
            Container(
              height: 400,
              width: 400,
              child: Image.asset('assets/bottom_home.png'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget card = Container(
  height: 150,
  width: 160,
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(19),
      boxShadow: [
        BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1.2),
            blurRadius: 1,
            blurStyle: BlurStyle.solid,
            spreadRadius: 1)
      ]),
  child: Column(
    children: [
      SizedBox(height: 10,),
      Container(
        child: Stack(
          children: [
            Container(
                height: 120,
                width: 144,
                child: Image.asset('assets/ad_img.png')),
            Positioned(
                top: 6,
                left: 12,
                child: Container(
                  height: 22,
                  width: 65,
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(247, 208, 63, 1)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.bolt,
                        size: 19,
                      ),
                      Text(
                        "Featured",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
            Positioned(
                top: 6,
                right: 12,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(250, 83, 58, 1),
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 17,
                  ),
                ))
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "XBox Series S",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "\$3,000",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              textAlign: TextAlign.start,
            ),
            Text(
              " |",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                  fontSize: 12),
              textAlign: TextAlign.start,
            ),
            Icon(
              Icons.location_on_outlined,
              size: 14,
            ),
            Text(
              "Boston,MA",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                  fontSize: 12),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10,0,0,0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "For per month",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                  fontSize: 12),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      )
    ],
  ),
);
