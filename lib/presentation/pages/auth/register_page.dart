import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/app_layout.dart';
import 'package:shartflix/presentation/widgets/auth/register_header.dart';
import 'package:shartflix/presentation/widgets/auth/register_form.dart';
import 'package:shartflix/presentation/widgets/auth/register_footer.dart';
import 'package:sizer/sizer.dart';
import 'package:shartflix/core/utils/responsive_helper.dart'; // Import the new helper

class RegisterPage extends StatelessWidget {
  static const String routeName = '/register';
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: AppLayout(
          child: SingleChildScrollView(
            physics: MediaQuery.of(context).viewInsets.bottom == 0
                ? const NeverScrollableScrollPhysics() // Klavye kapalı → scroll yok
                : const BouncingScrollPhysics(), // Klavye açık → scroll var
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: context.isSmallScreenHeight ? 0.5.h : 1.0.h,
                  ), // Adjust height for minimal spacing on small screens, slightly less on large
                  RegisterHeader(),
                  SizedBox(
                    height: context.isSmallScreenHeight ? 1.h : 2.0.h,
                  ), // Adjust height for 24px on large screens
                  RegisterForm(),
                  SizedBox(
                    height: context.isSmallScreenHeight ? 0.5.h : 0.75.h,
                  ), // Adjust height for 8px on large screens
                  RegisterFooter(),
                  SizedBox(
                    height: context.isSmallScreenHeight ? 0.5.h : 1.0.h,
                  ), // Adjust height for minimal spacing on small screens, slightly less on large
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
