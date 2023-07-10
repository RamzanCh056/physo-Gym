import 'package:flutter/material.dart';
import 'package:my_physio/admin/women_mix.dart';
import 'package:my_physio/home/Mix_workout.dart';
import 'package:my_physio/home/women_mix.dart';
import 'package:my_physio/home/women_yoga.dart';

import 'back_workout.dart';
import 'chest_workout.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: const Drawer(),
      appBar: AppBar(
       backgroundColor: Colors.black,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white,),
        title: const Text("Home", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,

      ),

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Column(
            children: [

             Column(children: [
               GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChestWorkoutScreen()));
                 },
                 child: Container(
                   height: 190,
                   width: double.infinity,
                   decoration:  BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: Colors.black,
                       image: const DecorationImage(
                           image: AssetImage("images/chestworkout.jpg")
                       )
                   ),
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children:  [
                         const SizedBox(height: 10,),
                         const Text("Advance Level", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.lightGreenAccent),),
                         const SizedBox(height: 5,),
                         const Text("Chest Workout", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 22),),
                         const Expanded(child: SizedBox(height: 1,)),
                         Row(children: [
                           Column(children: const [
                             Text("Full Equipment", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),),
                             SizedBox(height: 5,),
                             Text("Strenght", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18),),


                           ],),
                           const Expanded(child: SizedBox(width: 1,)),
                           Container(
                             height: 40, width: 70,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(40),
                                 color: Colors.lightGreenAccent
                             ),
                             child: const Center(
                               child: Text("Try", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                             ),
                           )
                         ],),
                         const SizedBox(height: 10,)
                       ],
                     ),
                   ),
                 ),
               ),
               const SizedBox(height: 10,),
               GestureDetector(
                 onTap: (){

                     Navigator.push(context, MaterialPageRoute(builder: (context)=>const BackWorkoutScreen()));

                 },
                 child: Container(
                   height: 190,
                   width: double.infinity,
                   decoration:  BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     color: Colors.black,
                     image: const DecorationImage(
                       image: AssetImage("images/backworkout.jpg"),
                       fit: BoxFit.cover,
                     ),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children:  [
                         const SizedBox(height: 10,),
                         const Text("Advance Level", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.lightGreenAccent),),
                         const SizedBox(height: 5,),
                         const Text("Back Workout", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 22),),
                         const Expanded(child: SizedBox(height: 1,)),
                         Row(children: [
                           Column(children: const [
                             Text("Full Equipment", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),),
                             SizedBox(height: 5,),
                             Text("Strength", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18),),


                           ],),
                           const Expanded(child: SizedBox(width: 1,)),
                           Container(
                             height: 40, width: 70,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(40),
                                 color: Colors.lightGreenAccent
                             ),
                             child: const Center(
                               child: Text("Try", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                             ),
                           )
                         ],),
                         const SizedBox(height: 10,)
                       ],
                     ),
                   ),
                 ),
               ),
               const SizedBox(height: 10,),
               GestureDetector(
                 onTap: (){

                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const MixWorkoutScreen()));

                 },
                 child: Container(
                   height: 190,
                   width: double.infinity,
                   decoration:  BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     color: Colors.black,
                     image: const DecorationImage(
                       image: AssetImage("images/mixworkout.jpg"),
                       fit: BoxFit.cover,
                     ),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children:  [
                         const SizedBox(height: 10,),
                         const Text("Advance Level", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.lightGreenAccent),),
                         const SizedBox(height: 5,),
                         const Text("Mix Workout", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 22),),
                         const Expanded(child: SizedBox(height: 1,)),
                         Row(children: [
                           Column(children: const [
                             Text("Full Equipment", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),),
                             SizedBox(height: 5,),
                             Text("Strength", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18),),


                           ],),
                           const Expanded(child: SizedBox(width: 1,)),
                           Container(
                             height: 40, width: 70,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(40),
                                 color: Colors.lightGreenAccent
                             ),
                             child: const Center(
                               child: Text("Try", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                             ),
                           )
                         ],),
                         const SizedBox(height: 10,)
                       ],
                     ),
                   ),
                 ),
               ),
             ],),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Other Exercise", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Explore more type of Exercise", style: TextStyle(fontSize: 16, color: Colors.black),),
                ],
              ),
              const SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const WomenMixWorkoutScreen()));

                          },
                          child: Container(
                            height: 200,
                            width: 350,
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                              image: const DecorationImage(
                                image: AssetImage("images/womentraining.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),

                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Text("women training", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.black),),

                      ],
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const WomenYogaWorkoutScreen()));

                          },
                          child: Container(
                            height: 200,
                            width: 350,
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                              image: const DecorationImage(
                                image: AssetImage("images/womenyoga.jpeg"),
                                fit: BoxFit.cover,
                              ),
                            ),

                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Text("Mix Yoga training women", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.black),),
                      ],
                    ),
                  ],
                ),


              ),
              const SizedBox(height: 5,),
            ],
          ),
        ),
      ),


    );
  }
}
