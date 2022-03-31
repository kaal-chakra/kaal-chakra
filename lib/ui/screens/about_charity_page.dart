// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:solution_challenge/ui/shared/map_widget.dart';

class AboutCharity extends StatefulWidget {
  const AboutCharity({Key? key}) : super(key: key);

  @override
  State<AboutCharity> createState() => _AboutCharityState();
}

class _AboutCharityState extends State<AboutCharity> {
  bool showImages = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 400,
              child: showImages
                  ? CarouselSlider(
                      items: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            color: Colors.grey,
                            child: Center(
                              child: Icon(
                                Icons.image,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                      options: CarouselOptions(
                          autoPlay: false, enableInfiniteScroll: true),
                    )
                  : MapsWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlutterSwitch(
                  inactiveIcon: Icon(Icons.map),
                  activeIcon: Icon(Icons.image),
                  value: showImages,
                  onToggle: (v) {
                    setState(() {
                      showImages = v;
                    });
                  }),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: Text(
                          "Donee Name",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vitae tempus quam pellentesque nec nam aliquam sem et tortor. Aenean pharetra magna ac placerat vestibulum lectus. Eget nunc scelerisque viverra mauris in aliquam sem fringilla. Est velit egestas dui id.\n\n Vulputate mi sit amet mauris commodo quis imperdiet massa. Bibendum enim facilisis gravida neque convallis a cras semper. In est ante in nibh mauris cursus mattis. Dolor sed viverra ipsum nunc. Maecenas accumsan lacus vel facilisis volutpat est velit.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Address",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text("Address Line 1"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text("Address Line 2"),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Contacts",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text("Phone"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text("Email"),
                            ),
                          ],
                        ),
                      ],
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
