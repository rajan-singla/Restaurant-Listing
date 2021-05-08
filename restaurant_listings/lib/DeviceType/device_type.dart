import 'package:flutter/material.dart';
import 'package:restaurant_listings/enums/device_screen_type.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQueryData){

  var orientation = mediaQueryData.orientation;
  double deviceWidth = 0;

  if(orientation == Orientation.landscape){
    deviceWidth = mediaQueryData.size.height;
  }else{
    deviceWidth = mediaQueryData.size.width;
  }

  // if(deviceWidth > 600){
  //   return DeviceScreenType.Tablet;
  // }

  if(deviceWidth > 400){
    return DeviceScreenType.Mobile;
  }

  return DeviceScreenType.SmallPhone;

}