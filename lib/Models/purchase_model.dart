import 'dart:convert';

class PurchaseModel {
  final String identification;
  final String firstName;
  final String lastName;
  final String email;

  String kebele;
  String subCity;
  String houseNumber;
  String phoneNumber;
  String region;
  String wereda;
  String nationality;
  String businessSector;
  String bankAccount;
  String signature;
  String shareID;
  String userID;
  String savingAccountAmount;
  String deadlineForUnpayedMoney;
  String companyID;

  List<String> kebeleID;
  List<String> requestSent;
  List<String> requestAccepted;
  List<String> pendingPayment;
  List<String> successfullyBought;

  double numberOfShare;
  double sharePerPrice;
  double payedamount;
  double unpayedAmount;
  PurchaseModel({
    required this.identification,
    required this.firstName,
    required this.lastName,
    required this.email,
    kebele,
    subCity,
    houseNumber,
    phoneNumber,
    region,
    wereda,
    nationality,
    businessSector,
    bankAccount,
    signature,
    shareID,
    userID,
    savingAccountAmount,
    deadlineForUnpayedMoney,
    companyID,
    kebeleID,
    requestSent,
    requestAccepted,
    pendingPayment,
    successfullyBought,
    numberOfShare,
    sharePerPrice,
    payedamount,
    unpayedAmount,
  })  : kebele = kebele ?? '',
        subCity = subCity ?? '',
        houseNumber = houseNumber ?? '',
        phoneNumber = phoneNumber ?? '',
        region = region ?? '',
        wereda = wereda ?? '',
        nationality = nationality ?? '',
        businessSector = businessSector ?? '',
        bankAccount = bankAccount ?? '',
        signature = signature ?? '',
        shareID = shareID ?? '',
        userID = userID ?? '',
        savingAccountAmount = savingAccountAmount ?? '',
        deadlineForUnpayedMoney = deadlineForUnpayedMoney ?? '',
        companyID = companyID ?? '',
        kebeleID = kebeleID ?? [""],
        requestSent = requestSent ?? [""],
        requestAccepted = requestAccepted ?? [""],
        pendingPayment = pendingPayment ?? [""],
        successfullyBought = successfullyBought ?? [""],
        numberOfShare = numberOfShare ?? 0.0,
        sharePerPrice = sharePerPrice ?? 0.0,
        payedamount = payedamount ?? 0.0,
        unpayedAmount = unpayedAmount ?? 0.0;

