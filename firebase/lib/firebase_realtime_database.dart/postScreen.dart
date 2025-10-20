import 'package:firebase/firebase_realtime_database.dart/addpostdata.dart';
import 'package:firebase/firebase_realtime_database.dart/fetchdata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase_signup_options.dart/login.dart';
import 'package:firebase/Utils/utils.dart';

class Postscreen extends StatefulWidget {
  const Postscreen({super.key});

  @override
  State<Postscreen> createState() => _PostscreenState();
}

class _PostscreenState extends State<Postscreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Screen', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            tooltip: 'SignOut',
            onPressed: () {
              auth
                  .signOut()
                  .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  })
                  .onError((error, stacktrace) {
                    Utils().toastmessage(error.toString());
                  });
            },
            icon: Icon(Icons.logout_outlined, color: Colors.white),
          ),
        ],
      ),
      // body: Center(
      //   child: Text(
      //     'Add Post Using left bottom Corner Button',
      //     style: TextStyle(fontSize: 20),
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => Addpostscreen()),
      //     );
      //   },
      // child: Icon(Icons.add),
      // ),
      body: Container(
        child: Center(
          child: Container(
            // color: Colors.deepPurple,
            height: 50,
            width: double.infinity,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Addpostscreen(),
                        ),
                      );
                    },
                    child: Center(child: Text('Add Data')),
                  ),
                  SizedBox(width: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FetchdataScreen(),
                        ),
                      );
                    },
                    child: Center(child: Text('Fetch Data')),
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
