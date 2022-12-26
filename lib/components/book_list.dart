import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  final String title;
  final String keyword;
  final String bookcover;
  final int number;
  final DocumentReference reference;

  Book.fromMap(Map<String, dynamic> map, {required this.reference})
      : keyword = map['종류'],
        bookcover = map['이미지'],
        title = map['책 제목'],
        number = map['번호'];

  Book.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  @override
  String toString() => 'Book<$title:$keyword>';
}