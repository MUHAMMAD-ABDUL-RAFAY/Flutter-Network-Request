// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_media_post_automatic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialMediaPost _$SocialMediaPostFromJson(Map<String, dynamic> json) =>
    SocialMediaPost(
      postId: json['postId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$SocialMediaPostToJson(SocialMediaPost instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
