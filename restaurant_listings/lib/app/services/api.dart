import 'package:flutter/foundation.dart';
import 'package:restaurant_listings/app/services/api_keys.dart';

class API {
  API({@required this.apikey});
  final String apikey;

  factory API.sandbox() => API(apikey: APIKeys.restaurantSandboxKey);

  static final String host = "54.188.121.69";

  Uri tokenUri({@required path}) => Uri(
        scheme: "http",
        host: host,
        port: 8000,
        path: path,
      );
}
