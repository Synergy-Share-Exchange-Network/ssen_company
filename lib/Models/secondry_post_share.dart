import 'dart:convert';

class SecondryPostShareModel {
  String identification;
  String shareID;
  String sellerID;
  String companyID;
  String purchaseID;
  String date;
  int numberOfShare;
  double pricePerShare;
  List<String> doesItPassTheCriteria;
  List<String> buyer;
  List<String> approvalOfTheCompany;
  List<String> shareTransactionCompleted;
  bool isDeleted;
  bool isHidden;
  SecondryPostShareModel({
    identification,
    shareID,
    sellerID,
    companyID,
    purchaseID,
    numberOfShare,
    pricePerShare,
    date,
    doesItPassTheCriteria,
    buyer,
    approvalOfTheCompany,
    shareTransactionCompleted,
    isDeleted,
    isHidden,
  })  : identification = identification ?? '',
        shareID = shareID ?? '',
        sellerID = sellerID ?? '',
        companyID = companyID ?? '',
        purchaseID = purchaseID ?? '',
        date = date ?? '',
        numberOfShare = numberOfShare ?? 0,
        pricePerShare = pricePerShare ?? 0,
        doesItPassTheCriteria = doesItPassTheCriteria ?? [''],
        buyer = buyer ?? [''],
        approvalOfTheCompany = approvalOfTheCompany ?? [''],
        shareTransactionCompleted = shareTransactionCompleted ?? [''],
        isDeleted = isDeleted ?? false,
        isHidden = isHidden ?? false;

  SecondryPostShareModel copyWith({
    String? identification,
    String? shareID,
    String? sellerID,
    String? companyID,
    String? purchaseID,
    String? date,
    int? numberOfShare,
    double? pricePerShare,
    List<String>? doesItPassTheCriteria,
    List<String>? buyer,
    List<String>? approvalOfTheCompany,
    List<String>? shareTransactionCompleted,
    bool? isDeleted,
    bool? isHidden,
  }) {
    return SecondryPostShareModel(
      identification: identification ?? this.identification,
      shareID: shareID ?? this.shareID,
      sellerID: sellerID ?? this.sellerID,
      companyID: companyID ?? this.companyID,
      purchaseID: purchaseID ?? this.purchaseID,
      date: date ?? this.date,
      numberOfShare: numberOfShare ?? this.numberOfShare,
      pricePerShare: pricePerShare ?? this.pricePerShare,
      doesItPassTheCriteria:
          doesItPassTheCriteria ?? this.doesItPassTheCriteria,
      buyer: buyer ?? this.buyer,
      approvalOfTheCompany: approvalOfTheCompany ?? this.approvalOfTheCompany,
      shareTransactionCompleted:
          shareTransactionCompleted ?? this.shareTransactionCompleted,
      isDeleted: isDeleted ?? this.isDeleted,
      isHidden: isHidden ?? this.isHidden,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'identification': identification});
    result.addAll({'shareID': shareID});
    result.addAll({'sellerID': sellerID});
    result.addAll({'companyID': companyID});
    result.addAll({'purchaseID': purchaseID});
    result.addAll({'date': date});
    result.addAll({'numberOfShare': numberOfShare});
    result.addAll({'pricePerShare': pricePerShare});
    result.addAll({'doesItPassTheCriteria': doesItPassTheCriteria});
    result.addAll({'buyer': buyer});
    result.addAll({'approvalOfTheCompany': approvalOfTheCompany});
    result.addAll({'shareTransactionCompleted': shareTransactionCompleted});
    result.addAll({'isDeleted': isDeleted});
    result.addAll({'isHidden': isHidden});

    return result;
  }

  factory SecondryPostShareModel.fromMap(Map<String, dynamic> map) {
    return SecondryPostShareModel(
      identification: map['identification'] ?? '',
      shareID: map['shareID'] ?? '',
      sellerID: map['sellerID'] ?? '',
      companyID: map['companyID'] ?? '',
      purchaseID: map['purchaseID'] ?? '',
      date: map['date'] ?? '',
      numberOfShare: map['numberOfShare']?.toInt() ?? 0,
      pricePerShare: map['pricePerShare']?.toInt() ?? 0.0,
      doesItPassTheCriteria: List<String>.from(map['doesItPassTheCriteria']),
      buyer: List<String>.from(map['buyer']),
      approvalOfTheCompany: List<String>.from(map['approvalOfTheCompany']),
      shareTransactionCompleted:
          List<String>.from(map['shareTransactionCompleted']),
      isDeleted: map['isDeleted'] ?? false,
      isHidden: map['isHidden'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory SecondryPostShareModel.fromJson(String source) =>
      SecondryPostShareModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SecondryPostShareModel(identification: $identification, shareID: $shareID, sellerID: $sellerID,companyID: $companyID purchaseID: $purchaseID, date: $date,numberOfShare: $numberOfShare,pricePerShare: $pricePerShare, buyer: $buyer, doesItPassTheCriteria: $doesItPassTheCriteria,  approvalOfTheCompany: $approvalOfTheCompany, shareTransactionCompleted: $shareTransactionCompleted, isDeleted: $isDeleted,isHidden: $isHidden)';
  }
}

// void main(List<String> args) {
//   SecondryPostShareModel X = SecondryPostShareModel(
//       identification: 'identification',
//       shareID: 'shareID',
//       sellerID: 'sellerID',
//       purchaseID: 'purchaseID',
//       date: 'date',
//       numberOfShare: 52);

//   print(X.toMap());
// }
