import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/services/google_sign_in_provider.dart';
import 'homepage_loader.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool isLogginIn = false;
  late AnimationController _controller;
  late Animation<double> _opacity;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _opacity = Tween<double>(begin: 0.00, end: 1.00).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 75),
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return FadeTransition(
                opacity: _opacity,
                child: Card(
                  child: isLogginIn
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SizedBox(
                                height: 100,
                                width: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ImageIcon(
                                    const AssetImage(
                                      "assets/media/logo/solution_challenge_logo.png",
                                    ),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Kaal Chakra',
                                style: TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Center(
                                  child: Text(
                                    'Please login to an existing account or register for one',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await GoogleSignInProvider()
                                      .googleLogin()
                                      .then((value) => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomepageLoader(),
                                              ),
                                            )
                                          });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      FaIcon(
                                        FontAwesomeIcons.google,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'Login with google',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      FaIcon(
                                        FontAwesomeIcons.phoneAlt,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'Login with phone',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't have an account?",
                                    textAlign: TextAlign.center,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text('Create One!'))
                                ],
                              ),
                            )
                          ],
                        ),
                ),
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
