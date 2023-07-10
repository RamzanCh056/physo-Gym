import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:my_physio/home/video_player/video_player.dart';
import 'package:my_physio/home/youtube_player/you_tube.dart';

import '../admin/model/add_video_model.dart';
import '../admin/model/recomended_model.dart';
import '../res/static_info.dart';
class MixWorkoutScreen extends StatefulWidget {
  const MixWorkoutScreen({Key? key}) : super(key: key);

  @override
  State<MixWorkoutScreen> createState() => _MixWorkoutScreenState();
}

class _MixWorkoutScreenState extends State<MixWorkoutScreen> {

  List<AddVideoModel> getData = [];
  bool isLoading = false;

  @override
  void initState() {
    getChestVideo();
    super.initState();
  }

  getChestVideo() {
    setState(() {
      isLoading = true;
    });
    try {
      getData.clear();
      setState(() {});
      FirebaseFirestore.instance
          .collection(StaticInfo.mixWorkout)
          .snapshots()
          .listen((event) {
        getData.clear();
        setState(() {});
        for (int i = 0; i < event.docs.length; i++) {
          AddVideoModel dataModel =
          AddVideoModel.fromJson(event.docs[i].data());
          getData.add(dataModel);
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
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Mix workout videos", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
              itemCount: getData.length,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          getData[index].picture.toString(),
                          // "https://thumbs.dreamstime.com/b/closeup-portrait-muscular-man-workout-barbell-gym-brutal-bodybuilder-athletic-six-pack-perfect-abs-shoulders-55122231.jpg"
                        ),
                      ),
                      title: Text(
                        getData[index].name.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(

                        DateFormat('hh:mm a').format(
                            DateTime.fromMillisecondsSinceEpoch(int.parse(
                              getData[index]
                                  .uploadTime
                                  .toString(),
                            ) )),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    VideoPlay(
                      pathh:  getData[index].video.toString(),
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
