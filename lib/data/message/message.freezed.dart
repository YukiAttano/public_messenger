// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'outgoing':
      return OutgoingMessage.fromJson(json);
    case 'incoming':
      return IncomingMessage.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Message',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Message {
  String get message => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  DateTime get sendAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String author, DateTime sendAt)
        outgoing,
    required TResult Function(
            String id, String message, String author, DateTime sendAt)
        incoming,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String author, DateTime sendAt)? outgoing,
    TResult? Function(
            String id, String message, String author, DateTime sendAt)?
        incoming,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String author, DateTime sendAt)? outgoing,
    TResult Function(String id, String message, String author, DateTime sendAt)?
        incoming,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OutgoingMessage value) outgoing,
    required TResult Function(IncomingMessage value) incoming,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OutgoingMessage value)? outgoing,
    TResult? Function(IncomingMessage value)? incoming,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OutgoingMessage value)? outgoing,
    TResult Function(IncomingMessage value)? incoming,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$OutgoingMessage implements OutgoingMessage {
  const _$OutgoingMessage(
      {required this.message,
      required this.author,
      required this.sendAt,
      final String? $type})
      : $type = $type ?? 'outgoing';

  factory _$OutgoingMessage.fromJson(Map<String, dynamic> json) =>
      _$$OutgoingMessageFromJson(json);

  @override
  final String message;
  @override
  final String author;
  @override
  final DateTime sendAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Message.outgoing(message: $message, author: $author, sendAt: $sendAt)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String author, DateTime sendAt)
        outgoing,
    required TResult Function(
            String id, String message, String author, DateTime sendAt)
        incoming,
  }) {
    return outgoing(message, author, sendAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String author, DateTime sendAt)? outgoing,
    TResult? Function(
            String id, String message, String author, DateTime sendAt)?
        incoming,
  }) {
    return outgoing?.call(message, author, sendAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String author, DateTime sendAt)? outgoing,
    TResult Function(String id, String message, String author, DateTime sendAt)?
        incoming,
    required TResult orElse(),
  }) {
    if (outgoing != null) {
      return outgoing(message, author, sendAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OutgoingMessage value) outgoing,
    required TResult Function(IncomingMessage value) incoming,
  }) {
    return outgoing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OutgoingMessage value)? outgoing,
    TResult? Function(IncomingMessage value)? incoming,
  }) {
    return outgoing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OutgoingMessage value)? outgoing,
    TResult Function(IncomingMessage value)? incoming,
    required TResult orElse(),
  }) {
    if (outgoing != null) {
      return outgoing(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OutgoingMessageToJson(
      this,
    );
  }
}

abstract class OutgoingMessage implements Message {
  const factory OutgoingMessage(
      {required final String message,
      required final String author,
      required final DateTime sendAt}) = _$OutgoingMessage;

  factory OutgoingMessage.fromJson(Map<String, dynamic> json) =
      _$OutgoingMessage.fromJson;

  @override
  String get message;
  @override
  String get author;
  @override
  DateTime get sendAt;
}

/// @nodoc
@JsonSerializable()
class _$IncomingMessage implements IncomingMessage {
  const _$IncomingMessage(
      {required this.id,
      required this.message,
      required this.author,
      required this.sendAt,
      final String? $type})
      : $type = $type ?? 'incoming';

  factory _$IncomingMessage.fromJson(Map<String, dynamic> json) =>
      _$$IncomingMessageFromJson(json);

  @override
  final String id;
  @override
  final String message;
  @override
  final String author;
  @override
  final DateTime sendAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Message.incoming(id: $id, message: $message, author: $author, sendAt: $sendAt)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String author, DateTime sendAt)
        outgoing,
    required TResult Function(
            String id, String message, String author, DateTime sendAt)
        incoming,
  }) {
    return incoming(id, message, author, sendAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String author, DateTime sendAt)? outgoing,
    TResult? Function(
            String id, String message, String author, DateTime sendAt)?
        incoming,
  }) {
    return incoming?.call(id, message, author, sendAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String author, DateTime sendAt)? outgoing,
    TResult Function(String id, String message, String author, DateTime sendAt)?
        incoming,
    required TResult orElse(),
  }) {
    if (incoming != null) {
      return incoming(id, message, author, sendAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OutgoingMessage value) outgoing,
    required TResult Function(IncomingMessage value) incoming,
  }) {
    return incoming(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OutgoingMessage value)? outgoing,
    TResult? Function(IncomingMessage value)? incoming,
  }) {
    return incoming?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OutgoingMessage value)? outgoing,
    TResult Function(IncomingMessage value)? incoming,
    required TResult orElse(),
  }) {
    if (incoming != null) {
      return incoming(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$IncomingMessageToJson(
      this,
    );
  }
}

abstract class IncomingMessage implements Message {
  const factory IncomingMessage(
      {required final String id,
      required final String message,
      required final String author,
      required final DateTime sendAt}) = _$IncomingMessage;

  factory IncomingMessage.fromJson(Map<String, dynamic> json) =
      _$IncomingMessage.fromJson;

  String get id;
  @override
  String get message;
  @override
  String get author;
  @override
  DateTime get sendAt;
}
