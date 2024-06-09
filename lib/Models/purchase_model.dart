import 'dart:convert';

class PurchaseModel {
  String identification;
  String firstName;
  String lastName;
  String email;

  String secondaryId;
  String kebele;
  String subCity;
  String houseNumber;
  String phoneNumber;
  String region;
  String woreda;
  String nationality;
  String businessSector;
  String bankAccount;
  String signature;
  String shareID;
  String userID;
  String savingAccountAmount;
  String deadlineForUnpayedMoney;
  String companyID;
  String date;

  List<String> kebeleIDPhoto;
  List<String> requestSent;
  List<String> requestAccepted;
  List<String> pendingPayment;
  List<String> acceptedPayment;
  List<String> successfullyBought;
  List<String> finishedPDF;

  double numberOfShare;
  double sharePerPrice;
  double payedamount;
  double unpayedAmount;
  bool isSecondary;
  bool isSucessfull;
  PurchaseModel(
      {identification,
      firstName,
      lastName,
      email,
      kebele,
      subCity,
      secondaryId,
      houseNumber,
      phoneNumber,
      region,
      woreda,
      nationality,
      businessSector,
      bankAccount,
      signature,
      shareID,
      userID,
      savingAccountAmount,
      deadlineForUnpayedMoney,
      companyID,
      date,
      kebeleIDPhoto,
      requestSent,
      requestAccepted,
      pendingPayment,
      acceptedPayment,
      successfullyBought,
      finishedPDF,
      numberOfShare,
      sharePerPrice,
      payedamount,
      unpayedAmount,
      isSucessfull,
      isSecondary})
      : kebele = kebele ?? '',
        identification = identification ?? '',
        firstName = firstName ?? '',
        lastName = lastName ?? '',
        email = email ?? '',
        subCity = subCity ?? '',
        secondaryId = secondaryId ?? '',
        houseNumber = houseNumber ?? '',
        phoneNumber = phoneNumber ?? '',
        region = region ?? '',
        woreda = woreda ?? '',
        nationality = nationality ?? '',
        businessSector = businessSector ?? '',
        bankAccount = bankAccount ?? '',
        signature = signature ?? '',
        shareID = shareID ?? '',
        userID = userID ?? '',
        savingAccountAmount = savingAccountAmount ?? '',
        deadlineForUnpayedMoney = deadlineForUnpayedMoney ?? '',
        companyID = companyID ?? '',
        date = date ?? '',
        kebeleIDPhoto = kebeleIDPhoto ?? [],
        requestSent = requestSent ?? [],
        requestAccepted = requestAccepted ?? [],
        pendingPayment = pendingPayment ?? [],
        acceptedPayment = acceptedPayment ?? [],
        successfullyBought = successfullyBought ?? [],
        finishedPDF = finishedPDF ?? [],
        numberOfShare = numberOfShare ?? 0.0,
        sharePerPrice = sharePerPrice ?? 0.0,
        payedamount = payedamount ?? 0.0,
        isSecondary = isSecondary ?? false,
        isSucessfull = isSucessfull ?? false,
        unpayedAmount = unpayedAmount ?? 0.0;

