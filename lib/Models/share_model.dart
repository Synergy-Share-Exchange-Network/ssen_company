import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ShareModel {
  final double savingAccountPercentage;
  final String proclamationNumber;
  final int minimumNumberOfBuyer;
  final int maximumNumberOfBuyer;
  final List<String> bankInformation;
  final List<String> shareImage;
  final double unitSharePrice;
  final double noOfShares;
  final double divident;
  final double minimumPaymentInPercent;
  final double minimumNumberOfSharesToBuy;
  final double maximumNumberOfSharesToBuy;
  String requirement;
  String description;
  List<String> searchKeyWords;
  int returnDividentTimeInDays;
  int timeToReturnRemainPayment;
  String currancy;
  ShareModel({
    required this.savingAccountPercentage,
    required this.proclamationNumber,
    required this.minimumNumberOfBuyer,
    required this.maximumNumberOfBuyer,
    required this.bankInformation,
    required this.shareImage,
    required this.unitSharePrice,
    required this.noOfShares,
    required this.divident,
    required this.minimumPaymentInPercent,
    required this.minimumNumberOfSharesToBuy,
    required this.maximumNumberOfSharesToBuy,
    requirement,
    description,
    searchKeyWords,
    returnDividentTimeInDays,
    timeToReturnRemainPayment,
    currancy,
  })  : requirement = requirement ?? [''],
        description = description ?? [''],
        searchKeyWords = searchKeyWords ?? [''],
        returnDividentTimeInDays = returnDividentTimeInDays ?? [''],
        timeToReturnRemainPayment = timeToReturnRemainPayment ?? [''],
        currancy = currancy ?? [''];

  ShareModel copyWith({
    double? savingAccountPercentage,
    String? proclamationNumber,
    int? minimumNumberOfBuyer,
    int? maximumNumberOfBuyer,
    List<String>? bankInformation,
    List<String>? shareImage,
    double? unitSharePrice,
    double? noOfShares,
    double? divident,
    double? minimumPaymentInPercent,
    double? minimumNumberOfSharesToBuy,
    double? maximumNumberOfSharesToBuy,
    String? requirement,
    String? description,
    List<String>? searchKeyWords,
    int? returnDividentTimeInDays,
    int? timeToReturnRemainPayment,
    String? currancy,
  }) {
    return ShareModel(
      savingAccountPercentage:
          savingAccountPercentage ?? this.savingAccountPercentage,
      proclamationNumber: proclamationNumber ?? this.proclamationNumber,
      minimumNumberOfBuyer: minimumNumberOfBuyer ?? this.minimumNumberOfBuyer,
      maximumNumberOfBuyer: maximumNumberOfBuyer ?? this.maximumNumberOfBuyer,
      bankInformation: bankInformation ?? this.bankInformation,
      shareImage: shareImage ?? this.shareImage,
      unitSharePrice: unitSharePrice ?? this.unitSharePrice,
      noOfShares: noOfShares ?? this.noOfShares,
      divident: divident ?? this.divident,
      minimumPaymentInPercent:
          minimumPaymentInPercent ?? this.minimumPaymentInPercent,
      minimumNumberOfSharesToBuy:
          minimumNumberOfSharesToBuy ?? this.minimumNumberOfSharesToBuy,
      maximumNumberOfSharesToBuy:
          maximumNumberOfSharesToBuy ?? this.maximumNumberOfSharesToBuy,
      requirement: requirement ?? this.requirement,
      description: description ?? this.description,
      searchKeyWords: searchKeyWords ?? this.searchKeyWords,
      returnDividentTimeInDays:
          returnDividentTimeInDays ?? this.returnDividentTimeInDays,
      timeToReturnRemainPayment:
          timeToReturnRemainPayment ?? this.timeToReturnRemainPayment,
      currancy: currancy ?? this.currancy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'savingAccountPercentage': savingAccountPercentage,
      'proclamationNumber': proclamationNumber,
      'minimumNumberOfBuyer': minimumNumberOfBuyer,
      'maximumNumberOfBuyer': maximumNumberOfBuyer,
      'bankInformation': bankInformation,
      'shareImage': shareImage,
      'unitSharePrice': unitSharePrice,
      'noOfShares': noOfShares,
      'divident': divident,
      'minimumPaymentInPercent': minimumPaymentInPercent,
      'minimumNumberOfSharesToBuy': minimumNumberOfSharesToBuy,
      'maximumNumberOfSharesToBuy': maximumNumberOfSharesToBuy,
      'requirement': requirement,
      'description': description,
      'searchKeyWords': searchKeyWords,
      'returnDividentTimeInDays': returnDividentTimeInDays,
      'timeToReturnRemainPayment': timeToReturnRemainPayment,
      'currancy': currancy,
    };
  }

  factory ShareModel.fromMap(Map<String, dynamic> map) {
    return ShareModel(
      savingAccountPercentage: map['savingAccountPercentage'] as double,
      proclamationNumber: map['proclamationNumber'] as String,
      minimumNumberOfBuyer: map['minimumNumberOfBuyer'] as int,
      maximumNumberOfBuyer: map['maximumNumberOfBuyer'] as int,
      bankInformation:
          List<String>.from(map['bankInformation'] as List<String>),
      shareImage: List<String>.from(map['shareImage'] as List<String>),
      unitSharePrice: map['unitSharePrice'] as double,
      noOfShares: map['noOfShares'] as double,
      divident: map['divident'] as double,
      minimumPaymentInPercent: map['minimumPaymentInPercent'] as double,
      minimumNumberOfSharesToBuy: map['minimumNumberOfSharesToBuy'] as double,
      maximumNumberOfSharesToBuy: map['maximumNumberOfSharesToBuy'] as double,
      requirement: map['requirement'] as String,
      description: map['description'] as String,
      searchKeyWords: List<String>.from(map['searchKeyWords'] as List<String>),
      returnDividentTimeInDays: map['returnDividentTimeInDays'] as int,
      timeToReturnRemainPayment: map['timeToReturnRemainPayment'] as int,
      currancy: map['currancy'] as String,
    );
  }
  String toJson() => json.encode(toMap());

  factory ShareModel.fromJson(String source) =>
      ShareModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShareModel(savingAccountPercentage: $savingAccountPercentage, proclamationNumber: $proclamationNumber, minimumNumberOfBuyer: $minimumNumberOfBuyer, maximumNumberOfBuyer: $maximumNumberOfBuyer, bankInformation: $bankInformation, shareImage: $shareImage, unitSharePrice: $unitSharePrice, noOfShares: $noOfShares, divident: $divident, minimumPaymentInPercent: $minimumPaymentInPercent, minimumNumberOfSharesToBuy: $minimumNumberOfSharesToBuy, maximumNumberOfSharesToBuy: $maximumNumberOfSharesToBuy, requirement: $requirement, description: $description, searchKeyWords: $searchKeyWords, returnDividentTimeInDays: $returnDividentTimeInDays, timeToReturnRemainPayment: $timeToReturnRemainPayment, currancy: $currancy)';
  }
}

void main(List<String> args) {
  ShareModel M = ShareModel(
    savingAccountPercentage: 12,
    proclamationNumber: "proclamationNumber",
    minimumNumberOfBuyer: 12,
    maximumNumberOfBuyer: 12,
    bankInformation: ['bankInfo1', 'bankInfo2'], // Provide a list of strings
    shareImage: ['image1', 'image2'], // Provide a list of strings
    unitSharePrice: 10.0, // Replace with the actual value
    noOfShares: 100.0, // Replace with the actual value
    divident: 5.0, // Replace with the actual value
    minimumPaymentInPercent: 10.0, // Replace with the actual value
    minimumNumberOfSharesToBuy: 1.0, // Replace with the actual value
    maximumNumberOfSharesToBuy: 10.0, // Replace with the actual value
    requirement: "Requirements", // Replace with the actual value
    description: "Description", // Replace with the actual value
    searchKeyWords: ['keyword1', 'keyword2'], // Provide a list of strings
    returnDividentTimeInDays: 30, // Replace with the actual value
    timeToReturnRemainPayment: 60, // Replace with the actual value
    currancy: "USD", // Replace with the actual value
  );

  print(M.toString());
}
