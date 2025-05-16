import 'package:campus_connect/routes/route_constant.dart';
import 'package:campus_connect/screens/authentication/screens/login_screen.dart';
import 'package:campus_connect/screens/home/home_screen.dart';
import 'package:campus_connect/screens/registration/screens/registration_screen.dart';
import 'package:campus_connect/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/authentication/error_screen.dart';
import '../screens/authentication/screens/forgot_password_screen.dart';
import '../screens/home/profile_detail_screen.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class ApplicationRouter{
  static final GoRouter router = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: "/",
      routes: <RouteBase> [
        GoRoute(
            name: RouteConstant.SPLASH_SCREEN,
            path: "/",
            pageBuilder: (context, state) => CupertinoPage(
            key: state.pageKey,
            child: SplashScreen(),
          ),
        ),


        GoRoute(
          name: RouteConstant.LOGIN_SCREEN,
          path: "/login_screen",
          pageBuilder: (context, state) => CupertinoPage(
            key: state.pageKey,
            child: LoginScreen(),
          ),
        ),

        GoRoute(
          name: RouteConstant.REGISTRATION_SCREEN,
          path: "/registration_screen",
          pageBuilder: (context, state) => CupertinoPage(
            key: state.pageKey,
            child: RegistrationScreen(),
          ),
        ),

        GoRoute(
          name: RouteConstant.FORGOT_PASSWORD_SCREEN,
          path: "/forgot_password_screen",
          pageBuilder: (context, state) => CupertinoPage(
            key: state.pageKey,
            child: ForgotPasswordScreen(),
          ),
        ),

        GoRoute(
          name: RouteConstant.HOME_SCREEN,
          path: "/home_screen",
          pageBuilder: (context, state) => CupertinoPage(
            key: state.pageKey,
            child: HomeScreen(),
          ),
        ),

        // GoRoute(
        //   name: RouteConstant.PROFILE_DETAILS_SCREEN,
        //   path: "/profile_details_screen",
        //   pageBuilder: (context, state) => CupertinoPage(
        //     key: state.pageKey,
        //     child: PageDetailsScreen(),
        //   ),
        // ),

      ],
      errorPageBuilder: (context, state){
        return MaterialPage(child: ErrorScreen());
      }
  );
}