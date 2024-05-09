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
  List<String> profilePicture;
  List<String> address;
  List<String> identificationPhoto;
  bool enabeled;
  bool delete;
  bool ban;
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
    profilePicture,
    address,
    identificationPhoto,
    enabeled,
    delete,
    ban,
  })  : identification = identification ?? '',
        userCreatedDate = userCreatedDate ?? '',
        email = email ?? '',
        role = role ?? '',
        title = title ?? '',
        gender = gender ?? '',
        birthDate = birthDate ?? '',
        nationality = nationality ?? '',
        region = region ?? '',
        woreda = woreda ?? '',
        profilePicture = profilePicture ?? [''],
        address = address ?? [''],
        identificationPhoto = identificationPhoto ?? [''],
        enabeled = enabeled ?? false,
        delete = delete ?? false,
        ban = ban ?? false;

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
    List<String>? profilePicture,
    List<String>? address,
    List<String>? identificationPhoto,
    bool? enabeled,
    bool? delete,
    bool? ban,
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
      profilePicture: profilePicture ?? this.profilePicture,
      address: address ?? this.address,
      identificationPhoto: identificationPhoto ?? this.identificationPhoto,
      enabeled: enabeled ?? this.enabeled,
      delete: delete ?? this.delete,
      ban: ban ?? this.ban,
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
    result.addAll({'profilePicture': profilePicture});
    result.addAll({'address': address});
    result.addAll({'identificationPhoto': identificationPhoto});
    result.addAll({'enabeled': enabeled});
    result.addAll({'delete': delete});
    result.addAll({'ban': ban});

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
      profilePicture: List<String>.from(map['profilePicture']),
      address: List<String>.from(map['address']),
      identificationPhoto: List<String>.from(map['identificationPhoto']),
      enabeled: map['enabeled'] ?? false,
      delete: map['delete'] ?? false,
      ban: map['ban'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, identification: $identification, userCreatedDate: $userCreatedDate, email: $email, role: $role, title: $title, gender: $gender, birthDate: $birthDate, nationality: $nationality, region: $region, woreda: $woreda, profilePicture: $profilePicture, address: $address, identificationPhoto: $identificationPhoto, enabeled: $enabeled, delete: $delete, ban: $ban)';
  }
}

// void main(List<String> args) {
//   UserModel x = UserModel(
//       firstName: 'birhan', lastName: 'mulugeta', phoneNumber: '09876543');
//   print(x.toMap());
// }
