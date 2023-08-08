import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeightRecord extends FirestoreRecord {
  WeightRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  bool hasWeight() => _weight != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _weight = castToType<int>(snapshotData['weight']);
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('weight');

  static Stream<WeightRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WeightRecord.fromSnapshot(s));

  static Future<WeightRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WeightRecord.fromSnapshot(s));

  static WeightRecord fromSnapshot(DocumentSnapshot snapshot) => WeightRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeightRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeightRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeightRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeightRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeightRecordData({
  int? weight,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'weight': weight,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class WeightRecordDocumentEquality implements Equality<WeightRecord> {
  const WeightRecordDocumentEquality();

  @override
  bool equals(WeightRecord? e1, WeightRecord? e2) {
    return e1?.weight == e2?.weight && e1?.date == e2?.date;
  }

  @override
  int hash(WeightRecord? e) => const ListEquality().hash([e?.weight, e?.date]);

  @override
  bool isValidKey(Object? o) => o is WeightRecord;
}
