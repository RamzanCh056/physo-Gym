import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_physio/landing_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextStyle headingStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white);

  bool lockAppSwitchVal = true;
  bool fingerprintSwitchVal = false;
  bool changePassSwitchVal = true;

  TextStyle headingStyleIOS = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: CupertinoColors.inactiveGray,
  );
  TextStyle descStyleIOS = const TextStyle(color: CupertinoColors.inactiveGray);
  SharedPreferences? preferences;
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      preferences = value;
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Settings", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,

      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: CupertinoColors.extraLightBackgroundGray,
        child: Column(
          children: [
            //Common
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 12),
                Text(
                  "Common",
                  style: headingStyleIOS,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              color: CupertinoColors.white,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 38,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 12),
                        const Icon(
                          Icons.language,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 12),
                        const Text("Language"),
                        const Spacer(),
                        Text(
                          "English",
                          style: descStyleIOS,
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          CupertinoIcons.right_chevron,
                          color: CupertinoColors.inactiveGray,
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  const Divider(),
                  Container(
                    width: double.infinity,
                    height: 38,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        const Icon(
                          Icons.cloud,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 12),
                        const Text("Environment"),
                        const Spacer(),
                        Text(
                          "Production",
                          style: descStyleIOS,
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          CupertinoIcons.right_chevron,
                          color: CupertinoColors.inactiveGray,
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Account
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 12),
                Text(
                  "Account",
                  style: headingStyleIOS,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              color: CupertinoColors.white,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 38,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(width: 12),
                        Icon(
                          Icons.phone,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 12),
                        Text("Phone Number"),
                        Spacer(),
                        Icon(
                          CupertinoIcons.right_chevron,
                          color: CupertinoColors.inactiveGray,
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                  const Divider(),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 38,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        SizedBox(width: 12),
                        Icon(
                          Icons.mail,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 12),
                        Text( preferences?.getString('userName') ?? 'Email',),
                        Spacer(),
                        Icon(
                          CupertinoIcons.right_chevron,
                          color: CupertinoColors.inactiveGray,
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: ()async{
                      await preferences?.setBool('isLoggedIn', false);
                      Fluttertoast.showToast(msg: "Successfully Logout");
                      Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const LandingPage()),
                      (route) => false);

                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 38,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(width: 12),
                          Icon(
                            Icons.exit_to_app,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 12),
                          Text("Sign Out"),
                          Spacer(),
                          Icon(
                            CupertinoIcons.right_chevron,
                            color: CupertinoColors.inactiveGray,
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Security


            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 12),
                Text(
                  "Misc",
                  style: headingStyleIOS,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              color: CupertinoColors.white,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 38,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(width: 12),
                        Icon(
                          Icons.file_open_sharp,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 12),
                        Text("Terms of Service"),
                        Spacer(),
                        Icon(
                          CupertinoIcons.right_chevron,
                          color: CupertinoColors.inactiveGray,
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                  const Divider(),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 38,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(width: 12),
                        Icon(
                          Icons.file_copy_sharp,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 12),
                        Text("Open Source Licenses"),
                        Spacer(),
                        Icon(
                          CupertinoIcons.right_chevron,
                          color: CupertinoColors.inactiveGray,
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
