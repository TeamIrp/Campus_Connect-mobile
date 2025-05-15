import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../routes/route_constant.dart';
import '../sharedPreference/sharedpreference_helper.dart';
import 'authentication/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    // Hide the status bar for this screen
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    Timer(const Duration(seconds: 3), () async {
      bool isLoggedIn = await SharedPreferenceHelper.getLoginState();
      if (isLoggedIn) {
        if (context.mounted) {
          // Restore the status bar when navigating away
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          context.goNamed(RouteConstant.HOME_SCREEN, extra: 0);
        }
      }else{
        if (context.mounted) {
          // Restore the status bar when navigating away
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          context.goNamed(RouteConstant.LOGIN_SCREEN,);
        }
      }
    });
  }
  // Route _createFadeRoute() {
  //   return PageRouteBuilder(
  //     pageBuilder:
  //         (context, animation, secondaryAnimation) => const LoginScreen(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       return FadeTransition(opacity: animation, child: child);
  //     },
  //     transitionDuration: const Duration(milliseconds: 1000),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D97D4),
      body: SizedBox.expand(
        child: SvgPicture.asset(
          'assets/images/splash_Screen.svg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
