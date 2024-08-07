import 'package:crafty_bay_ecomarc_apps/presentation/screens/main_bottom_nav_bar_screen.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/state_holders/user_auth_controller.dart';
import 'package:crafty_bay_ecomarc_apps/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    await UserAuthController.getUserToken();
    Get.off(() => const MainBottomNavBarScreen());
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text("Version 1.0"),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
