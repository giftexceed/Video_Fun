import 'package:equatable/equatable.dart';

class VideoModel extends Equatable {
  final int id;
  final String link;
  final String quality;

  const VideoModel(
    this.id,
    this.quality,
    this.link,
  );
  VideoModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        link = json["link"] ?? "",
        quality = json["quality"] ?? "";

  @override
  List<Object?> get props => [id, quality, link];
  static const empty = VideoModel(0, "", "");
}
