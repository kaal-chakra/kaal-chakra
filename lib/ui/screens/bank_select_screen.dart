import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solution_challenge/ui/shared/pin_input_screen.dart';

class BankSelectScreen extends StatelessWidget {
  const BankSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FaIcon(
                FontAwesomeIcons.university,
                size: 75,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Please select a payment option',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: ListTile(
                  leading: const FaIcon(
                    FontAwesomeIcons.ccVisa,
                    size: 50,
                  ),
                  title: const Text(
                    'Mobile Banking',
                  ),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Scaffold(
                                appBar: AppBar(),
                                body: const PinInputScreen(
                                  heading: 'Enter your Bank/UPI pin',
                                  length: 6,
                                ),
                              )),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: const FaIcon(
                    FontAwesomeIcons.googlePay,
                    size: 50,
                  ),
                  title: const Text('UPI'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(),
                          body: const PinInputScreen(
                            heading: 'Enter your Bank/UPI pin',
                            length: 6,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
