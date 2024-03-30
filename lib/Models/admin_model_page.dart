import 'dart:convert';

AdminModel AdminModelFromJson(String str) =>
    AdminModel.fromJson(json.decode(str));

String AdminModelToJson(AdminModel data) => json.encode(data.toJson());

class AdminModel {
  String companyName;
  String ownerName;
  String address;

  AdminModel(
      {required this.companyName,
      required this.ownerName,
      required this.address});

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        companyName: json["Company_Name"],
        ownerName: json["Owner_Name"],
        address: json["Address"],
      );

  Map<String, dynamic> toJson() => {
        "Company_Name": companyName,
        "Owner_Name": ownerName,
        "Address": address
      };
}
