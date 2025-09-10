import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/app_layout.dart';
import 'package:shartflix/presentation/widgets/auth/login_header.dart';
import 'package:shartflix/presentation/widgets/auth/login_form.dart';
import 'package:shartflix/presentation/widgets/auth/login_footer.dart';
import 'package:sizer/sizer.dart';
import 'package:shartflix/core/utils/responsive_helper.dart'; // Import the new helper

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: AppLayout(
          child: SingleChildScrollView(
            physics: MediaQuery.of(context).viewInsets.bottom == 0
                ? const NeverScrollableScrollPhysics() // Klavye kapalı → scroll yok
                : const BouncingScrollPhysics(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: context.isSmallScreenHeight ? 0.5.h : 0.75.h,
                  ),
                  LoginHeader(),
                  SizedBox(height: context.isSmallScreenHeight ? 1.h : 1.5.h),
                  LoginForm(),
                  SizedBox(
                    height: context.isSmallScreenHeight ? 0.5.h : 0.75.h,
                  ),
                  LoginFooter(),
                  SizedBox(
                    height: context.isSmallScreenHeight ? 0.5.h : 0.75.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
