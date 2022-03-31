import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solution_challenge/ui/screens/transaction_loading_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cart",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Following items are in your cart:",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListView.builder(
                        controller: _scrollController,
                        itemCount: 8,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(20),
                            leading: const Icon(
                              Icons.image,
                              size: 50,
                            ),
                            title: const Text("Item Name"),
                            trailing: Text(
                              "Item cost",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          );
                        },
                      ),
                      Text(
                        "Total: XXXX",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TransactionLoadingScreen(
                                  heading:
                                      "Please wait kindly while your goods arrive")));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.moneyBill,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Check out!")
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
