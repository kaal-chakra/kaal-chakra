import 'package:flutter/material.dart';
import '/ui/screens/login_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Future<String> data;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    data = _loaddata();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/media/banner.png',
            ),
          ),
        ),
        child: FutureBuilder(
          future: _loaddata(),
          builder: (context, AsyncSnapshot<String> str) {
            if (str.connectionState == ConnectionState.done) {
              return LoginPage();
            } else {
              return Center(
                child: Container(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<String> _loaddata() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Data Loaded!';
  }
}
