// ignore_for_file: must_be_immutable, unused_import

import 'dart:async';

import 'package:firebase/firebase_realtime_database.dart/fetchdata.dart';
import 'package:firebase/Utils/utils.dart';
import 'package:firebase/rounded_Button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Addpostscreen extends StatefulWidget {
  const Addpostscreen({super.key});

  @override
  State<Addpostscreen> createState() => _AddpostscreenState();
}

class _AddpostscreenState extends State<Addpostscreen> {
  final postController = TextEditingController();

  bool loading = false;

  final databaseref = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post Screen', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 30),
            TextFormField(
              controller: postController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "What is in your mind?",
              ),
            ),
            SizedBox(height: 30),
            RoundedButton(
              title: 'Add Post',
              loading: loading,
              onTap: () {
                setState(() {
                  loading = true;
                });
                try {
                  databaseref
                      .child(DateTime.now().millisecondsSinceEpoch.toString())
                      // .child('comment')
                      .set({
                        'title': postController.text.toString(),
                        'id': DateTime.now().millisecondsSinceEpoch.toString(),
                      })
                      .then((value) {
                        setState(() {
                          loading = false;
                        });
                        Utils().toastmessage('Post Added');
                      })
                      .onError((error, stackTrace) {
                        Utils().toastmessage(error.toString());
                      });
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
