import 'package:cloud_firestore/cloud_firestore.dart';

class SnapshotReporter<T> {
  final DocumentChangeType type;
  final String id;
  final T? snapshot;

  const SnapshotReporter({required this.type, required this.id, required this.snapshot});
}
