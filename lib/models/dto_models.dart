// To parse this JSON data, do
//
//     final enquireResultDto = enquireResultDtoFromMap(jsonString);

import 'dart:convert';

class EnquireResultDto {
  EnquireResultDto({
    required this.isFound,
    required this.isRegistered,
    this.firstName,
    this.memberStatus,
    this.middleNames,
    this.staffNumber,
    this.memberType,
  });

  bool isFound;
  bool isRegistered;
  String? firstName;
  String? memberStatus;
  String? middleNames;
  String? staffNumber;
  String? memberType;

  factory EnquireResultDto.fromJson(String str) =>
      EnquireResultDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EnquireResultDto.fromMap(Map<String, dynamic> json) =>
      EnquireResultDto(
        isFound: json["isFound"],
        isRegistered: json["isRegistered"],
        firstName: json["firstName"],
        memberStatus: json["memberStatus"],
        middleNames: json["middleNames"],
        staffNumber: json["staffNumber"],
        memberType: json["memberType"],
      );

  Map<String, dynamic> toMap() => {
        "isFound": isFound,
        "isRegistered": isRegistered,
        "firstName": firstName,
        "memberStatus": memberStatus,
        "middleNames": middleNames,
        "staffNumber": staffNumber,
        "memberType": memberType,
      };
}
