// To parse this JSON data, do
//
//     final restaurantModel = restaurantModelFromJson(jsonString);

import 'dart:convert';

RestaurantModel restaurantModelFromJson(String str) => RestaurantModel.fromJson(json.decode(str));

String restaurantModelToJson(RestaurantModel data) => json.encode(data.toJson());

class RestaurantModel {
  RestaurantModel({
    this.response,
    this.data,
  });

  RestaurantModelResponse response;
  RestaurantModelData data;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
    response: RestaurantModelResponse.fromJson(json["response"]),
    data: RestaurantModelData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "response": response.toJson(),
    "data": data.toJson(),
  };
}

class RestaurantModelData {
  RestaurantModelData({
    this.id,
    this.moreInfo,
    this.description,
    this.rulesAndPolicies,
    this.foodType,
    this.discount,
    this.discountUpto,
    this.isFavourite,
    this.openTime,
    this.closeTime,
    this.address,
    this.city,
    this.latitude,
    this.longitude,
    this.countryCode,
    this.phone,
    this.name,
    this.email,
    this.avgCost,
    this.category,
    this.images,
    this.workingDays,
    this.foodItems,
    this.offers,
    this.menus,
    this.ratings,
    this.ratingCount,
    this.ratingAvg,
    this.isRated,
    this.offerCount,
  });

  String id;
  List<dynamic> moreInfo;
  String description;
  dynamic rulesAndPolicies;
  int foodType;
  int discount;
  int discountUpto;
  bool isFavourite;
  String openTime;
  String closeTime;
  String address;
  String city;
  double latitude;
  double longitude;
  String countryCode;
  String phone;
  String name;
  String email;
  String avgCost;
  Category category;
  List<RestaurantImage> images;
  List<dynamic> workingDays;
  List<dynamic> foodItems;
  List<dynamic> offers;
  List<dynamic> menus;
  List<Rating> ratings;
  int ratingCount;
  int ratingAvg;
  bool isRated;
  int offerCount;

