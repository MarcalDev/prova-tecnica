import 'package:json_annotation/json_annotation.dart';
part 'video_response.g.dart';

@JsonSerializable()
class VideoResponse {
  final String? url;

  VideoResponse({required this.url});

  factory VideoResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoResponseToJson(this);
}
