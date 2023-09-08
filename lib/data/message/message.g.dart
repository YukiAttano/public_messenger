// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutgoingMessage _$$OutgoingMessageFromJson(Map<String, dynamic> json) =>
    _$OutgoingMessage(
      message: json['message'] as String,
      author: json['author'] as String,
      sendAt: DateTime.parse(json['sendAt'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OutgoingMessageToJson(_$OutgoingMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'author': instance.author,
      'sendAt': instance.sendAt.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$IncomingMessage _$$IncomingMessageFromJson(Map<String, dynamic> json) =>
    _$IncomingMessage(
      id: json['id'] as String,
      message: json['message'] as String,
      author: json['author'] as String,
      sendAt: DateTime.parse(json['sendAt'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$IncomingMessageToJson(_$IncomingMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'author': instance.author,
      'sendAt': instance.sendAt.toIso8601String(),
      'runtimeType': instance.$type,
    };