  PurchaseModel copyWith({
    String? identification,
    String? firstName,
    String? lastName,
    String? email,
    String? kebele,
    String? subCity,
    String? houseNumber,
    String? phoneNumber,
    String? region,
    String? wereda,
    String? nationality,
    String? businessSector,
    String? bankAccount,
    String? signature,
    String? shareID,
    String? userID,
    String? savingAccountAmount,
    String? deadlineForUnpayedMoney,
    String? companyID,
    List<String>? kebeleID,
    List<String>? requestSent,
    List<String>? requestAccepted,
    List<String>? pendingPayment,
    List<String>? successfullyBought,
    double? numberOfShare,
    double? sharePerPrice,
    double? payedamount,
    double? unpayedAmount,
  }) {
    return PurchaseModel(
      identification: identification ?? this.identification,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      kebele: kebele ?? this.kebele,
      subCity: subCity ?? this.subCity,
      houseNumber: houseNumber ?? this.houseNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      region: region ?? this.region,
      wereda: wereda ?? this.wereda,
      nationality: nationality ?? this.nationality,
      businessSector: businessSector ?? this.businessSector,
      bankAccount: bankAccount ?? this.bankAccount,
      signature: signature ?? this.signature,
      shareID: shareID ?? this.shareID,
      userID: userID ?? this.userID,
      savingAccountAmount: savingAccountAmount ?? this.savingAccountAmount,
      deadlineForUnpayedMoney:
          deadlineForUnpayedMoney ?? this.deadlineForUnpayedMoney,
      companyID: companyID ?? this.companyID,
      kebeleID: kebeleID ?? this.kebeleID,
      requestSent: requestSent ?? this.requestSent,
      requestAccepted: requestAccepted ?? this.requestAccepted,
      pendingPayment: pendingPayment ?? this.pendingPayment,
      successfullyBought: successfullyBought ?? this.successfullyBought,
      numberOfShare: numberOfShare ?? this.numberOfShare,
      sharePerPrice: sharePerPrice ?? this.sharePerPrice,
      payedamount: payedamount ?? this.payedamount,
      unpayedAmount: unpayedAmount ?? this.unpayedAmount,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'identification': identification});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'email': email});
    result.addAll({'kebele': kebele});
    result.addAll({'subCity': subCity});
    result.addAll({'houseNumber': houseNumber});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'region': region});
    result.addAll({'wereda': wereda});
    result.addAll({'nationality': nationality});
    result.addAll({'businessSector': businessSector});
    result.addAll({'bankAccount': bankAccount});
    result.addAll({'signature': signature});
    result.addAll({'shareID': shareID});
    result.addAll({'userID': userID});
    result.addAll({'savingAccountAmount': savingAccountAmount});
    result.addAll({'deadlineForUnpayedMoney': deadlineForUnpayedMoney});
    result.addAll({'companyID': companyID});
    result.addAll({'kebeleID': kebeleID});
    result.addAll({'requestSent': requestSent});
    result.addAll({'requestAccepted': requestAccepted});
    result.addAll({'pendingPayment': pendingPayment});
    result.addAll({'successfullyBought': successfullyBought});
    result.addAll({'numberOfShare': numberOfShare});
    result.addAll({'sharePerPrice': sharePerPrice});
    result.addAll({'payedamount': payedamount});
    result.addAll({'unpayedAmount': unpayedAmount});

    return result;
  }

  factory PurchaseModel.fromMap(Map<String, dynamic> map) {
    return PurchaseModel(
      identification: map['identification'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      kebele: map['kebele'] ?? '',
      subCity: map['subCity'] ?? '',
      houseNumber: map['houseNumber'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      region: map['region'] ?? '',
      wereda: map['wereda'] ?? '',
      nationality: map['nationality'] ?? '',
      businessSector: map['businessSector'] ?? '',
      bankAccount: map['bankAccount'] ?? '',
      signature: map['signature'] ?? '',
      shareID: map['shareID'] ?? '',
      userID: map['userID'] ?? '',
      savingAccountAmount: map['savingAccountAmount'] ?? '',
      deadlineForUnpayedMoney: map['deadlineForUnpayedMoney'] ?? '',
      companyID: map['companyID'] ?? '',
      kebeleID: List<String>.from(map['kebeleID']),
      requestSent: List<String>.from(map['requestSent']),
      requestAccepted: List<String>.from(map['requestAccepted']),
      pendingPayment: List<String>.from(map['pendingPayment']),
      successfullyBought: List<String>.from(map['successfullyBought']),
      numberOfShare: map['numberOfShare']?.toDouble() ?? 0.0,
      sharePerPrice: map['sharePerPrice']?.toDouble() ?? 0.0,
      payedamount: map['payedamount']?.toDouble() ?? 0.0,
      unpayedAmount: map['unpayedAmount']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseModel.fromJson(String source) =>
      PurchaseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PurchaseModel(identification: $identification, firstName: $firstName, lastName: $lastName, email: $email, kebele: $kebele, subCity: $subCity, houseNumber: $houseNumber, phoneNumber: $phoneNumber, region: $region, wereda: $wereda, nationality: $nationality, businessSector: $businessSector, bankAccount: $bankAccount, signature: $signature, shareID: $shareID, userID: $userID, savingAccountAmount: $savingAccountAmount, deadlineForUnpayedMoney: $deadlineForUnpayedMoney, companyID: $companyID, kebeleID: $kebeleID, requestSent: $requestSent, requestAccepted: $requestAccepted, pendingPayment: $pendingPayment, successfullyBought: $successfullyBought, numberOfShare: $numberOfShare, sharePerPrice: $sharePerPrice, payedamount: $payedamount, unpayedAmount: $unpayedAmount)';
  }
}

// void main(List<String> args) {
//   PurchaseModel x = PurchaseModel(
//       identification: 'identification',
//       firstName: 'firstName',
//       lastName: 'lastName',
//       email: 'email');
//   print(x.toJson());
// }