  factory RestaurantModelData.fromJson(Map<String, dynamic> json) => RestaurantModelData(
    id: json["_id"],
    moreInfo: List<dynamic>.from(json["moreInfo"].map((x) => x)),
    description: json["description"],
    rulesAndPolicies: json["rulesAndPolicies"],
    foodType: json["foodType"],
    discount: json["discount"],
    discountUpto: json["discountUpto"],
    isFavourite: json["isFavourite"],
    openTime: json["openTime"],
    closeTime: json["closeTime"],
    address: json["address"],
    city: json["city"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    countryCode: json["countryCode"],
    phone: json["phone"],
    name: json["name"],
    email: json["email"],
    avgCost: json["avgCost"],
    category: Category.fromJson(json["category"]),
    images: List<RestaurantImage>.from(json["images"].map((x) => RestaurantImage.fromJson(x))),
    workingDays: List<dynamic>.from(json["workingDays"].map((x) => x)),
    foodItems: List<dynamic>.from(json["foodItems"].map((x) => x)),
    offers: List<dynamic>.from(json["offers"].map((x) => x)),
    menus: List<dynamic>.from(json["menus"].map((x) => x)),
    ratings: List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
    ratingCount: json["ratingCount"],
    ratingAvg: json["ratingAvg"],
    isRated: json["isRated"],
    offerCount: json["offerCount"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "moreInfo": List<dynamic>.from(moreInfo.map((x) => x)),
    "description": description,
    "rulesAndPolicies": rulesAndPolicies,
    "foodType": foodType,
    "discount": discount,
    "discountUpto": discountUpto,
    "isFavourite": isFavourite,
    "openTime": openTime,
    "closeTime": closeTime,
    "address": address,
    "city": city,
    "latitude": latitude,
    "longitude": longitude,
    "countryCode": countryCode,
    "phone": phone,
    "name": name,
    "email": email,
    "avgCost": avgCost,
    "category": category.toJson(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "workingDays": List<dynamic>.from(workingDays.map((x) => x)),
    "foodItems": List<dynamic>.from(foodItems.map((x) => x)),
    "offers": List<dynamic>.from(offers.map((x) => x)),
    "menus": List<dynamic>.from(menus.map((x) => x)),
    "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
    "ratingCount": ratingCount,
    "ratingAvg": ratingAvg,
    "isRated": isRated,
    "offerCount": offerCount,
  };
}

class Category {
  Category({
    this.id,
    this.isDeleted,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  bool isDeleted;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    isDeleted: json["isDeleted"],
    name: json["name"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "isDeleted": isDeleted,
    "name": name,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class RestaurantImage {
  RestaurantImage({
    this.id,
    this.image,
    this.restaurantId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String image;
  String restaurantId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory RestaurantImage.fromJson(Map<String, dynamic> json) => RestaurantImage(
    id: json["_id"],
    image: json["image"],
    restaurantId: json["restaurantId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "restaurantId": restaurantId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Rating {
  Rating({
    this.id,
    this.serviceType,
    this.allowByo,
    this.serveItem,
    this.recycleCompost,
    this.leftOver,
    this.byoToday,
    this.trash,
    this.pack,
    this.overAll,
    this.experience,
    this.bringWith,
    this.rememberSeeing,
    this.givenToday,
    this.rating,
    this.images,
    this.restaurantId,
    this.userId,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.user,
  });

  String id;
  int serviceType;
  String allowByo;
  String serveItem;
  int recycleCompost;
  String leftOver;
  String byoToday;
  List<dynamic> trash;
  List<dynamic> pack;
  int overAll;
  int experience;
  List<dynamic> bringWith;
  List<dynamic> rememberSeeing;
  List<dynamic> givenToday;
  int rating;
  List<dynamic> images;
  String restaurantId;
  String userId;
  int date;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  User user;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    id: json["_id"],
    serviceType: json["serviceType"],
    allowByo: json["allowByo"],
    serveItem: json["serveItem"],
    recycleCompost: json["recycleCompost"],
    leftOver: json["leftOver"],
    byoToday: json["byoToday"],
    trash: List<dynamic>.from(json["trash"].map((x) => x)),
    pack: List<dynamic>.from(json["pack"].map((x) => x)),
    overAll: json["overAll"],
    experience: json["experience"],
    bringWith: List<dynamic>.from(json["bringWith"].map((x) => x)),
    rememberSeeing: List<dynamic>.from(json["rememberSeeing"].map((x) => x)),
    givenToday: List<dynamic>.from(json["givenToday"].map((x) => x)),
    rating: json["rating"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
    restaurantId: json["restaurantId"],
    userId: json["userId"],
    date: json["date"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "serviceType": serviceType,
    "allowByo": allowByo,
    "serveItem": serveItem,
    "recycleCompost": recycleCompost,
    "leftOver": leftOver,
    "byoToday": byoToday,
    "trash": List<dynamic>.from(trash.map((x) => x)),
    "pack": List<dynamic>.from(pack.map((x) => x)),
    "overAll": overAll,
    "experience": experience,
    "bringWith": List<dynamic>.from(bringWith.map((x) => x)),
    "rememberSeeing": List<dynamic>.from(rememberSeeing.map((x) => x)),
    "givenToday": List<dynamic>.from(givenToday.map((x) => x)),
    "rating": rating,
    "images": List<dynamic>.from(images.map((x) => x)),
    "restaurantId": restaurantId,
    "userId": userId,
    "date": date,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "user": user.toJson(),
  };
}

class User {
  User({
    this.id,
    this.profilePic,
    this.provider,
    this.providerId,
    this.isVerified,
    this.isBlocked,
    this.isDeleted,
    this.referralCode,
    this.hash,
    this.name,
    this.email,
    this.deviceId,
    this.deviceType,
    this.date,
    this.authToken,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.countryCode,
    this.phone,
  });

  String id;
  String profilePic;
  String provider;
  String providerId;
  bool isVerified;
  bool isBlocked;
  bool isDeleted;
  dynamic referralCode;
  String hash;
  String name;
  String email;
  String deviceId;
  String deviceType;
  int date;
  String authToken;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String countryCode;
  String phone;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    profilePic: json["profilePic"],
    provider: json["provider"],
    providerId: json["providerId"],
    isVerified: json["isVerified"],
    isBlocked: json["isBlocked"],
    isDeleted: json["isDeleted"],
    referralCode: json["referralCode"],
    hash: json["hash"],
    name: json["name"],
    email: json["email"],
    deviceId: json["deviceId"],
    deviceType: json["deviceType"],
    date: json["date"],
    authToken: json["authToken"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    countryCode: json["countryCode"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "profilePic": profilePic,
    "provider": provider,
    "providerId": providerId,
    "isVerified": isVerified,
    "isBlocked": isBlocked,
    "isDeleted": isDeleted,
    "referralCode": referralCode,
    "hash": hash,
    "name": name,
    "email": email,
    "deviceId": deviceId,
    "deviceType": deviceType,
    "date": date,
    "authToken": authToken,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "countryCode": countryCode,
    "phone": phone,
  };
}

class RestaurantModelResponse {
  RestaurantModelResponse({
    this.success,
    this.message,
    this.isUser,
    this.logout,
  });

  bool success;
  String message;
  int isUser;
  int logout;

  factory RestaurantModelResponse.fromJson(Map<String, dynamic> json) => RestaurantModelResponse(
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
