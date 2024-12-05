// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialization_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationModel _$SpecializationModelFromJson(Map<String, dynamic> json) =>
    SpecializationModel(
      specializationdata: (json['data'] as List<dynamic>?)
          ?.map((e) => Specializationdata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecializationModelToJson(
        SpecializationModel instance) =>
    <String, dynamic>{
      'data': instance.specializationdata,
    };

Specializationdata _$SpecializationdataFromJson(Map<String, dynamic> json) =>
    Specializationdata(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      doctors: (json['doctors'] as List<dynamic>?)
              ?.map((e) =>
                  e == null ? null : Doctor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SpecializationdataToJson(Specializationdata instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'doctors': instance.doctors,
    };

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      address: json['address'] as String? ?? '',
      description: json['description'] as String? ?? '',
      degree: json['degree'] as String? ?? '',
      specialization: json['specialization'] == null
          ? null
          : Specialization.fromJson(
              json['specialization'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      price: (json['appoint_price'] as num?)?.toInt() ?? 0,
      start_time: json['start_time'] as String? ?? '',
      end_time: json['end_time'] as String? ?? '',
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'photo': instance.photo,
      'gender': instance.gender,
      'address': instance.address,
      'description': instance.description,
      'degree': instance.degree,
      'specialization': instance.specialization,
      'city': instance.city,
      'appoint_price': instance.price,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      governrate: json['governrate'] == null
          ? null
          : Governrate.fromJson(json['governrate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'governrate': instance.governrate,
    };

Governrate _$GovernrateFromJson(Map<String, dynamic> json) => Governrate(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$GovernrateToJson(Governrate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Specialization _$SpecializationFromJson(Map<String, dynamic> json) =>
    Specialization(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$SpecializationToJson(Specialization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
