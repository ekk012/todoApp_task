// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:task_app/screens/tasks/add_task.dart';
import 'package:task_app/screens/tasks/task_list.dart';
import 'package:task_app/services/firebase_auth_methods.dart';
import 'package:intl/intl.dart'; // for date format

// for other locales

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey _scaffoldKey = new GlobalKey();
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/personImage.png'),
                ),
                accountEmail: Text('${user.email!}'),
                accountName: null,
              ),
              ListTile(
                title: GestureDetector(
                    onTap: (() {
                      context.read<FirebaseAuthMethods>().signOut(context);
                    }),
                    child: Text(
                      "Sign Out",
                      style: TextStyle(color: Colors.blue),
                    )),
              )
            ],
          ),
        ),
      ),
      key: _scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(alignment: Alignment.center, children: [
            Image.asset('assets/images/mountain.jpg'),
            Positioned(
              left: 45,
              top: 50,
              child: Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Icon(Icons.menu, color: Colors.white),
                );
              }),
            ),
            Positioned(
              left: 50,
              child: SizedBox(
                width: 150,
                child: Text(
                  'Your Things',
                  style: TextStyle(color: Colors.white, fontSize: 48),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Positioned(
                bottom: 50,
                left: 50,
                child: Text(
                  (DateFormat.yMMMMd().format(DateTime.now())),
                  style: TextStyle(color: Colors.white),
                ))
          ]),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: const [
                Text('INBOX'),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TaskList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTask()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
