import 'package:flutter/material.dart';
import 'package:shartflix/di.dart';
import 'package:shartflix/data/datasources/remote_data_source.dart';

class AuthFormValidator extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController,
    String? nameErrorText,
    String? emailErrorText,
    String? passwordErrorText,
    String? confirmPasswordErrorText,
    Function(String?) validateName,
    Function(String?) validateEmail,
    Function(String?) validatePassword,
    Function(String?, String?) validateConfirmPassword,
    VoidCallback onSubmit,
    bool isLoading,
  ) builder;

  final bool isRegisterForm;

  const AuthFormValidator({
    super.key,
    required this.builder,
    this.isRegisterForm = false,
  });

  @override
  State<AuthFormValidator> createState() => _AuthFormValidatorState();
}

class _AuthFormValidatorState extends State<AuthFormValidator> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _nameErrorText;
  String? _emailErrorText;
  String? _passwordErrorText;
  String? _confirmPasswordErrorText;
  bool _isLoading = false;

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

  String? _validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Şifre tekrar boş bırakılamaz';
    }
    if (value != password) {
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
          _passwordController.text,
        );
      }
      _emailErrorText = _validateEmail(_emailController.text);
      _passwordErrorText = _validatePassword(_passwordController.text);
    });

    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });
      try {
        // All fields are valid, perform submission logic
        if (widget.isRegisterForm) {
          // Call the register API
          final remoteDataSource = sl<RemoteDataSource>();
          await remoteDataSource.register(
            _emailController.text,
            _passwordController.text,
            _nameController.text,
          );
          print('Registration successful with Name: ${_nameController.text}, Email: ${_emailController.text}');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Kayıt başarılı!')),
          );
          // Optionally navigate to another page
        } else {
          print('Login successful with Email: ${_emailController.text}');
        }
      } catch (e) {
        print('Registration failed: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Kayıt başarısız: ${e.toString()}')),
        );
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
      _validateName,
      _validateEmail,
      _validatePassword,
      _validateConfirmPassword,
      _onSubmit,
      _isLoading,
    );
  }
}
