import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HistoryModel {
  String identification;
  final String title;
  final String description;
  final String userId;
  final String historyDate;
  HistoryModel({
    required this.title,
    required this.description,
    required this.userId,
    required this.historyDate,
    identification,
  }) : identification = identification ?? '';

  HistoryModel copyWith({
    String? identification,
    String? title,
    String? description,
    String? userId,
    String? historyDate,
  }) {
    return HistoryModel(
      identification: identification ?? this.identification,
      title: title ?? this.title,
      description: description ?? this.description,
      userId: userId ?? this.userId,
      historyDate: historyDate ?? this.historyDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identification': identification,
      'title': title,
      'description': description,
      'userId': userId,
      'historyDate': historyDate,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      identification: map['identification'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      userId: map['userId'] as String,
      historyDate: map['historyDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryModel.fromJson(String source) =>
      HistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'HistoryModel(identification:$identification,  title: $title, description: $description,  userId: $userId,  historyDate: $historyDate)';
}

// void main(List<String> args) {
//   HistoryModel x = HistoryModel(
//       title: 'habesha beer',
//       description: 'description',
//       userId: '123',
//       historyDate: 'historyDate');
//   print(x.toJson());
// }
