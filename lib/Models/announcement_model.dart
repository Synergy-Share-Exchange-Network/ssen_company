import 'dart:convert';

class AnnouncementModel {
  String identification;
  final String content;
  String companyID;
  String title;
  String postedBy;
  String publishDate;
  List<String> tags;
  // List<String> deletionLog;
  List<String> images;
  bool isDeleted;
  AnnouncementModel({
    required this.content,
    identification,
    companyID,
    title,
    postedBy,
    publishDate,
    tags,
    // deletionLog,
    images,
    isDeleted,
  })  : identification = identification ?? '',
        companyID = companyID ?? '',
        title = title ?? '',
        postedBy = postedBy ?? '',
        publishDate = publishDate ?? '',
        tags = tags ?? [''],
        // deletionLog = deletionLog ?? [''],
        images = images ?? [''],
        isDeleted = isDeleted ?? false;

  AnnouncementModel copyWith({
    String? identification,
    String? content,
    String? companyID,
    String? title,
    String? postedBy,
    String? publishDate,
    List<String>? tags,
    // List<String>? deletionLog,
    List<String>? images,
    bool? isDeleted,
  }) {
    return AnnouncementModel(
      identification: identification ?? this.identification,
      content: content ?? this.content,
      companyID: companyID ?? this.companyID,
      title: title ?? this.title,
      postedBy: postedBy ?? this.postedBy,
      publishDate: publishDate ?? this.publishDate,
      tags: tags ?? this.tags,
      // deletionLog: deletionLog ?? this.deletionLog,
      images: images ?? this.images,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'identification': identification});
    result.addAll({'content': content});
    result.addAll({'companyID': companyID});
    result.addAll({'title': title});
    result.addAll({'postedBy': postedBy});
    result.addAll({'publishDate': publishDate});
    result.addAll({'tags': tags});
    // result.addAll({'deletionLog': deletionLog});
    result.addAll({'images': images});
    result.addAll({'isDeleted': isDeleted});

    return result;
  }

  factory AnnouncementModel.fromMap(Map<String, dynamic> map) {
    return AnnouncementModel(
      identification: map['identification'] ?? '',
      content: map['content'] ?? '',
      companyID: map['companyID'] ?? '',
      title: map['title'] ?? '',
      postedBy: map['postedBy'] ?? '',
      publishDate: map['publishDate'] ?? '',
      // deletionLog: List<String>.from(map['deletionLog']),
      images: List<String>.from(map['images']),
      isDeleted: map['isDeleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnnouncementModel.fromJson(String source) =>
      AnnouncementModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AnnouncementModel( identification: $identification ,content: $content, companyID: $companyID, title: $title, postedBy: $postedBy, publishDate: $publishDate, tags: $tags, isDeleted: $isDeleted, images: $images)';
  }
}

void main(List<String> args) {
  AnnouncementModel x = AnnouncementModel(content: 'content');
  print(x.toMap());
}
