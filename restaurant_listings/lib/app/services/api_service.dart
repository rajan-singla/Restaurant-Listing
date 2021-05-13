import 'package:flutter/material.dart';
import 'package:restaurant_listings/Models/home_model.dart';
import 'package:restaurant_listings/Models/restaurant_model.dart';
import 'package:restaurant_listings/app/services/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  APIService(this.api);
  final API api;

  //For getting the data from => http://54.188.121.69:8000/v1/user/home
  Future<HomeModel> getHomeData() async {
    HomeModel result;
    Map postRqsData = {"longitude": 76.7794, "latitude": 30.7333, "userId": ""};
    String body = json.encode(postRqsData);
    String path = 'v1/user/home';
    try {
      final response = await http.post(api.tokenUri(path: path),
          headers: {
            'Authorization': 'Bearer ${api.apiKey}',
            'Content-Type': 'application/json'
          },
          body: body);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = HomeModel.fromJson(item);
        print(result.response.toJson());
      } else {
        print(
            'Request ${api.tokenUri(path: path)} failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
        throw response;
      }
    } catch (e) {
      print(e);
    }
    return result;
  }

  //For getting the data from => http://54.188.121.69:8000/v1/user/restaurantDetail/{id}
  Future<RestaurantModel> getRestaurantData({@required restaurantId}) async {
    RestaurantModel result;
    String path = 'v1/user/restaurantDetail/$restaurantId';
    try {
      final response = await http.get(api.tokenUri(path: path),
          headers: {
            'Authorization': 'Bearer ${api.apiKey}',
            'Content-Type': 'application/json'
          },
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = RestaurantModel.fromJson(item);
        print(result.response.toJson());
      } else {
        print(
            'Request ${api.tokenUri(path: path)} failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
        throw response;
      }
    } catch (e) {
      print(e);
    }
    return result;
  }
}
