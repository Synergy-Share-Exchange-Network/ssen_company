import 'dart:convert';

class SecondryPostShareModel {
  final String identification;
  final String shareID;
  final String purchaseID;
  final int numberOfShare;
  List<String> doesItPassTheCriteria;
  String buyerID;
  List<String> approvalOfTheCompany;
  bool shareTransactionCompleted;
  SecondryPostShareModel({
    required this.identification,
    required this.shareID,
    required this.purchaseID,
    required this.numberOfShare,
    doesItPassTheCriteria,
    buyerID,
    approvalOfTheCompany,
    shareTransactionCompleted,
  })  : doesItPassTheCriteria = doesItPassTheCriteria ?? [''],
        buyerID = buyerID ?? '',
        approvalOfTheCompany = approvalOfTheCompany ?? [''],
        shareTransactionCompleted = shareTransactionCompleted ?? false;

  SecondryPostShareModel copyWith({
    String? identification,
    String? shareID,
    String? purchaseID,
    int? numberOfShare,
    List<String>? doesItPassTheCriteria,
    String? buyerID,
    List<String>? approvalOfTheCompany,
    bool? shareTransactionCompleted,
  }) {
    return SecondryPostShareModel(
      identification: identification ?? this.identification,
      shareID: shareID ?? this.shareID,
      purchaseID: purchaseID ?? this.purchaseID,
      numberOfShare: numberOfShare ?? this.numberOfShare,
      doesItPassTheCriteria:
          doesItPassTheCriteria ?? this.doesItPassTheCriteria,
      buyerID: buyerID ?? this.buyerID,
      approvalOfTheCompany: approvalOfTheCompany ?? this.approvalOfTheCompany,
      shareTransactionCompleted:
          shareTransactionCompleted ?? this.shareTransactionCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'identification': identification});
    result.addAll({'shareID': shareID});
    result.addAll({'purchaseID': purchaseID});
    result.addAll({'numberOfShare': numberOfShare});
    result.addAll({'doesItPassTheCriteria': doesItPassTheCriteria});
    result.addAll({'buyerID': buyerID});
    result.addAll({'approvalOfTheCompany': approvalOfTheCompany});
    result.addAll({'shareTransactionCompleted': shareTransactionCompleted});

    return result;
  }

  factory SecondryPostShareModel.fromMap(Map<String, dynamic> map) {
    return SecondryPostShareModel(
      identification: map['identification'] ?? '',
      shareID: map['shareID'] ?? '',
      purchaseID: map['purchaseID'] ?? '',
      numberOfShare: map['numberOfShare']?.toInt() ?? 0,
      doesItPassTheCriteria: List<String>.from(map['doesItPassTheCriteria']),
      buyerID: map['buyerID'] ?? '',
      approvalOfTheCompany: List<String>.from(map['approvalOfTheCompany']),
      shareTransactionCompleted: map['shareTransactionCompleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory SecondryPostShareModel.fromJson(String source) =>
      SecondryPostShareModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SecondryPostShareModel(identification: $identification, shareID: $shareID, purchaseID: $purchaseID, numberOfShare: $numberOfShare, doesItPassTheCriteria: $doesItPassTheCriteria, buyerID: $buyerID, approvalOfTheCompany: $approvalOfTheCompany, shareTransactionCompleted: $shareTransactionCompleted)';
  }
}

void main(List<String> args) {
  SecondryPostShareModel X = SecondryPostShareModel(
      identification: 'identification',
      shareID: 'shareID',
      purchaseID: 'purchaseID',
      numberOfShare: 52);
  print(X.toMap());
}
