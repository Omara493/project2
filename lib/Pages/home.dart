// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'log.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: SafeArea(
        child: SizedBox(
          height: 350,
          child: Drawer(
            child: Padding(
              padding: EdgeInsets.all(
                  16.0), // Add desired padding around the content
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search', // Placeholder text for the search bar
                      prefixIcon: Icon(Icons.search), // Icon for the search bar
                    ),
                    onChanged: (value) {
                      // Handle search functionality
                    },
                  ),
                  SizedBox(
                      height:
                          16.0), // Add spacing between search bar and list tiles
                  Column(
                    children: [
                      ListTile(
                        title: Text("Home"),
                        leading: Icon(Icons.home),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: Text("My products"),
                        leading: Icon(Icons.add_shopping_cart),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: Text("About"),
                        leading: Icon(Icons.help_center),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text("Logout"),
                        leading: Icon(Icons.exit_to_app),
                        onTap: () async {
                          Navigator.pop(context);
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
