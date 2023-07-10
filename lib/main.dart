import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_physio/splash/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final Future<FirebaseApp> initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Physio',
      theme: ThemeData(
          primaryColor: Colors.purple[900],
          colorScheme: ColorScheme.light(
              primary: Colors.purple[900]!
          ),
          appBarTheme: AppBarTheme(
            color: Colors.purple[900],
          ),
          fontFamily: 'regular'),
      home: const SplashScreen(),
    );
  }
}

