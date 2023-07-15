import 'package:equatable/equatable.dart';

import 'creators_model.dart';
import 'video_model.dart';

class FeedModel extends Equatable {
  final String image;
  final int id;
  final int duration;
  final int height;
  final int width;
  final CreatorsModel creator;
  final List<VideoModel> videos;

  const FeedModel(
    this.id,
    this.width,
    this.height,
    this.image,
    this.duration,
    this.creator,
    this.videos,
  );

  FeedModel.fromJson(Map<String, dynamic> json)
      : image = json["image"] ?? "",
        id = json["id"],
        duration = json["duration"] ?? 0,
        height = json["height"] ?? 0,
        width = json["width"] ?? 0,
        creator = json["user"] != null
            ? CreatorsModel.fromJson(json["user"])
            : CreatorsModel.empty,
        videos = json['video_files'] != null
            ? (json['video_files']! as List)
                .map((e) => VideoModel.fromJson(e))
                .toList()
            : [];

  @override
  List<Object?> get props => [id, width, height, image, duration];
  static const empty = FeedModel(0, 0, 0, "", 0, CreatorsModel.empty, []);
}
