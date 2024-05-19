import 'dart:convert';

class MLGeneralAttributeModel {
  double _politicalStablity = 0.0;
  double _unemploymentRate = 0.0;
  double _GDP = 0.0;
  double _inflation = 0.0;
  double _globalEconomy = 0.0;
  double _famines = 0.0;
  double _naturalDisaster = 0.0;
  double _rumoursOnShareMarket = 0.0;

  // Getters
  double get politicalStablity => _politicalStablity;
  double get unemploymentRate => _unemploymentRate;
  double get GDP => _GDP;
  double get inflation => _inflation;
  double get globalEconomy => _globalEconomy;
  double get famines => _famines;
  double get naturalDisaster => _naturalDisaster;
  double get rumoursOnShareMarket => _rumoursOnShareMarket;

  // Setters with validation
  set politicalStablity(double value) {
    if (value < 0.0 || value > 5.0) {
      throw ArgumentError('Political stability must be between 0.0 and 5.0');
    }
    _politicalStablity = value;
  }

  set unemploymentRate(double value) {
    if (value < 0.0 || value > 5.0) {
      throw ArgumentError('Unemployment rate must be between 0.0 and 5.0');
    }
    _unemploymentRate = value;
  }

  set GDP(double value) {
    if (value < 0.0 || value > 5.0) {
      throw ArgumentError('GDP must be between 0.0 and 5.0');
    }
    _GDP = value;
  }

  set inflation(double value) {
    if (value < 0.0 || value > 5.0) {
      throw ArgumentError('Inflation must be between 0.0 and 5.0');
    }
    _inflation = value;
  }

  set globalEconomy(double value) {
    if (value < 0.0 || value > 5.0) {
      throw ArgumentError('Global economy must be between 0.0 and 5.0');
    }
    _globalEconomy = value;
  }

  set famines(double value) {
    if (value < 0.0 || value > 5.0) {
      throw ArgumentError('Famines must be between 0.0 and 5.0');
    }
    _famines = value;
  }

  set naturalDisaster(double value) {
    if (value < 0.0 || value > 5.0) {
      throw ArgumentError('Natural disaster must be between 0.0 and 5.0');
    }
    _naturalDisaster = value;
  }

  set rumoursOnShareMarket(double value) {
    if (value < 0.0 || value > 5.0) {
      throw ArgumentError(
          'Rumours on share market must be between 0.0 and 5.0');
    }
    _rumoursOnShareMarket = value;
  }

  // Constructor (optional)
  MLGeneralAttributeModel({
    double politicalStablity = 0.0,
    double unemploymentRate = 0.0,
    double GDP = 0.0,
    double inflation = 0.0,
    double globalEconomy = 0.0,
    double famines = 0.0,
    double naturalDisaster = 0.0,
    double rumoursOnShareMarket = 0.0,
  }) {
    this.politicalStablity = politicalStablity;
    this.unemploymentRate = unemploymentRate;
    this.GDP = GDP;
    this.inflation = inflation;
    this.globalEconomy = globalEconomy;
    this.famines = famines;
    this.naturalDisaster = naturalDisaster;
    this.rumoursOnShareMarket = rumoursOnShareMarket;
  }

  // Rest of the code (copyWith, toMap, fromMap, toJson, fromJson, toString) remains the same
  MLGeneralAttributeModel copyWith({
    double? politicalStablity,
    double? unemploymentRate,
    double? GDP,
    double? inflation,
    double? globalEconomy,
    double? famines,
    double? naturalDisaster,
    double? rumoursOnShareMarket,
  }) {
    return MLGeneralAttributeModel(
      politicalStablity: politicalStablity ?? this.politicalStablity,
      unemploymentRate: unemploymentRate ?? this.unemploymentRate,
      GDP: GDP ?? this.GDP,
      inflation: inflation ?? this.inflation,
      globalEconomy: globalEconomy ?? this.globalEconomy,
      famines: famines ?? this.famines,
      naturalDisaster: naturalDisaster ?? this.naturalDisaster,
      rumoursOnShareMarket: rumoursOnShareMarket ?? this.rumoursOnShareMarket,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'politicalStablity': politicalStablity});
    result.addAll({'unemploymentRate': unemploymentRate});
    result.addAll({'GDP': GDP});
    result.addAll({'inflation': inflation});
    result.addAll({'globalEconomy': globalEconomy});
    result.addAll({'famines': famines});
    result.addAll({'naturalDisaster': naturalDisaster});
    result.addAll({'rumoursOnShareMarket': rumoursOnShareMarket});

    return result;
  }

  factory MLGeneralAttributeModel.fromMap(Map<String, dynamic> map) {
    return MLGeneralAttributeModel(
      politicalStablity: map['politicalStablity']?.toDouble() ?? 0.0,
      unemploymentRate: map['unemploymentRate']?.toDouble() ?? 0.0,
      GDP: map['GDP']?.toDouble() ?? 0.0,
      inflation: map['inflation']?.toDouble() ?? 0.0,
      globalEconomy: map['globalEconomy']?.toDouble() ?? 0.0,
      famines: map['famines']?.toDouble() ?? 0.0,
      naturalDisaster: map['naturalDisaster']?.toDouble() ?? 0.0,
      rumoursOnShareMarket: map['rumoursOnShareMarket']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MLGeneralAttributeModel.fromJson(String source) =>
      MLGeneralAttributeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MLGeneralAttributeModel(politicalStablity: $politicalStablity, unemploymentRate: $unemploymentRate, GDP: $GDP, inflation: $inflation, globalEconomy: $globalEconomy, famines: $famines, naturalDisaster: $naturalDisaster, rumoursOnShareMarket: $rumoursOnShareMarket)';
  }
}
