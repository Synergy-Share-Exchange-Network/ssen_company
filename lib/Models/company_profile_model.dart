import 'dart:convert';

class CompanyProfileModel {
  String identification;
  final String name;
  final String businessSector;
  final String lineOfBusiness;
  final String yearOfEstablishment;
  final String email;
  String motto;
  String shareID;
  String description;
  String mission;
  String vision;
  String value;
  String target;
  String goal;
  String history;
  String mileStone;
  String locationDescription;
  String userRequirment;
  String phoneNumber;
  String poBox;
  String tinNumber;
  String createdDay;

  List<String> whyInvestID;
  List<String> subscribersID;
  List<String> brandImage;
  List<String> logoImage;
  List<String> productID;
  List<String> serviceID;
  List<String> employee;
  List<String> keyFigureID;
  List<String> testimonialID;
  List<String> partners;
  List<String> awardAndRecognition;
  List<String> bankAccount;
  List<String> announcementID;
  List<String> faqID;
  List<String> termconditionID;
  List<String> longLat;
  List<String> socialMediaLink;
  List<String> secondaryMarket;
  List<String> shareSalesLicense;
  List<String> adminRejection;
  List<String> tradeLicense;

  double capital;
  double aimedCapital;
  bool isDeleted;
  bool isHidden;
  bool isVerified;
  bool isBanned;
  CompanyProfileModel({
    required this.name,
    required this.businessSector,
    required this.lineOfBusiness,
    required this.yearOfEstablishment,
    required this.email,
    identification,
    motto,
    shareID,
    description,
    mission,
    vision,
    value,
    target,
    goal,
    whyInvestID,
    history,
    mileStone,
    locationDescription,
    userRequirment,
    phoneNumber,
    poBox,
    tinNumber,
    createdDay,
    subscribersID,
    brandImage,
    logoImage,
    productID,
    serviceID,
    employee,
    keyFigureID,
    testimonialID,
    partners,
    awardAndRecognition,
    bankAccount,
    announcementID,
    faqID,
    termconditionID,
    longLat,
    socialMediaLink,
    secondaryMarket,
    tradeLicense,
    shareSalesLicense,
    adminRejection,
    capital,
    aimedCapital,
    isDeleted,
    isHidden,
    isVerified,
    isBanned,
  })  : identification = identification ?? '',
        motto = motto ?? '',
        shareID = shareID ?? '',
        description = description ?? '',
        mission = mission ?? '',
        vision = vision ?? '',
        value = value ?? '',
        target = target ?? '',
        goal = goal ?? '',
        whyInvestID = whyInvestID ?? [''],
        history = history ?? '',
        mileStone = mileStone ?? '',
        locationDescription = locationDescription ?? '',
        userRequirment = userRequirment ?? '',
        phoneNumber = phoneNumber ?? '',
        poBox = poBox ?? '',
        tinNumber = tinNumber ?? '',
        createdDay = createdDay ?? '',
        subscribersID = subscribersID ?? [''],
        brandImage = brandImage ?? [''],
        logoImage = logoImage ?? [''],
        productID = productID ?? [''],
        serviceID = serviceID ?? [''],
        employee = employee ?? [''],
        keyFigureID = keyFigureID ?? [''],
        testimonialID = testimonialID ?? [''],
        partners = partners ?? [''],
        awardAndRecognition = awardAndRecognition ?? [''],
        bankAccount = bankAccount ?? [''],
        announcementID = announcementID ?? [''],
        faqID = faqID ?? [''],
        termconditionID = termconditionID ?? [''],
        longLat = longLat ?? [''],
        socialMediaLink = socialMediaLink ?? [''],
        secondaryMarket = secondaryMarket ?? [''],
        shareSalesLicense = shareSalesLicense ?? [''],
        adminRejection = adminRejection ?? [''],
        tradeLicense = tradeLicense ?? [''],
        capital = capital ?? 0.0,
        aimedCapital = aimedCapital ?? 0.0,
        isDeleted = isDeleted ?? false,
        isHidden = isHidden ?? false,
        isVerified = isVerified ?? false,
        isBanned = isBanned ?? false;

