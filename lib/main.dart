import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yotta_test_six/helper/helper_function.dart';
import 'package:yotta_test_six/pages/auth/login_page.dart';
import 'package:yotta_test_six/pages/home_page.dart';
import 'package:yotta_test_six/shared/constants.dart';

//
void main() async{
  //all the widgets got initialized with this command
  WidgetsFlutterBinding.ensureInitialized();

  //Firebase will be successfully initailized to our ios and android platform, but not for web version
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _isSignedIn = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus () async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value!= null) {
        setState(() {
           _isSignedIn = value;
        });
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Constants().primaryColor,
        scaffoldBackgroundColor: Colors.white
      ),
      home: _isSignedIn ? const HomePage() : const LoginPage(),

    );
  }
}
