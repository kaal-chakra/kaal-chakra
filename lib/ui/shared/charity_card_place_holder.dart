// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:solution_challenge/ui/screens/about_charity_page.dart';

class CharityCardPlaceHolder extends StatelessWidget {
  const CharityCardPlaceHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                height: 100,
                width: 100,
                decoration:
                    BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Charity Name'),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AboutCharity(),
          ),
        );
      },
    );
  }
}
