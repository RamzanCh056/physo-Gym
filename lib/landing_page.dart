
import 'package:flutter/material.dart';

import 'auth/admin_auth/admin_login.dart';
import 'auth/user_auth/login_screen.dart';
import 'auth/user_auth/main_login.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/landing.jpg"),
              fit: BoxFit.cover,
            )
          ),
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color:Theme.of(context).primaryColor,
                    minWidth: 300,
                    height: 55,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginMain()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      side:  BorderSide(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                        child: Text(
                          "User",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: Theme.of(context).primaryColor,
                    minWidth: 300,
                    height: 55,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      side:  BorderSide(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                        child: Text(
                          "Admin",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
