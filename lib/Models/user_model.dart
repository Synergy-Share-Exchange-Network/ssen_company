import 'dart:convert';

class UserModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  String identification;
  String userCreatedDate;
  String email;
  String role;
  String title;
  String gender;
  String birthDate;
  String nationality;
  String region;
  String woreda;
  String kebele;
  String subCity;
  String houseNumber;
  List<String> profilePicture;
  List<String> secondaryMarket;
  List<String> companiesId;
  List<String> secondarySub;
  List<String> assets;
  List<String> address;
  List<String> kebeleIDPhoto;
  bool isEnabled;
  bool isDeleted;
  bool isBanned;
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    identification,
    userCreatedDate,
    email,
    role,
    title,
    gender,
    birthDate,
    nationality,
    region,
    woreda,
    kebele,
    subCity,
    houseNumber,
    profilePicture,
    secondaryMarket,
    companiesId,
    secondarySub,
    assets,
    address,
    kebeleIDPhoto,
    isEnabled,
    isDeleted,
    isBanned,
  })  : identification = identification ?? '',
        userCreatedDate = userCreatedDate ?? '',
        email = email ?? '',
        role = role ?? 'user',
        title = title ?? '',
        gender = gender ?? '',
        birthDate = birthDate ?? '',
        nationality = nationality ?? '',
        region = region ?? '',
        woreda = woreda ?? '',
        kebele = kebele ?? '',
        subCity = subCity ?? '',
        houseNumber = houseNumber ?? '',
        profilePicture = profilePicture ?? [''],
        secondaryMarket = secondaryMarket ?? [''],
        companiesId = companiesId ?? [''],
        secondarySub = secondarySub ?? [''],
        assets = assets ?? [''],
        address = address ?? [''],
        kebeleIDPhoto = kebeleIDPhoto ?? [''],
        isEnabled = isEnabled ?? false,
        isDeleted = isDeleted ?? false,
        isBanned = isBanned ?? false;

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? identification,
    String? userCreatedDate,
    String? email,
    String? role,
    String? title,
    String? gender,
    String? birthDate,
    String? nationality,
    String? region,
    String? woreda,
    String? kebele,
    String? subCity,
    String? houseNumber,
    List<String>? profilePicture,
    List<String>? secondaryMarket,
    List<String>? companiesId,
    List<String>? secondarySub,
    List<String>? assets,
    List<String>? address,
    List<String>? kebeleIDPhoto,
    bool? isEnabled,
    bool? isDeleted,
    bool? isBanned,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      identification: identification ?? this.identification,
      userCreatedDate: userCreatedDate ?? this.userCreatedDate,
      email: email ?? this.email,
      role: role ?? this.role,
      title: title ?? this.title,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      nationality: nationality ?? this.nationality,
      region: region ?? this.region,
      woreda: woreda ?? this.woreda,
      kebele: kebele ?? this.kebele,
      subCity: subCity ?? this.subCity,
      houseNumber: houseNumber ?? this.houseNumber,
      profilePicture: profilePicture ?? this.profilePicture,
      secondaryMarket: secondaryMarket ?? this.secondaryMarket,
      companiesId: companiesId ?? this.companiesId,
      secondarySub: secondarySub ?? this.secondarySub,
      assets: assets ?? this.assets,
      address: address ?? this.address,
      kebeleIDPhoto: kebeleIDPhoto ?? this.kebeleIDPhoto,
      isEnabled: isEnabled ?? this.isEnabled,
      isDeleted: isDeleted ?? this.isDeleted,
      isBanned: isBanned ?? this.isBanned,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'identification': identification});
    result.addAll({'userCreatedDate': userCreatedDate});
    result.addAll({'email': email});
    result.addAll({'role': role});
    result.addAll({'title': title});
    result.addAll({'gender': gender});
    result.addAll({'birthDate': birthDate});
    result.addAll({'nationality': nationality});
    result.addAll({'region': region});
    result.addAll({'woreda': woreda});
    result.addAll({'kebele': kebele});
    result.addAll({'subCity': subCity});
    result.addAll({'houseNumber': houseNumber});
    result.addAll({'profilePicture': profilePicture});
    result.addAll({'secondaryMarket': secondaryMarket});
    result.addAll({'companiesId': companiesId});
    result.addAll({'secondarySub': secondarySub});
    result.addAll({'assets': assets});
    result.addAll({'address': address});
    result.addAll({'kebeleIDPhoto': kebeleIDPhoto});
    result.addAll({'isEnabled': isEnabled});
    result.addAll({'isDeleted': isDeleted});
    result.addAll({'isBanned': isBanned});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      identification: map['identification'] ?? '',
      userCreatedDate: map['userCreatedDate'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      title: map['title'] ?? '',
      gender: map['gender'] ?? '',
      birthDate: map['birthDate'] ?? '',
      nationality: map['nationality'] ?? '',
      region: map['region'] ?? '',
      woreda: map['woreda'] ?? '',
      kebele: map['kebele'] ?? '',
      subCity: map['subCity'] ?? '',
      houseNumber: map['houseNumber'] ?? '',
      profilePicture: List<String>.from(map['profilePicture']),
      secondaryMarket: List<String>.from(map['secondaryMarket']),
      companiesId: List<String>.from(map['companiesId']),
      secondarySub: List<String>.from(map['secondarySub']),
      assets: List<String>.from(map['assets']),
      address: List<String>.from(map['address']),
      kebeleIDPhoto: List<String>.from(map['kebeleIDPhoto']),
      isEnabled: map['isEnabled'] ?? false,
      isDeleted: map['isDeleted'] ?? false,
      isBanned: map['isBanned'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, identification: $identification, userCreatedDate: $userCreatedDate, email: $email, role: $role, title: $title, gender: $gender, birthDate: $birthDate, nationality: $nationality, region: $region, woreda: $woreda,kebele: $kebele,subCity: $subCity, houseNumber: $houseNumber,profilePicture: $profilePicture,secondaryMarket: $secondaryMarket,companiesId, $companiesId, secondarySub: $secondarySub, assets: $assets,address: $address, kebeleIDPhoto: $kebeleIDPhoto, isEnabled: $isEnabled, isDeleted: $isDeleted, isBanned: $isBanned)';
  }
}

void main(List<String> args) {
  UserModel x = UserModel(
      firstName: 'birhan',
      lastName: 'mulugeta',
      phoneNumber: '09876543',
      role: 'user');
  print(x.toMap());
}
