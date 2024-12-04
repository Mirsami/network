import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventRecord extends FirestoreRecord {
  EventRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "speakers" field.
  List<DocumentReference>? _speakers;
  List<DocumentReference> get speakers => _speakers ?? const [];
  bool hasSpeakers() => _speakers != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _photo = snapshotData['photo'] as String?;
    _name = snapshotData['name'] as String?;
    _speakers = getDataList(snapshotData['speakers']);
    _description = snapshotData['description'] as String?;
    _location = snapshotData['location'] as String?;
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('event');

  static Stream<EventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventRecord.fromSnapshot(s));

  static Future<EventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventRecord.fromSnapshot(s));

  static EventRecord fromSnapshot(DocumentSnapshot snapshot) => EventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventRecordData({
  String? photo,
  String? name,
  String? description,
  String? location,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photo': photo,
      'name': name,
      'description': description,
      'location': location,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventRecordDocumentEquality implements Equality<EventRecord> {
  const EventRecordDocumentEquality();

  @override
  bool equals(EventRecord? e1, EventRecord? e2) {
    const listEquality = ListEquality();
    return e1?.photo == e2?.photo &&
        e1?.name == e2?.name &&
        listEquality.equals(e1?.speakers, e2?.speakers) &&
        e1?.description == e2?.description &&
        e1?.location == e2?.location &&
        e1?.category == e2?.category;
  }

  @override
  int hash(EventRecord? e) => const ListEquality().hash([
        e?.photo,
        e?.name,
        e?.speakers,
        e?.description,
        e?.location,
        e?.category
      ]);

  @override
  bool isValidKey(Object? o) => o is EventRecord;
}