  CompanyProfileModel copyWith({
    String? identification,
    String? name,
    String? businessSector,
    String? lineOfBusiness,
    String? yearOfEstablishment,
    String? email,
    String? motto,
    String? shareID,
    String? description,
    String? mission,
    String? vision,
    String? value,
    String? target,
    String? goal,
    List<String>? whyInvestID,
    String? history,
    String? mileStone,
    String? locationDescription,
    String? userRequirment,
    String? phoneNumber,
    String? poBox,
    String? tinNumber,
    String? createdDay,
    List<String>? subscribersID,
    List<String>? brandImage,
    List<String>? logoImage,
    List<String>? productID,
    List<String>? serviceID,
    List<String>? employee,
    List<String>? keyFigureID,
    List<String>? testimonialID,
    List<String>? partners,
    List<String>? awardAndRecognition,
    List<String>? bankAccount,
    List<String>? announcementID,
    List<String>? faqID,
    List<String>? termconditionID,
    List<String>? longLat,
    List<String>? socialMediaLink,
    List<String>? secondaryMarket,
    List<String>? tradeLicense,
    List<String>? shareSalesLicense,
    List<String>? adminRejection,
    double? capital,
    double? aimedCapital,
    bool? isDeleted,
    bool? isHidden,
    bool? isVerified,
    bool? isBanned,
  }) {
    return CompanyProfileModel(
      identification: identification ?? this.identification,
      name: name ?? this.name,
      businessSector: businessSector ?? this.businessSector,
      lineOfBusiness: lineOfBusiness ?? this.lineOfBusiness,
      yearOfEstablishment: yearOfEstablishment ?? this.yearOfEstablishment,
      email: email ?? this.email,
      motto: motto ?? this.motto,
      shareID: shareID ?? this.shareID,
      description: description ?? this.description,
      mission: mission ?? this.mission,
      vision: vision ?? this.vision,
      value: value ?? this.value,
      target: target ?? this.target,
      goal: goal ?? this.goal,
      whyInvestID: whyInvestID ?? this.whyInvestID,
      history: history ?? this.history,
      mileStone: mileStone ?? this.mileStone,
      locationDescription: locationDescription ?? this.locationDescription,
      userRequirment: userRequirment ?? this.userRequirment,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      poBox: poBox ?? this.poBox,
      tinNumber: tinNumber ?? this.tinNumber,
      createdDay: createdDay ?? this.createdDay,
      subscribersID: subscribersID ?? this.subscribersID,
      brandImage: brandImage ?? this.brandImage,
      logoImage: logoImage ?? this.logoImage,
      productID: productID ?? this.productID,
      serviceID: serviceID ?? this.serviceID,
      employee: employee ?? this.employee,
      keyFigureID: keyFigureID ?? this.keyFigureID,
      testimonialID: testimonialID ?? this.testimonialID,
      partners: partners ?? this.partners,
      awardAndRecognition: awardAndRecognition ?? this.awardAndRecognition,
      bankAccount: bankAccount ?? this.bankAccount,
      announcementID: announcementID ?? this.announcementID,
      faqID: faqID ?? this.faqID,
      termconditionID: termconditionID ?? this.termconditionID,
      longLat: longLat ?? this.longLat,
      socialMediaLink: socialMediaLink ?? this.socialMediaLink,
      secondaryMarket: secondaryMarket ?? this.secondaryMarket,
      shareSalesLicense: shareSalesLicense ?? this.shareSalesLicense,
      adminRejection: adminRejection ?? this.adminRejection,
      tradeLicense: tradeLicense ?? this.tradeLicense,
      capital: capital ?? this.capital,
      aimedCapital: aimedCapital ?? this.aimedCapital,
      isDeleted: isDeleted ?? this.isDeleted,
      isHidden: isHidden ?? this.isHidden,
      isVerified: isVerified ?? this.isVerified,
      isBanned: isBanned ?? this.isBanned,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'identification': identification});
    result.addAll({'name': name});
    result.addAll({'businessSector': businessSector});
    result.addAll({'lineOfBusiness': lineOfBusiness});
    result.addAll({'yearOfEstablishment': yearOfEstablishment});
    result.addAll({'email': email});
    result.addAll({'motto': motto});
    result.addAll({'shareID': shareID});
    result.addAll({'description': description});
    result.addAll({'mission': mission});
    result.addAll({'vision': vision});
    result.addAll({'value': value});
    result.addAll({'target': target});
    result.addAll({'goal': goal});
    result.addAll({'whyInvestID': whyInvestID});
    result.addAll({'history': history});
    result.addAll({'mileStone': mileStone});
    result.addAll({'locationDescription': locationDescription});
    result.addAll({'userRequirment': userRequirment});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'poBox': poBox});
    result.addAll({'tinNumber': tinNumber});
    result.addAll({'createdDay': createdDay});
    result.addAll({'subscribersID': subscribersID});
    result.addAll({'brandImage': brandImage});
    result.addAll({'logoImage': logoImage});
    result.addAll({'productID': productID});
    result.addAll({'serviceID': serviceID});
    result.addAll({'employee': employee});
    result.addAll({'keyFigureID': keyFigureID});
    result.addAll({'testimonialID': testimonialID});
    result.addAll({'partners': partners});
    result.addAll({'awardAndRecognition': awardAndRecognition});
    result.addAll({'bankAccount': bankAccount});
    result.addAll({'announcementID': announcementID});
    result.addAll({'faqID': faqID});
    result.addAll({'termconditionID': termconditionID});
    result.addAll({'longLat': longLat});
    result.addAll({'socialMediaLink': socialMediaLink});
    result.addAll({'secondaryMarket': secondaryMarket});
    result.addAll({'tradeLicense': tradeLicense});
    result.addAll({'shareSalesLicense': shareSalesLicense});
    result.addAll({'adminRejection': adminRejection});
    result.addAll({'capital': capital});
    result.addAll({'aimedCapital': aimedCapital});
    result.addAll({'isDeleted': isDeleted});
    result.addAll({'isHidden': isHidden});
    result.addAll({'isVerified': isVerified});
    result.addAll({'isBanned': isBanned});

    return result;
  }

  factory CompanyProfileModel.fromMap(Map<String, dynamic> map) {
    return CompanyProfileModel(
      identification: map['identification'] ?? '',
      name: map['name'] ?? '',
      businessSector: map['businessSector'] ?? '',
      lineOfBusiness: map['lineOfBusiness'] ?? '',
      yearOfEstablishment: map['yearOfEstablishment'] ?? '',
      email: map['email'] ?? '',
      motto: map['motto'] ?? '',
      shareID: map['shareID'] ?? '',
      description: map['description'] ?? '',
      mission: map['mission'] ?? '',
      vision: map['vision'] ?? '',
      value: map['value'] ?? '',
      target: map['target'] ?? '',
      goal: map['goal'] ?? '',
      history: map['history'] ?? '',
      mileStone: map['mileStone'] ?? '',
      locationDescription: map['locationDescription'] ?? '',
      userRequirment: map['userRequirment'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      poBox: map['poBox'] ?? '',
      tinNumber: map['tinNumber'] ?? '',
      createdDay: map['createdDay'] ?? '',
      subscribersID: List<String>.from(map['subscribersID']),
      brandImage: List<String>.from(map['brandImage']),
      logoImage: List<String>.from(map['logoImage']),
      productID: List<String>.from(map['productID']),
      whyInvestID: List<String>.from(map['whyInvestID']),
      serviceID: List<String>.from(map['serviceID']),
      employee: List<String>.from(map['employee']),
      keyFigureID: List<String>.from(map['keyFigureID']),
      testimonialID: List<String>.from(map['testimonialID']),
      partners: List<String>.from(map['partners']),
      awardAndRecognition: List<String>.from(map['awardAndRecognition']),
      bankAccount: List<String>.from(map['bankAccount']),
      announcementID: List<String>.from(map['announcementID']),
      faqID: List<String>.from(map['faqID']),
      termconditionID: List<String>.from(map['termconditionID']),
      longLat: List<String>.from(map['longLat']),
      socialMediaLink: List<String>.from(map['socialMediaLink']),
      secondaryMarket: List<String>.from(map['secondaryMarket']),
      shareSalesLicense: List<String>.from(map['shareSalesLicense']),
      adminRejection: List<String>.from(map['adminRejection']),
      tradeLicense: List<String>.from(map['tradeLicense']),
      capital: map['capital']?.toDouble() ?? 0.0,
      aimedCapital: map['aimedCapital']?.toDouble() ?? 0.0,
      isDeleted: map['isDeleted'] ?? false,
      isHidden: map['isHidden'] ?? false,
      isVerified: map['isVerified'] ?? false,
      isBanned: map['isBanned'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyProfileModel.fromJson(String source) =>
      CompanyProfileModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CompanyProfileModel(identification: $identification, name: $name, businessSector: $businessSector, lineOfBusiness: $lineOfBusiness, yearOfEstablishment: $yearOfEstablishment, email: $email, motto: $motto, shareID: $shareID, description: $description, mission: $mission, vision: $vision, value: $value, target: $target, goal: $goal, whyInvestID: $whyInvestID, history: $history, mileStone: $mileStone, locationDescription: $locationDescription, userRequirment: $userRequirment, phoneNumber: $phoneNumber, poBox: $poBox, tinNumber: $tinNumber, createdDay:$createdDay, subscribersID: $subscribersID, brandImage: $brandImage, logoImage: $logoImage, productID: $productID, serviceID: $serviceID, employee: $employee, keyFigureID: $keyFigureID, testimonialID: $testimonialID, partners: $partners, awardAndRecognition: $awardAndRecognition, bankAccount: $bankAccount, announcementID: $announcementID, faqID: $faqID, termconditionID: $termconditionID, longLat: $longLat, socialMediaLink: $socialMediaLink,secondaryMarket: $secondaryMarket, tradeLicense:$tradeLicense, shareSalesLicense: $shareSalesLicense, adminRejection:$adminRejection, capital: $capital, aimedCapital: $aimedCapital, isDeleted: $isDeleted, isHidden: $isHidden,isVerified: $isVerified, isBanned: $isBanned)';
  }
}

// void main(List<String> args) {
//   Map<String, dynamic> companyMap = {
//     'identification': '',
//     'name': "",
//     'businessSector': null,
//     'lineOfBusiness': null,
//     'yearOfEstablishment': null,
//     'email': null,
//     'motto': null,
//     'shareID': null,
//     'description': null,
//     'mission': null,
//     'vision': null,
//     'value': null,
//     'target': null,
//     'goal': null,
//     'whynvestID': null,
//     'history': null,
//     'mileStone': null,
//     'locationDescription': null,
//     'userRequirment': null,
//     'phoneNumber': null,
//     'poBox': null,
//     'tinNumber': null,
//     'subscribersID': [],
//     'brandImage': [],
//     'logoImage': [],
//     'productID': [],
//     'serviceID': [],
//     'employee': [],
//     'keyFigureID': [],
//     'testimonialID': [],
//     'partners': [],
//     'awardAndRecognition': [],
//     'bankAccount': [],
//     'announcementID': [],
//     'faqID': [],
//     'termconditionID': [],
//     'longLat': [],
//     'socialMediaLink': [],
//     'capital': 0.0,
//     'aimedCapital': 0.0,
//     'isDeleted': false,
//     'isHidden': false,
//     'isBanned': false,
//   };

//   CompanyProfileModel y = CompanyProfileModel.fromMap(companyMap);
//   print(y.toMap());
// }
