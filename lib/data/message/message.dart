import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

part 'message.g.dart';

// The fields like author and loggedAt should be set (or at least validated) by the database via a trigger.
// But a trigger is not capable of receiving the callers authentication.
// So it should be set by a function.
// But 2ndGen Functions are not capable of providing an event-id to guarantee idempotence.
// So we ignore this and save all fields directly as we need them.
@Freezed(addImplicitFinal: true, fromJson: true, toJson: true, toStringOverride: true, equal: false, copyWith: false)
class Message with _$Message {
  static const String idField = "id";
  static const String sendAtField = "sendAt";

  const factory Message.outgoing({
    required String message,
    required String author,
    required DateTime sendAt,
  }) = OutgoingMessage;

  const factory Message.incoming({
    required String id,
    required String message,
    required String author,
    required DateTime sendAt,
    //required DateTime loggedAt,
  }) = IncomingMessage;

  factory Message.deleted(String id) {
    return IncomingMessage(
      id: id,
      message: "deleted",
      author: "unknown",
      sendAt: DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}