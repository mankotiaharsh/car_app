import 'dart:convert';

AddPostModel AddPostModelFromJson(String str) =>
    AddPostModel.fromJson(json.decode(str));

String AddPostModelToJson(AddPostModel data) => json.encode(data.toJson());

class AddPostModel {
  String ownerName;
  int aadharNumber;
  String carType;
  String companyName;
  String modelName;
  String carColor;
  String dateController;
  String address;
  String city;
  String state;
  String zipcode;
  int contactNumber;

  AddPostModel({
    required this.ownerName,
    required this.aadharNumber,
    required this.carType,
    required this.companyName,
    required this.modelName,
    required this.carColor,
    required this.dateController,
    required this.address,
    required this.city,
    required this.state,
    required this.zipcode,
    required this.contactNumber,
  });

  factory AddPostModel.fromJson(Map<String, dynamic> json) => AddPostModel(
      ownerName: json["Owner_Name"],
      aadharNumber: json["Aadhar_Number"],
      carType: json["Car_type"],
      companyName: json["Company_Name"],
      modelName: json["Model_Name"],
      carColor: json["Car_Color"],
      dateController: json["Manufacturing_Date_Month_Year"],
      address: json["Address"],
      city: json["City"],
      state: json['State'],
      zipcode: json["Zip_Code"],
      contactNumber: json["Contact_Number"]);

  Map<String, dynamic> toJson() => {
        "Owner_Name": ownerName,
        "Aadhar_Number": aadharNumber,
        "Car_Type": carType,
        "Company_Name": companyName,
        "Model_Name": modelName,
        "Car_Color": carColor,
        "Manufacturing_Date_Month_Year": dateController,
        "Address": address,
        "City": city,
        'State': state,
        "Zip_Code": zipcode,
        "Contact_Number": contactNumber
      };
}
