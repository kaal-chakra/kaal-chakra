// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/ui/shared/charity_card_place_holder.dart';
import '/ui/shared/donne_review_card.dart';
import '/ui/shared/homescreen_drawer.dart';
import '/ui/shared/donator_card_place_holder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeScreenDrawer(),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
          );
        }),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color.fromARGB(255, 75, 75, 75),
              child: CarouselSlider.builder(
                itemCount: 6,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: DonatorCardPlaceHolder(),
                  );
                },
                options: CarouselOptions(height: 360),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  'We are growing!',
                  style: TextStyle(
                      fontSize: 32, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image(
                image: AssetImage('assets/media/area_graph.png'),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  'We Care',
                  style: TextStyle(
                      fontSize: 32, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Card(
              child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: ((context, index) {
                  return DoneeReviewCard();
                }),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  'We are together!',
                  style: TextStyle(
                      fontSize: 32, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            GridView.builder(
              controller: _scrollController,
              itemCount: 6,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CharityCardPlaceHolder();
              },
            )
          ],
        ),
      ),
    );
  }
}
