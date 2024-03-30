import 'dart:convert';

CustomerModel CustomerModelFromJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String CustomerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  String firstName;
  String lastName;
  String email;
  String password;
  int mobileNumber;

  CustomerModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.mobileNumber,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        firstName: json["First_Name"],
        lastName: json["Last_Name"],
        email: json["Email"],
        password: json["Password"],
        mobileNumber: json["Mobile_Number"],
      );

  Map<String, dynamic> toJson() => {
        "First_Name": firstName,
        "Last_Name": lastName,
        "Email": email,
        "Password": password,
        "Mobile_Number": mobileNumber,
      };
}
