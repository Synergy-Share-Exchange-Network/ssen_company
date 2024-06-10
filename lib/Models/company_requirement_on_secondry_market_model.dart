import 'dart:convert';

class CompanyRequirementOnSecondryMarketModel {
  String identification;
  String companyId;
  double minimumNumberOfShareToSell;
  double maximumNumberOfShareToSell;
  double minimumPricePerShare;
  double maximumPricePerShare;
  bool isOpenToSell;
  bool isDeleted;
  List<String> restrictedUsersToSell;
  CompanyRequirementOnSecondryMarketModel(
      {identification,
      companyId,
      minimumNumberOfShareToSell,
      maximumNumberOfShareToSell,
      minimumPricePerShare,
      maximumPricePerShare,
      isOpenToSell,
      isDeleted,
      restrictedUsersToSell})
      : identification = identification ?? '',
        companyId = companyId ?? '',
        minimumNumberOfShareToSell = minimumNumberOfShareToSell ?? 0.0,
        maximumNumberOfShareToSell = maximumNumberOfShareToSell ?? 0.0,
        minimumPricePerShare = minimumPricePerShare ?? 0.0,
        maximumPricePerShare = maximumPricePerShare ?? 0.0,
        isOpenToSell = isOpenToSell ?? true,
        isDeleted = isDeleted ?? false,
        restrictedUsersToSell = restrictedUsersToSell ?? [''];

  CompanyRequirementOnSecondryMarketModel copyWith({
    String? identification,
    String? companyId,
    double? minimumNumberOfShareToSell,
    double? maximumNumberOfShareToSell,
    double? minimumPricePerShare,
    double? maximumPricePerShare,
    bool? isOpenToSell,
    bool? isDeleted,
    List<String>? restrictedUsersToSell,
  }) {
    return CompanyRequirementOnSecondryMarketModel(
      identification: identification ?? this.identification,
      companyId: companyId ?? this.companyId,
      minimumNumberOfShareToSell:
          minimumNumberOfShareToSell ?? this.minimumNumberOfShareToSell,
      maximumNumberOfShareToSell:
          maximumNumberOfShareToSell ?? this.maximumNumberOfShareToSell,
      minimumPricePerShare: minimumPricePerShare ?? this.minimumPricePerShare,
      maximumPricePerShare: maximumPricePerShare ?? this.maximumPricePerShare,
      isOpenToSell: isOpenToSell ?? this.isOpenToSell,
      isDeleted: isDeleted ?? this.isDeleted,
      restrictedUsersToSell:
          restrictedUsersToSell ?? this.restrictedUsersToSell,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'identification': identification});
    result.addAll({'companyId': companyId});
    result.addAll({'minimumNumberOfShareToSell': minimumNumberOfShareToSell});
    result.addAll({'maximumNumberOfShareToSell': maximumNumberOfShareToSell});
    result.addAll({'minimumPricePerShare': minimumPricePerShare});
    result.addAll({'maximumPricePerShare': maximumPricePerShare});
    result.addAll({'isOpenToSell': isOpenToSell});
    result.addAll({'isDeleted': isDeleted});
    result.addAll({'restrictedUsersToSell': restrictedUsersToSell});

    return result;
  }

  factory CompanyRequirementOnSecondryMarketModel.fromMap(
      Map<String, dynamic> map) {
    return CompanyRequirementOnSecondryMarketModel(
      identification: map['identification'] ?? '',
      companyId: map['companyId'] ?? '',
      minimumNumberOfShareToSell:
          map['minimumNumberOfShareToSell']?.toDouble() ?? 0.0,
      maximumNumberOfShareToSell:
          map['maximumNumberOfShareToSell']?.toDouble() ?? 0.0,
      minimumPricePerShare: map['minimumPricePerShare']?.toDouble() ?? 0.0,
      maximumPricePerShare: map['maximumPricePerShare']?.toDouble() ?? 0.0,
      isOpenToSell: map['isOpenToSell'] ?? false,
      isDeleted: map['isDeleted'] ?? false,
      restrictedUsersToSell: List<String>.from(map['restrictedUsersToSell']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyRequirementOnSecondryMarketModel.fromJson(String source) =>
      CompanyRequirementOnSecondryMarketModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CompanyRequirementOnSecondryMarketModel(identification: $identification, companyId: $companyId, minimumNumberOfShareToSell: $minimumNumberOfShareToSell, maximumNumberOfShareToSell: $maximumNumberOfShareToSell, minimumPricePerShare: $minimumPricePerShare, maximumPricePerShare: $maximumPricePerShare, isOpenToSell: $isOpenToSell, isDeleted: $isDeleted, restrictedUsersToSell: $restrictedUsersToSell)';
  }
}
