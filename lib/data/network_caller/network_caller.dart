import 'dart:convert';
import 'dart:developer';
import 'package:crafty_bay_ecomarc_apps/presentation/screens/email_verification_screen.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/user_auth_controller.dart';
import 'package:get/get.dart' as getx;
import '../models/network_response.dart';
import 'package:http/http.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest(
      {required String url, bool fromAuth = false}) async {
    try {
      log(url);
      log(UserAuthController.accestoken);
      final Response response = await get(
        Uri.parse(url),
        headers: {
          'accept': 'application/json',
          'token': UserAuthController.accestoken
        },
      );
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: true,
          responseData: decodeData,
        );
      } else if (response.statusCode == 401) {
        if (!fromAuth) {
          _goToSingInScreen();
        }

        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        responseCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      log(url);
      log(UserAuthController.accestoken);

      final Response response = await post(Uri.parse(url),
          headers: {
            'accept': 'application/json',
            'token': UserAuthController.accestoken
          },
          body: jsonEncode(body));
      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);

        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: true,
          responseData: decodeData,
        );
      } else if (response.statusCode == 401) {
        _goToSingInScreen();
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponse(
          responseCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        responseCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  static void _goToSingInScreen() async {
    // Navigator.push(
    //   CarftyBay.navigationKey.currentState!.context,
    //   MaterialPageRoute(
    //     builder: (context) => EmailVerificationScreen(),
    //   ),
    // );
    await UserAuthController.clearUserData();
    getx.Get.to(() => EmailVerificationScreen());
  }
}
