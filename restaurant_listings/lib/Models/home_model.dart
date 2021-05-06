// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.response,
    this.data,
  });

  Response response;
  Data data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        response: Response.fromJson(json["response"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.banners,
    this.nearBy,
    this.trending,
    this.latest,
  });

  List<HomeBanner> banners;
  List<NearBy> nearBy;
  List<dynamic> trending;
  List<Latest> latest;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        banners: List<HomeBanner>.from(
            json["banners"].map((x) => HomeBanner.fromJson(x))),
        nearBy:
            List<NearBy>.from(json["nearBy"].map((x) => NearBy.fromJson(x))),
        trending: List<dynamic>.from(json["trending"].map((x) => x)),
        latest:
            List<Latest>.from(json["latest"].map((x) => Latest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "nearBy": List<dynamic>.from(nearBy.map((x) => x.toJson())),
        "trending": List<dynamic>.from(trending.map((x) => x)),
        "latest": List<dynamic>.from(latest.map((x) => x.toJson())),
      };
}

class HomeBanner {
  HomeBanner({
    this.offer,
    this.link,
    this.vendorId,
    this.type,
    this.isDeleted,
    this.id,
    this.name,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.bannerId,
  });

  Offer offer;
  String link;
  dynamic vendorId;
  String type;
  bool isDeleted;
  String id;
  String name;
  String description;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String bannerId;

  factory HomeBanner.fromJson(Map<String, dynamic> json) => HomeBanner(
        offer: Offer.fromJson(json["offer"]),
        link: json["link"],
        vendorId: json["vendorId"],
        type: json["type"],
        isDeleted: json["isDeleted"],
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        bannerId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "offer": offer.toJson(),
        "link": link,
        "vendorId": vendorId,
        "type": type,
        "isDeleted": isDeleted,
        "_id": id,
        "name": name,
        "description": description,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": bannerId,
      };
}

class Offer {
  Offer({
    this.list,
  });

  List<dynamic> list;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        list: List<dynamic>.from(json["list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x)),
      };
}

class Latest {
  Latest({
    this.description,
    this.state,
    this.isFavourite,
    this.id,
    this.name,
    this.latitude,
    this.address,
    this.city,
    this.longitude,
    this.category,
    this.offerCount,
    this.ratingAvg,
    this.images,
    this.latestId,
    this.avgCost,
  });

  String description;
  String state;
  bool isFavourite;
  String id;
  String name;
  double latitude;
  String address;
  String city;
  double longitude;
  Category category;
  int offerCount;
  int ratingAvg;
  List<ImageData> images;
  String latestId;
  String avgCost;

  factory Latest.fromJson(Map<String, dynamic> json) => Latest(
        description: json["description"],
        state: json["state"],
        isFavourite: json["isFavourite"],
        id: json["_id"],
        name: json["name"],
        latitude: json["latitude"].toDouble(),
        address: json["address"],
        city: json["city"],
        longitude: json["longitude"].toDouble(),
        category: Category.fromJson(json["category"]),
        offerCount: json["offerCount"],
        ratingAvg: json["ratingAvg"],
        images: List<ImageData>.from(
            json["images"].map((x) => ImageData.fromJson(x))),
        latestId: json["id"],
        avgCost: json["avgCost"] == null ? null : json["avgCost"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "state": state,
        "isFavourite": isFavourite,
        "_id": id,
        "name": name,
        "latitude": latitude,
        "address": address,
        "city": city,
        "longitude": longitude,
        "category": category.toJson(),
        "offerCount": offerCount,
        "ratingAvg": ratingAvg,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "id": latestId,
        "avgCost": avgCost == null ? null : avgCost,
      };
}

class Category {
  Category({
    this.isDeleted,
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.categoryId,
  });

  bool isDeleted;
  String id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String categoryId;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        isDeleted: json["isDeleted"],
        id: json["_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        categoryId: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "isDeleted": isDeleted,
        "_id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": categoryId == null ? null : categoryId,
      };
}

class ImageData {
  ImageData({
    this.id,
    this.image,
    this.restaurantId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.imageId,
  });

  String id;
  String image;
  String restaurantId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String imageId;

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
        id: json["_id"],
        image: json["image"],
        restaurantId: json["restaurantId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        imageId: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "restaurantId": restaurantId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": imageId == null ? null : imageId,
      };
}

class NearBy {
  NearBy({
    this.id,
    this.description,
    this.state,
    this.foodType,
    this.isFavourite,
    this.address,
    this.city,
    this.latitude,
    this.longitude,
    this.name,
    this.avgCost,
    this.category,
    this.images,
    this.ratingAvg,
    this.offerCount,
  });

  String id;
  String description;
  String state;
  int foodType;
  bool isFavourite;
  String address;
  String city;
  double latitude;
  double longitude;
  String name;
  String avgCost;
  Category category;
  List<ImageData> images;
  int ratingAvg;
  int offerCount;

  factory NearBy.fromJson(Map<String, dynamic> json) => NearBy(
        id: json["_id"],
        description: json["description"],
        state: json["state"],
        foodType: json["foodType"],
        isFavourite: json["isFavourite"],
        address: json["address"],
        city: json["city"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        name: json["name"],
        avgCost: json["avgCost"],
        category: Category.fromJson(json["category"]),
        images: List<ImageData>.from(
            json["images"].map((x) => ImageData.fromJson(x))),
        ratingAvg: json["ratingAvg"],
        offerCount: json["offerCount"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "description": description,
        "state": state,
        "foodType": foodType,
        "isFavourite": isFavourite,
        "address": address,
        "city": city,
        "latitude": latitude,
        "longitude": longitude,
        "name": name,
        "avgCost": avgCost,
        "category": category.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "ratingAvg": ratingAvg,
        "offerCount": offerCount,
      };
}

class Response {
  Response({
    this.success,
    this.message,
    this.isUser,
    this.logout,
  });

  bool success;
  String message;
  int isUser;
  int logout;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        success: json["success"],
        message: json["message"],
        isUser: json["isUser"],
        logout: json["logout"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "isUser": isUser,
        "logout": logout,
      };
}
