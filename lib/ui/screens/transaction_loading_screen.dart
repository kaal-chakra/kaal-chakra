// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:solution_challenge/ui/screens/homepage.dart';

class TransactionLoadingScreen extends StatefulWidget {
  final String heading;
  const TransactionLoadingScreen({Key? key, required this.heading})
      : super(key: key);

  @override
  State<TransactionLoadingScreen> createState() =>
      _TransactionLoadingScreenState();
}

class _TransactionLoadingScreenState extends State<TransactionLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
            future: _loaddata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(
                      width: 200,
                      child: Text(
                        'Please wait while we confirm your payment',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircularProgressIndicator(),
                    )
                  ],
                );
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.check,
                      size: 75,
                    ),
                    const Text(
                      'All done!',
                      style: const TextStyle(fontSize: 32),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.heading,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PhysicalModel(
                      shape: BoxShape.circle,
                      elevation: 5,
                      color: Colors.grey,
                      child: InkWell(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.home,
                              size: 50,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const HomePage()),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }

  Future<String> _loaddata() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Data Loaded!';
  }
}
