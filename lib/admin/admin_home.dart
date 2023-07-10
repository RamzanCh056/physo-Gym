import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_physio/admin/back_workout.dart';
import 'package:my_physio/admin/mix_workout.dart';
import 'package:my_physio/admin/recommended_video.dart';
import 'package:my_physio/admin/women_mix.dart';
import 'package:my_physio/admin/women_yoga.dart';
import 'package:my_physio/landing_page.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chest_workout.dart';

class AdminSide extends StatefulWidget {
  const AdminSide({super.key});

  @override
  State<AdminSide> createState() => _AdminSideState();
}

class _AdminSideState extends State<AdminSide> {
  UploadTask? task;
  File? file;
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
  Drawer drawer(context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              accountName:  Text(
                preferences?.getString('userName') ?? '',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text(
                '',
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              )),
          buttonWidget(context),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
  Widget buttonWidget(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ButtonTheme(
        height: 47,
        minWidth: MediaQuery.of(context).size.width,
        child: MaterialButton(
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () async {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LandingPage()),
                    (route) => false);
          },
          child: const Text(
            'Logout',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        title: const Text("Admin"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddChestWorkout()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Theme.of(context).primaryColor,
                        ),
                        height: 50,
                        width: double.infinity,
                        child: const Center(
                          child: Text(
                            "Add chest workout",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RecommendedLecture()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Theme.of(context).primaryColor,
                      ),
                      height: 50,
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          "Add Recommended YouTube",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddBakWorkout()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Theme.of(context).primaryColor,
                      ),
                      height: 50,
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          "Add back workout",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddMixWorkout()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color:Theme.of(context).primaryColor,
                        ),
                        height: 50,
                        width: double.infinity,
                        child: const Center(
                          child: Text(
                            "Add mix workout",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddWomenMixWorkout()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color:Theme.of(context).primaryColor,
                        ),
                        height: 50,
                        width: double.infinity,
                        child: const Center(
                          child: Text(
                            "Add women mix workout",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddWomenYogaWorkout()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color:Theme.of(context).primaryColor,
                        ),
                        height: 50,
                        width: double.infinity,
                        child: const Center(
                          child: Text(
                            "Add women yoga training",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 55,
                  ),



                ],
              )),
        ),
      ),
    );
  }


  Future uploadFile() async {
    if (file == null) return;
    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
    stream: task.snapshotEvents,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final snap = snapshot.data!;
        final progress = snap.bytesTransferred / snap.totalBytes;
        final percentage = (progress * 100).toStringAsFixed(2);

        return Text(
          '$percentage %',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        );
      } else {
        return Container();
      }
    },
  );
}

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  static UploadTask? uploadBytes(String destination, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putData(data);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
