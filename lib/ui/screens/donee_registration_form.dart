// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:solution_challenge/ui/screens/shopping_page.dart';
import 'package:solution_challenge/ui/shared/pin_input_screen.dart';

class DoneeRegistrationForm extends StatefulWidget {
  const DoneeRegistrationForm({Key? key}) : super(key: key);

  @override
  State<DoneeRegistrationForm> createState() => _DoneeRegistrationFormState();
}

class _DoneeRegistrationFormState extends State<DoneeRegistrationForm> {
  bool _checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      "Register as a donee",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          child: Text("Full name"),
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 275,
                            child: TextFormField(
                                validator: (value) {
                                  return 'Fields Empty!';
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          child: Row(
                            children: [
                              Text("Address"),
                              Spacer(),
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Select on map >>')),
                            ],
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 300,
                            child: TextFormField(
                                validator: (value) {
                                  return 'Fields Empty!';
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          child: Text('Email'),
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 250,
                            child: TextFormField(
                                validator: (value) {
                                  return 'Fields Empty!';
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          child: Text('Phone Number'),
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 250,
                            child: TextFormField(
                                validator: (value) {
                                  return 'Fields Empty!';
                                },
                                decoration: InputDecoration(
                                  prefix: Text('+91'),
                                  border: OutlineInputBorder(),
                                )),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 250,
                            child: Row(
                              children: [
                                Checkbox(
                                    value: _checkBoxValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _checkBoxValue = value ?? false;
                                      });
                                    }),
                                Expanded(
                                  child: Text(
                                      'Same as mobile number registered with aadhaar'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          child: Text('Aadhar Number'),
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 250,
                            child: TextFormField(
                                validator: (value) {
                                  return 'Fields Empty!';
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                )),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Icon(Icons.info),
                                  ),
                                  Expanded(
                                    child: Text(
                                        'Your mobile number registered with your aadhaar number will be used to verify you.'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            child: Text(
                              'Next',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShoppingPage(),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
