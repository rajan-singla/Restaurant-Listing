import 'package:flutter/material.dart';
import 'package:restaurant_listings/Models/home_model.dart';
import 'package:restaurant_listings/Models/restaurant_model.dart';
import 'package:restaurant_listings/app/services/api.dart';
import 'package:restaurant_listings/app/services/api_service.dart';

class HomeDataProvider with ChangeNotifier {
  HomeModel homePostData = HomeModel();
  RestaurantModel restaurantDetails = RestaurantModel();
  bool loading = false;
  final apiService = new APIService(API.sandbox());
  //final accessToken = await apiService.getHomeData();

  getPostData() async {
    loading = true;
    homePostData = await apiService.getHomeData();
    loading = false;

    notifyListeners();
  }

  getRestaurantDetails(restaurantId) async {
    loading = true;
    restaurantDetails = await apiService.getRestaurantData(restaurantId: restaurantId);
    loading = false;

    notifyListeners();
  }
}
