import 'package:equatable/equatable.dart';

class CreatorsModel extends Equatable {
  final int id;
  final String name;
  final String url;
  const CreatorsModel(this.id, this.name, this.url);

  CreatorsModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"] ?? "",
        url = json["url"] ?? "";

  @override
  List<Object?> get props => [id, name, url];
  static const empty = CreatorsModel(0, "", "");
}
