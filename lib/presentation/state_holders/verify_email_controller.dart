import 'package:crafty_bay_ecomarc_apps/data/models/cart_model.dart';
import 'package:crafty_bay_ecomarc_apps/data/models/category_data.dart';
import 'package:crafty_bay_ecomarc_apps/data/models/category_list_model.dart';
import 'package:crafty_bay_ecomarc_apps/data/models/network_response.dart';
import 'package:crafty_bay_ecomarc_apps/data/network_caller/network_caller.dart';
import 'package:crafty_bay_ecomarc_apps/data/utility/urls.dart';
import 'package:get/get.dart';

class EmailVerifayController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> emailVerify(String email) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.emailVerify(email),);

    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}