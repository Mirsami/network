import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InterestRecord extends FirestoreRecord {
  InterestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _photoUrl = snapshotData['photoUrl'] as String?;
    _followers = getDataList(snapshotData['followers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('interest');

  static Stream<InterestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InterestRecord.fromSnapshot(s));

  static Future<InterestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InterestRecord.fromSnapshot(s));

  static InterestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InterestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InterestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InterestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InterestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InterestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInterestRecordData({
  String? name,
  String? photoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'photoUrl': photoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class InterestRecordDocumentEquality implements Equality<InterestRecord> {
  const InterestRecordDocumentEquality();

  @override
  bool equals(InterestRecord? e1, InterestRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.photoUrl == e2?.photoUrl &&
        listEquality.equals(e1?.followers, e2?.followers);
  }

  @override
  int hash(InterestRecord? e) =>
      const ListEquality().hash([e?.name, e?.photoUrl, e?.followers]);

  @override
  bool isValidKey(Object? o) => o is InterestRecord;
}
