
import 'package:json_annotation/json_annotation.dart';
part 'homePagemodel.g.dart';
@JsonSerializable()
class LoginPageModel{
  dynamic jobPostList;
  dynamic workingJobList;
  List<PostedJobsList> postedJobsList;
  dynamic jobPost;
  bool success;
  dynamic error;
  dynamic message;
  dynamic data;

  LoginPageModel({
    required this.jobPostList,
    required this.workingJobList,
    required this.postedJobsList,
    required this.jobPost,
    required this.success,
    required this.error,
    required this.message,
    required this.data,
  });

factory LoginPageModel.fromJson(Map<String , dynamic> json) =>
_$LoginPageModelFromJson(json);

Map<String , dynamic>toJson()=> _$LoginPageModelToJson(this);

}
@JsonSerializable()
class LoginPageData{
  String? id;
  String? customer_id;
  String ? email;
  String ? First_name;
  String ? Middle_name;
  String ? Last_name;
  String ? Date_of_birth;
  String ? Gender;
  String ? Country_of_birth;
  String ? mobile;
  String ? location;
  String ? digital_id_verified;
  LoginPageData({this.id, this.customer_id , this.email , this.First_name , this.Middle_name , this.Last_name, this.Date_of_birth , this.Gender , this.Country_of_birth , this.mobile , this.location , this.digital_id_verified});
  factory LoginPageData.fromJson(Map<String , dynamic>json)=> _$LoginPageDataFromJson(json);
  Map<String , dynamic >toJson()=> _$LoginPageDataToJson(this);
}

@JsonSerializable()
class PostedJobsList {
  dynamic paymentMode;
  int jobPostId;
  dynamic statusId;
  dynamic bidAmount;
  String jobTitle;
  String description;
  DateTime createdOn;
  String postedByFullName;
  String image;
  double rating;
  int postedById;
  dynamic appliedBy;
  String status;
  String jobType;
  double distance;
  String bidRange;
  String pickUpAddress;
  String deliveryAddress;
  String deliveryAddressLatitude;
  String deliveryAddressLongitude;
  String pickUpAddressLatitude;
  String pickUpAddressLongitude;
  double helperRating;
  dynamic jobAcceptedOn;
  dynamic helperImage;
  dynamic helperName;

  PostedJobsList({
    required this.paymentMode,
    required this.jobPostId,
    required this.statusId,
    required this.bidAmount,
    required this.jobTitle,
    required this.description,
    required this.createdOn,
    required this.postedByFullName,
    required this.image,
    required this.rating,
    required this.postedById,
    required this.appliedBy,
    required this.status,
    required this.jobType,
    required this.distance,
    required this.bidRange,
    required this.pickUpAddress,
    required this.deliveryAddress,
    required this.deliveryAddressLatitude,
    required this.deliveryAddressLongitude,
    required this.pickUpAddressLatitude,
    required this.pickUpAddressLongitude,
    required this.helperRating,
    required this.jobAcceptedOn,
    required this.helperImage,
    required this.helperName,
  });

factory PostedJobsList.fromJson(Map<String , dynamic>json)=> _$PostedJobsListFromJson(json);
  Map<String , dynamic >toJson()=> _$PostedJobsListToJson(this);
 }
