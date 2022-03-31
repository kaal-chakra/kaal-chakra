// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/ui/screens/donee_registration_form.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.all(20),
              child: CircleAvatar(
                radius: 75,
                backgroundImage: NetworkImage(user.photoURL!),
              )),
          Text(
            "${user.displayName}",
            style: TextStyle(fontSize: 24),
          ),
          Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
            height: 25,
          ),
          ListTile(
            leading: Icon(
              Icons.emoji_people_outlined,
            ),
            title: Text(
              'Ask for a donation',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DoneeRegistrationForm()));
            },
          ),
          ListTile(
            leading: Icon(Icons.paid),
            title: Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
            height: 25,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'About Us',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
            height: 25,
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(
              'Log Out',
            ),
          ),
        ],
      ),
    );
  }
}
