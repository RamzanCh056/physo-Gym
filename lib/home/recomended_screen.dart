import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:my_physio/home/youtube_player/you_tube.dart';

import '../admin/model/recomended_model.dart';
import '../res/static_info.dart';
class RecomendedScreen extends StatefulWidget {
  const RecomendedScreen({Key? key}) : super(key: key);

  @override
  State<RecomendedScreen> createState() => _RecomendedScreenState();
}

class _RecomendedScreenState extends State<RecomendedScreen> {

   List<RecommendedVideoModel> recommendedVideo = [];
   bool isLoading = false;

   @override
   void initState() {
     getRecommendedVideo();
     super.initState();
   }

   getRecommendedVideo() {
     setState(() {
       isLoading = true;
     });
     try {

       recommendedVideo.clear();
       setState(() {});
       FirebaseFirestore.instance
           .collection(StaticInfo.recommendedVideo)
           .snapshots()
           .listen((event) {
         recommendedVideo.clear();
         setState(() {});
         for (int i = 0; i < event.docs.length; i++) {
           RecommendedVideoModel dataModel =
           RecommendedVideoModel.fromJson(event.docs[i].data());
           recommendedVideo.add(dataModel);
         }
         setState(() {
           isLoading =false;
         });
       });
       setState(() {
         isLoading =false;
       });
     } catch (e) {}
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Recommended videos", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,

      ),
      body: isLoading ? Center(
          child: SizedBox(
              width: 80,
              child: LoadingIndicator(
                  indicatorType: Indicator.ballBeat,
                  colors: [
                    Theme.of(context).primaryColor,
                  ],
                  strokeWidth: 2,
                  pathBackgroundColor:
                  Theme.of(context).primaryColor)),
        ):
        Column(children: [
          Expanded(

            child: ListView.builder(
              physics: const ScrollPhysics(),
              itemCount: recommendedVideo.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
              return Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                   ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        recommendedVideo[index].picture.toString(),
                         // "https://thumbs.dreamstime.com/b/closeup-portrait-muscular-man-workout-barbell-gym-brutal-bodybuilder-athletic-six-pack-perfect-abs-shoulders-55122231.jpg"
                      ),
                    ),
                    title: Text(
                      recommendedVideo[index].name.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(

                      DateFormat('hh:mm a').format(
                          DateTime.fromMillisecondsSinceEpoch(int.parse(
                            recommendedVideo[index]
                                .uploadTime
                                .toString(),
                          ) )),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                  // image:  DecorationImage(
                  //   image: NetworkImage(images[index]),
                  //   fit: BoxFit.cover
                  //   ),
                  //         border: Border.all(
                  //           color: Colors.black,
                  //         ),
                          borderRadius: BorderRadius.circular(20
                          )

                      ),
                      height: 200,


                      child: YoutubeVideo(
                        recommendedVideo[index].video.toString(),
                      ),

                    //  VideoPlay(
                    //   pathh:
                    // )
                  ),
                  const SizedBox(height: 10,),
                ],),
              );
            }),
          )
      ],),
    );

  }
}
