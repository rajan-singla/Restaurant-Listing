import 'package:restaurant_listings/MediaQueryClasses/size_config.dart';
import 'package:restaurant_listings/enums/device_screen_type.dart';

final widthMultiplier = SizeConfig.widthMultiplier;
final heightMultiplier = SizeConfig.heightMultiplier;
final screenFullHeight = SizeConfig.screenFullHeight;


size2(orientationType) => orientationType == DeviceScreenType.Mobile ? widthMultiplier / 2 : widthMultiplier / 1.5;
size4(orientationType) => orientationType == DeviceScreenType.Mobile ? widthMultiplier : widthMultiplier * 0.75;
size5(orientationType) => orientationType == DeviceScreenType.Mobile ? heightMultiplier * 0.8 : heightMultiplier * 0.5;
size8(orientationType) => orientationType == DeviceScreenType.Mobile ? heightMultiplier * 1.2 : heightMultiplier;
size10(orientationType) => orientationType == DeviceScreenType.Mobile ? heightMultiplier * 1.5 : heightMultiplier * 1.2;
size12(orientationType) => orientationType == DeviceScreenType.Mobile ? heightMultiplier * 1.8 : heightMultiplier * 1.5;
size15(orientationType) => orientationType == DeviceScreenType.Mobile ? heightMultiplier * 2.2 : heightMultiplier * 2.0;
size16(orientationType) => orientationType == DeviceScreenType.Mobile ? heightMultiplier * 2.4 : heightMultiplier * 2.2;
size20(orientationType) => orientationType == DeviceScreenType.Mobile ? heightMultiplier * 3 : widthMultiplier * 2.6;
size50(orientationType) => orientationType == DeviceScreenType.Mobile ? heightMultiplier * 8 : widthMultiplier * 7;
size120(orientationType) => orientationType == DeviceScreenType.Mobile ? screenFullHeight / 5.2 : screenFullHeight / 6.2;
size200(orientationType) => orientationType == DeviceScreenType.Mobile ? screenFullHeight / 3 : screenFullHeight / 4;
size220(orientationType) => orientationType == DeviceScreenType.Mobile ? screenFullHeight / 2.85 : screenFullHeight / 3.2;



// final size2 = getDeviceType(mediaQueryData) == DeviceScreenType.Mobile ? widthMultiplier / 2 : widthMultiplier / 1.5;
// final size4 = getDeviceType(mediaQueryData) == DeviceScreenType.Mobile ? widthMultiplier : widthMultiplier * 0.75;
// final size5 =  getDeviceType(mediaQueryData) == DeviceScreenType.Mobile ?heightMultiplier * 0.8 : heightMultiplier * 0.5;
// final size8 =  getDeviceType(mediaQueryData) == DeviceScreenType.Mobile ? heightMultiplier * 1.2 : heightMultiplier;
// var size10 = getDeviceType(mediaQueryData) == DeviceScreenType.Mobile ? heightMultiplier * 1.5 : heightMultiplier * 1.2;
// final size12 = getDeviceType(mediaQueryData) == DeviceScreenType.Mobile ? heightMultiplier * 1.8 : heightMultiplier * 1.5;
// final size15 = getDeviceType(mediaQueryData) == DeviceScreenType.Mobile ? heightMultiplier * 2.2 : heightMultiplier * 2.0;
// final size16 = getDeviceType(mediaQueryData) == DeviceScreenType.Mobile ? heightMultiplier * 2.4 : heightMultiplier ;
// final size20 = heightMultiplier * 3;
// final size50 = heightMultiplier * 8;
// final size120 = screenFullHeight / 5.2;
// final size200 = abc == DeviceScreenType.Mobile ? screenFullHeight / 3 : screenFullHeight / 8;
// final size220 = screenFullHeight / 2.85;