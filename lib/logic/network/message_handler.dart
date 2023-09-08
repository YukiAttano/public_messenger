import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/message/message.dart';
import '../../data/snapshot_reporter/snapshot_reporter.dart';
import 'database_handler.dart';

abstract class MessageHandler {
  static const String _collection = "messages";
  static final CollectionReference<Map<String, Object?>> _messageCollectionRef = DatabaseHandler.store.collection(_collection);

  static Future<void> sendMessage(OutgoingMessage message) async {
    // uses collection directly, check [Message] for reason
    await _messageCollectionRef.add(message.toJson());
  }

  static Future<void> deleteMessage(String messageId) async {
    await _messageCollectionRef.doc(messageId).delete();
  }

  static Stream<SnapshotReporter<IncomingMessage>> getMessageStream(int messageCount) async* {
    await for (var querySnap in _messageCollectionRef.orderBy(Message.sendAtField).limitToLast(messageCount).snapshots()) {
      for (var docChange in querySnap.docChanges) {
        var docSnap = docChange.doc;

        if (docSnap.exists) {
          Map<String, Object?> data = docSnap.data()!;
          data[Message.idField] = docSnap.id;

          yield SnapshotReporter(type: docChange.type, id: docSnap.id, snapshot: IncomingMessage.fromJson(data));
        } else {
          yield SnapshotReporter(type: docChange.type, id: docSnap.id, snapshot: null);
        }
      }
    }
  }
}
/* //This function has not been finished, check [Message] for reason
abstract class _SendMessageFunction {

  static const String _functionName = "messages-sendmessage";

  static Future<Object?> call(OutgoingMessage message) async{
    try {
      HttpsCallableResult<Object?> result = await  DatabaseHandler.functions.httpsCallable(_functionName).call(message.toJson());

      print(result.data);
    } on FirebaseFunctionsException catch (e)
    {
      print("Exception ${e.message}");
    }

    return null;
  }
}*/
