import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:shartflix/presentation/pages/auth/login_page.dart';
import 'package:shartflix/presentation/pages/auth/register_page.dart';
import 'package:shartflix/presentation/pages/auth/profile_photo_upload_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: ProfilePhotoUploadPage.routeName,
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
  ],
);
