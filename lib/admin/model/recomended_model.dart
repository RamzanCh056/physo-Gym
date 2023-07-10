class RecommendedVideoModel {
  String? picture;
  String? name;
  String? video;
  int? uploadTime;
  String? videoTitle;
  String? doc;


  RecommendedVideoModel({
    this.picture,
    this.name,
    this.video,
    this.uploadTime,
    this.videoTitle,
    this.doc,
  });

  Map<String, dynamic> toJson() {
    return {
      "picture": this.picture,
      "name": this.name,
      "video": this.video,
      "uploadTime": this.uploadTime,
      "videoTitle": this.videoTitle,
      "doc": this.doc,
    };
  }

  factory RecommendedVideoModel.fromJson(Map<String, dynamic> json) {
    return RecommendedVideoModel(
      picture: json["picture"] ?? "",
      name: json["name"] ?? "",
      video: json["video"] ?? "",
      uploadTime: json["uploadTime"] ?? 0,
      videoTitle: json["videoTitle"] ?? "",
      doc: json["doc"] ?? "",

    );
  }
}
