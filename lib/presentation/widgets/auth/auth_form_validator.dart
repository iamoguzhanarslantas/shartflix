import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Bloc
import 'package:shartflix/presentation/cubits/auth/auth_cubit.dart'; // Import AuthCubit

class AuthFormValidator extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController, // Made nullable
    String? nameErrorText,
    String? emailErrorText,
    String? passwordErrorText,
    String? confirmPasswordErrorText,
    String? termsErrorText, // New parameter
    FormFieldValidator<String>? validateName, // Made nullable
    FormFieldValidator<String>? validateEmail,
    FormFieldValidator<String>? validatePassword,
    FormFieldValidator<String?>?
    validateConfirmPassword, // Made nullable, adjusted type
    VoidCallback onSubmit,
    bool isLoading,
  )
  builder;

  final bool isRegisterForm;
  final bool termsAccepted; // New parameter

  const AuthFormValidator({
    super.key,
    required this.builder,
    this.isRegisterForm = false,
    this.termsAccepted = false, // Default value
  });

  @override
  State<AuthFormValidator> createState() => AuthFormValidatorState();
}

class AuthFormValidatorState extends State<AuthFormValidator> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _nameErrorText;
  String? _emailErrorText;
  String? _passwordErrorText;
  String? _confirmPasswordErrorText;
  String? _termsErrorText; // New error text for terms and conditions
  bool _isLoading = false;

  void clearControllers() {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    setState(() {
      _nameErrorText = null;
      _emailErrorText = null;
      _passwordErrorText = null;
      _confirmPasswordErrorText = null;
      _termsErrorText = null; // Clear terms error as well
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ad Soyad boş bırakılamaz';
    }
    if (value.length < 3) {
      return 'Ad Soyad en az 3 karakter olmalı';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email boş bırakılamaz';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Geçerli bir email adresi girin';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Şifre boş bırakılamaz';
    }
    if (value.length < 6) {
      return 'Şifre en az 6 karakter olmalı';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    // Modified to take only one argument
    if (value == null || value.isEmpty) {
      return 'Şifre tekrar boş bırakılamaz';
    }
    if (value != _passwordController.text) {
      // Compare with _passwordController.text
      return 'Şifreler eşleşmiyor';
    }
    return null;
  }

  Future<void> _onSubmit() async {
    setState(() {
      if (widget.isRegisterForm) {
        _nameErrorText = _validateName(_nameController.text);
        _confirmPasswordErrorText = _validateConfirmPassword(
          _confirmPasswordController.text,
        );
      }
      _emailErrorText = _validateEmail(_emailController.text);
      _passwordErrorText = _validatePassword(_passwordController.text);
      _termsErrorText = widget.isRegisterForm && !widget.termsAccepted
          ? 'Kullanıcı sözleşmesini kabul etmelisiniz.'
          : null;
    });

    if ((_formKey.currentState?.validate() ?? false) &&
        _termsErrorText == null) {
      setState(() {
        _isLoading = true;
      });
      try {
        // All fields are valid, perform submission logic
        if (widget.isRegisterForm) {
          // Call the register method of AuthCubit
          context.read<AuthCubit>().register(
            _emailController.text,
            _passwordController.text,
            _nameController.text,
          );
        } else {
          // Call the login method of AuthCubit
          context.read<AuthCubit>().login(
            _emailController.text,
            _passwordController.text,
          );
        }
      } catch (e) {
        // Error handling is now done by BlocListener in RegisterPage/LoginPage
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      _formKey,
      _nameController,
      _emailController,
      _passwordController,
      _confirmPasswordController,
      _nameErrorText,
      _emailErrorText,
      _passwordErrorText,
      _confirmPasswordErrorText,
      _termsErrorText, // Pass new terms error text
      _validateName,
      _validateEmail,
      _validatePassword,
      _validateConfirmPassword,
      _onSubmit,
      _isLoading,
    );
  }
}
