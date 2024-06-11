import 'package:json_annotation/json_annotation.dart';
import 'source.dart';

part 'news_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsModel {
  String? status;
  List<Source>? sources;

  NewsModel({this.status, this.sources});

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