  PurchaseModel copyWith({
    String? identification,
    String? firstName,
    String? lastName,
    String? email,
    String? kebele,
    String? subCity,
    String? secondaryId,
    String? houseNumber,
    String? phoneNumber,
    String? region,
    String? woreda,
    String? nationality,
    String? businessSector,
    String? bankAccount,
    String? signature,
    String? shareID,
    String? userID,
    String? savingAccountAmount,
    String? deadlineForUnpayedMoney,
    String? companyID,
    String? date,
    List<String>? kebeleIDPhoto,
    List<String>? requestSent,
    List<String>? requestAccepted,
    List<String>? pendingPayment,
    List<String>? acceptedPayment,
    List<String>? successfullyBought,
    List<String>? finishedPDF,
    double? numberOfShare,
    double? sharePerPrice,
    double? payedamount,
    double? unpayedAmount,
    bool? isSecondary,
    bool? isSucessfull,
  }) {
    return PurchaseModel(
      identification: identification ?? this.identification,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      kebele: kebele ?? this.kebele,
      subCity: subCity ?? this.subCity,
      secondaryId: secondaryId ?? this.secondaryId,
      houseNumber: houseNumber ?? this.houseNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      region: region ?? this.region,
      woreda: woreda ?? this.woreda,
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
      date: date ?? this.date,
      kebeleIDPhoto: kebeleIDPhoto ?? this.kebeleIDPhoto,
      requestSent: requestSent ?? this.requestSent,
      requestAccepted: requestAccepted ?? this.requestAccepted,
      pendingPayment: pendingPayment ?? this.pendingPayment,
      acceptedPayment: acceptedPayment ?? this.acceptedPayment,
      successfullyBought: successfullyBought ?? this.successfullyBought,
      finishedPDF: finishedPDF ?? this.finishedPDF,
      numberOfShare: numberOfShare ?? this.numberOfShare,
      sharePerPrice: sharePerPrice ?? this.sharePerPrice,
      payedamount: payedamount ?? this.payedamount,
      unpayedAmount: unpayedAmount ?? this.unpayedAmount,
      isSecondary: isSecondary ?? this.isSecondary,
      isSucessfull: isSucessfull ?? this.isSucessfull,
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
    result.addAll({'secondaryId': secondaryId});
    result.addAll({'houseNumber': houseNumber});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'region': region});
    result.addAll({'woreda': woreda});
    result.addAll({'nationality': nationality});
    result.addAll({'businessSector': businessSector});
    result.addAll({'bankAccount': bankAccount});
    result.addAll({'signature': signature});
    result.addAll({'shareID': shareID});
    result.addAll({'userID': userID});
    result.addAll({'savingAccountAmount': savingAccountAmount});
    result.addAll({'deadlineForUnpayedMoney': deadlineForUnpayedMoney});
    result.addAll({'companyID': companyID});
    result.addAll({'date': date});
    result.addAll({'kebeleIDPhoto': kebeleIDPhoto});
    result.addAll({'requestSent': requestSent});
    result.addAll({'requestAccepted': requestAccepted});
    result.addAll({'pendingPayment': pendingPayment});
    result.addAll({'acceptedPayment': acceptedPayment});
    result.addAll({'successfullyBought': successfullyBought});
    result.addAll({'finishedPDF': finishedPDF});
    result.addAll({'numberOfShare': numberOfShare});
    result.addAll({'sharePerPrice': sharePerPrice});
    result.addAll({'payedamount': payedamount});
    result.addAll({'unpayedAmount': unpayedAmount});
    result.addAll({'isSecondary': isSecondary});
    result.addAll({'isSucessfull': isSucessfull});

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
      secondaryId: map['secondaryId'] ?? '',
      houseNumber: map['houseNumber'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      region: map['region'] ?? '',
      woreda: map['woreda'] ?? '',
      nationality: map['nationality'] ?? '',
      businessSector: map['businessSector'] ?? '',
      bankAccount: map['bankAccount'] ?? '',
      signature: map['signature'] ?? '',
      shareID: map['shareID'] ?? '',
      userID: map['userID'] ?? '',
      savingAccountAmount: map['savingAccountAmount'] ?? '',
      deadlineForUnpayedMoney: map['deadlineForUnpayedMoney'] ?? '',
      companyID: map['companyID'] ?? '',
      date: map['date'] ?? '',
      kebeleIDPhoto: List<String>.from(map['kebeleIDPhoto']),
      requestSent: List<String>.from(map['requestSent']),
      requestAccepted: List<String>.from(map['requestAccepted']),
      pendingPayment: List<String>.from(map['pendingPayment']),
      acceptedPayment: List<String>.from(map['acceptedPayment']),
      successfullyBought: List<String>.from(map['successfullyBought']),
      finishedPDF: List<String>.from(map['finishedPDF']),
      numberOfShare: map['numberOfShare']?.toDouble() ?? 0.0,
      sharePerPrice: map['sharePerPrice']?.toDouble() ?? 0.0,
      payedamount: map['payedamount']?.toDouble() ?? 0.0,
      unpayedAmount: map['unpayedAmount']?.toDouble() ?? 0.0,
      isSecondary: map['isSecondary'] ?? false,
      isSucessfull: map['isSucessfull'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseModel.fromJson(String source) =>
      PurchaseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PurchaseModel(identification: $identification, firstName: $firstName, lastName: $lastName, email: $email, kebele: $kebele, subCity: $subCity , secondaryId:$secondaryId, houseNumber: $houseNumber, phoneNumber: $phoneNumber, region: $region, woreda: $woreda, nationality: $nationality, businessSector: $businessSector, bankAccount: $bankAccount, signature: $signature, shareID: $shareID, userID: $userID, savingAccountAmount: $savingAccountAmount, deadlineForUnpayedMoney: $deadlineForUnpayedMoney, companyID: $companyID, date:$date, kebeleIDPhoto: $kebeleIDPhoto, requestSent: $requestSent, requestAccepted: $requestAccepted, pendingPayment: $pendingPayment, acceptedPayment: $acceptedPayment, successfullyBought: $successfullyBought,finishedPDF: $finishedPDF, numberOfShare: $numberOfShare, sharePerPrice: $sharePerPrice, payedamount: $payedamount, unpayedAmount: $unpayedAmount, isSecondary:$isSecondary , isSucessfull:$isSucessfull)';
  }
}

void main(List<String> args) {
  PurchaseModel m = PurchaseModel();
  print(m.toString());
}
