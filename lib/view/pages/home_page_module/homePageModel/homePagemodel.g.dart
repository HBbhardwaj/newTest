// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homePagemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginPageModel _$LoginPageModelFromJson(Map<String, dynamic> json) =>
    LoginPageModel(
      jobPostList: json['jobPostList'],
      workingJobList: json['workingJobList'],
      postedJobsList: (json['postedJobsList'] as List<dynamic>)
          .map((e) => PostedJobsList.fromJson(e as Map<String, dynamic>))
          .toList(),
      jobPost: json['jobPost'],
      success: json['success'] as bool,
      error: json['error'],
      message: json['message'],
      data: json['data'],
    );

Map<String, dynamic> _$LoginPageModelToJson(LoginPageModel instance) =>
    <String, dynamic>{
      'jobPostList': instance.jobPostList,
      'workingJobList': instance.workingJobList,
      'postedJobsList': instance.postedJobsList,
      'jobPost': instance.jobPost,
      'success': instance.success,
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };

LoginPageData _$LoginPageDataFromJson(Map<String, dynamic> json) =>
    LoginPageData(
      id: json['id'] as String?,
      customer_id: json['customer_id'] as String?,
      email: json['email'] as String?,
      First_name: json['First_name'] as String?,
      Middle_name: json['Middle_name'] as String?,
      Last_name: json['Last_name'] as String?,
      Date_of_birth: json['Date_of_birth'] as String?,
      Gender: json['Gender'] as String?,
      Country_of_birth: json['Country_of_birth'] as String?,
      mobile: json['mobile'] as String?,
      location: json['location'] as String?,
      digital_id_verified: json['digital_id_verified'] as String?,
    );

Map<String, dynamic> _$LoginPageDataToJson(LoginPageData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customer_id,
      'email': instance.email,
      'First_name': instance.First_name,
      'Middle_name': instance.Middle_name,
      'Last_name': instance.Last_name,
      'Date_of_birth': instance.Date_of_birth,
      'Gender': instance.Gender,
      'Country_of_birth': instance.Country_of_birth,
      'mobile': instance.mobile,
      'location': instance.location,
      'digital_id_verified': instance.digital_id_verified,
    };

PostedJobsList _$PostedJobsListFromJson(Map<String, dynamic> json) =>
    PostedJobsList(
      paymentMode: json['paymentMode'],
      jobPostId: json['jobPostId'] as int,
      statusId: json['statusId'],
      bidAmount: json['bidAmount'],
      jobTitle: json['jobTitle'] as String,
      description: json['description'] as String,
      createdOn: DateTime.parse(json['createdOn'] as String),
      postedByFullName: json['postedByFullName'] as String,
      image: json['image'] as String,
      rating: (json['rating'] as num).toDouble(),
      postedById: json['postedById'] as int,
      appliedBy: json['appliedBy'],
      status: json['status'] as String,
      jobType: json['jobType'] as String,
      distance: (json['distance'] as num).toDouble(),
      bidRange: json['bidRange'] as String,
      pickUpAddress: json['pickUpAddress'] as String,
      deliveryAddress: json['deliveryAddress'] as String,
      deliveryAddressLatitude: json['deliveryAddressLatitude'] as String,
      deliveryAddressLongitude: json['deliveryAddressLongitude'] as String,
      pickUpAddressLatitude: json['pickUpAddressLatitude'] as String,
      pickUpAddressLongitude: json['pickUpAddressLongitude'] as String,
      helperRating: (json['helperRating'] as num).toDouble(),
      jobAcceptedOn: json['jobAcceptedOn'],
      helperImage: json['helperImage'],
      helperName: json['helperName'],
    );

Map<String, dynamic> _$PostedJobsListToJson(PostedJobsList instance) =>
    <String, dynamic>{
      'paymentMode': instance.paymentMode,
      'jobPostId': instance.jobPostId,
      'statusId': instance.statusId,
      'bidAmount': instance.bidAmount,
      'jobTitle': instance.jobTitle,
      'description': instance.description,
      'createdOn': instance.createdOn.toIso8601String(),
      'postedByFullName': instance.postedByFullName,
      'image': instance.image,
      'rating': instance.rating,
      'postedById': instance.postedById,
      'appliedBy': instance.appliedBy,
      'status': instance.status,
      'jobType': instance.jobType,
      'distance': instance.distance,
      'bidRange': instance.bidRange,
      'pickUpAddress': instance.pickUpAddress,
      'deliveryAddress': instance.deliveryAddress,
      'deliveryAddressLatitude': instance.deliveryAddressLatitude,
      'deliveryAddressLongitude': instance.deliveryAddressLongitude,
      'pickUpAddressLatitude': instance.pickUpAddressLatitude,
      'pickUpAddressLongitude': instance.pickUpAddressLongitude,
      'helperRating': instance.helperRating,
      'jobAcceptedOn': instance.jobAcceptedOn,
      'helperImage': instance.helperImage,
      'helperName': instance.helperName,
    };
