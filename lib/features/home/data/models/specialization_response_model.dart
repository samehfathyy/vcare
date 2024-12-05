import 'package:json_annotation/json_annotation.dart';

part 'specialization_response_model.g.dart';

@JsonSerializable()
class SpecializationModel {
  @JsonKey(name: 'data')
  List<Specializationdata>? specializationdata;
  SpecializationModel({this.specializationdata});
  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationModelFromJson(json);
}

@JsonSerializable()
class Specializationdata {
  int id;
  String name;
  @JsonKey(name: 'doctors', defaultValue: [])
  List<Doctor?>? doctors;

  Specializationdata({this.id = 0, this.name = '', this.doctors});

  factory Specializationdata.fromJson(Map<String, dynamic> json) =>
      _$SpecializationdataFromJson(json);
}

@JsonSerializable()
class Doctor {
  int id;
  String name;
  String email;
  String phone;
  String photo;
  String gender;
  String address;
  String description;
  String degree;
  Specialization? specialization;
  City? city;
  @JsonKey(name: 'appoint_price')
  int price;
  String start_time;
  String end_time;

  Doctor({
    this.id = 0,
    this.name = '',
    this.email = '',
    this.phone = '',
    this.photo = '',
    this.gender = '',
    this.address = '',
    this.description = '',
    this.degree = '',
    this.specialization,
    this.city,
    this.price = 0,
    this.start_time = '',
    this.end_time = '',
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}

@JsonSerializable()
class City {
  int id;
  String name;
  Governrate? governrate;

  City({this.id=0, this.name='', this.governrate});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@JsonSerializable()
class Governrate {
  int id;
  String name;

  Governrate({this.id=0, this.name=''});

  factory Governrate.fromJson(Map<String, dynamic> json) =>
      _$GovernrateFromJson(json);
}

@JsonSerializable()
class Specialization {
  int id;
  String name;

  Specialization({this.id=0, this.name=''});

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);
}
