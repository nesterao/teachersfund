import 'dart:convert';

class UserData {
  UserData({
    required this.staffId,
    required this.token,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.memberStatus,
    this.memberType,
  });

  final String staffId;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? memberStatus;
  final String? memberType;
  final String token;

  factory UserData.fromJson(String str) => UserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        staffId: json["staffId"] ?? '',
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        memberStatus: json["memberStatus"],
        memberType: json["memberType"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "staffId": staffId,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "token": token,
        "memberStatus": memberStatus,
        "memberType": memberType,
      };
}

class BaseResponse {
  BaseResponse({
    required this.success,
    this.message,
    this.data,
  });

  final bool success;
  final String? message;
  dynamic data;

  factory BaseResponse.fromJson(String str) =>
      BaseResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BaseResponse.fromMap(Map<String, dynamic> json) => BaseResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data,
      };
}
