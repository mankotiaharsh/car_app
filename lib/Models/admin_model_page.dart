import 'dart:convert';

AdminModel AdminModelFromJson(String str) =>
    AdminModel.fromJson(json.decode(str));

String AdminModelToJson(AdminModel data) => json.encode(data.toJson());

class AdminModel {
  String companyName;
  String ownerName;
  String address;
  String email;
  String password;
  int mobileNumber;

  AdminModel({
    required this.companyName,
    required this.ownerName,
    required this.address,
    required this.email,
    required this.password,
    required this.mobileNumber,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        companyName: json["Company_Name"],
        ownerName: json["Owner_Name"],
        address: json["Address"],
        email: json["Email"],
        password: json["Password"],
        mobileNumber: json["Mobile_Number"],
      );

  Map<String, dynamic> toJson() => {
        "Company_Name": companyName,
        "Owner_Name": ownerName,
        "Address": address,
        "Email": email,
        "Password": password,
        "Mobile_Number": mobileNumber
      };
}
