// ignore_for_file: unused_import

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase_signup_options.dart/login.dart';
import 'package:firebase/firebase_realtime_database.dart/postScreen.dart';
import 'package:firebase/firebase_signup_options.dart/signup.dart';

class SplashServices {
  Future<void> login(BuildContext context) async {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      Timer(
        Duration(seconds: 1),
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Postscreen()),
        ),
      );
    } else {
      Timer(
        Duration(seconds: 1),
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        ),
      );
    }
  }
}
