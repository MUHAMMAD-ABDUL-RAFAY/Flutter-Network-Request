import 'package:json_annotation/json_annotation.dart';
part 'social_media_post_automatic.g.dart';

@JsonSerializable()
class SocialMediaPost {
  @JsonKey(name: "postId")
  late int postId;
  @JsonKey(name: "id")
  late int id;
  @JsonKey(name: "name")
  late String name;
  @JsonKey(name: "email")
  late String email;
  @JsonKey(name: "body")
  late String body;

  SocialMediaPost(
      {required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body});

  factory SocialMediaPost.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaPostFromJson(json);

  Map<String, dynamic> toJson() => _$SocialMediaPostToJson(this);
}
