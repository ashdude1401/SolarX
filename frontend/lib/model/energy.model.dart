// To parse this JSON data, do
//
//     final calc = calcFromJson(jsonString);

import 'dart:convert';

Calc calcFromJson(String str) => Calc.fromJson(json.decode(str));

String calcToJson(Calc data) => json.encode(data.toJson());

class Calc {
  Energy? energy;

  Calc({
    this.energy,
  });

  factory Calc.fromJson(Map<String, dynamic> json) => Calc(
        energy: json["energy"] == null ? null : Energy.fromJson(json["energy"]),
      );

  Map<String, dynamic> toJson() => {
        "energy": energy?.toJson(),
      };
}

class Energy {
  double? energy;
  int? amountGained;
  int? treeSaved;
  int? co2EmissionMitigatedInTonnes;
  int? recoverMonth;

  Energy({
    this.energy,
    this.amountGained,
    this.treeSaved,
    this.co2EmissionMitigatedInTonnes,
    this.recoverMonth,
  });

  factory Energy.fromJson(Map<String, dynamic> json) => Energy(
        energy: json["energy"]?.toDouble(),
        amountGained: json["amountGained"],
        treeSaved: json["treeSaved"],
        co2EmissionMitigatedInTonnes: json["co2EmissionMitigated(in tonnes)"],
        recoverMonth: json["recoverMonth"],
      );

  Map<String, dynamic> toJson() => {
        "energy": energy,
        "amountGained": amountGained,
        "treeSaved": treeSaved,
        "co2EmissionMitigated(in tonnes)": co2EmissionMitigatedInTonnes,
        "recoverMonth": recoverMonth,
      };
}
