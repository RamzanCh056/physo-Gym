import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../landing_page.dart';
import '../navigationbar/navigation_bar.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences preferences;
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) async {
      preferences = value;
      if (preferences.getBool('isLoggedIn') ?? false) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => CustomNavBar()),
                  (route) => false);
        });
      } else {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => LandingPage()),
                  (route) => false);
        });
      }
    }).catchError((e) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => LandingPage()), (route) => false);
      });
    });
    // Timer(const Duration(seconds: 3), (){
    //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    //     return const LandingPage();
    //   }));
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/splash.jpg.webp"),
                fit: BoxFit.cover,
              )
          ),
          padding: const EdgeInsets.only(top: 60.0),

          child:Column(children: [
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  const [
                Text(
                  "My Physio",
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 25,
                    width: 25,
                    child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2.0,)),
              ],
            ),
            const SizedBox(height:15),
          ],)
        ),
      ),
    );
  }
}
