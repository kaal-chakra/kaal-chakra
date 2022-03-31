import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solution_challenge/ui/screens/checkout_page.dart';

class ShoppingPage extends StatefulWidget {
  ShoppingPage({Key? key}) : super(key: key);

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckoutScreen(),
            ),
          );
        },
        child: const FaIcon(FontAwesomeIcons.cartArrowDown),
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  'Your alotted budget is: XXXX',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.grey[600]),
                ),
              ),
            ),
            const Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            GridView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Card(
                      child: SizedBox.expand(
                    child: Column(
                      children: [
                        const Expanded(
                          child: Icon(
                            Icons.image,
                            size: 50,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Item name',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Item Cost',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  child: Text("Add to cart"),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
                }),
          ],
        ),
      ),
    );
  }
}
