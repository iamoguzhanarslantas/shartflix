import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:shartflix/presentation/pages/auth/login_page.dart';
import 'package:shartflix/presentation/pages/auth/register_page.dart';
import 'package:shartflix/presentation/pages/auth/profile_photo_upload_page.dart';
import 'package:shartflix/presentation/pages/home/home_page.dart';
import 'package:shartflix/presentation/pages/profile/profile_page.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: LoginPage.routeName,
    routes: <RouteBase>[
      GoRoute(
        path: LoginPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: RegisterPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterPage();
        },
      ),
      GoRoute(
        path: ProfilePhotoUploadPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const ProfilePhotoUploadPage();
        },
      ),
      GoRoute(
        path: HomePage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: ProfilePage.routeName, // Define a route for the ProfilePage
        builder: (BuildContext context, GoRouterState state) {
          return const ProfilePage();
        },
      ),
    ],
  );
}
