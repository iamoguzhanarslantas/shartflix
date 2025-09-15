import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/presentation/cubits/auth/auth_bloc.dart'; 
import 'package:shartflix/presentation/cubits/auth/auth_event.dart';

class AuthFormValidator extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController, 
    String? nameErrorText,
    String? emailErrorText,
    String? passwordErrorText,
    String? confirmPasswordErrorText,
    String? termsErrorText, 
    FormFieldValidator<String>? validateName, 
    FormFieldValidator<String>? validateEmail,
    FormFieldValidator<String>? validatePassword,
    FormFieldValidator<String?>?
    validateConfirmPassword, 
    VoidCallback onSubmit,
    bool isLoading,
  )
  builder;

  final bool isRegisterForm;
  final bool termsAccepted; 

  const AuthFormValidator({
    super.key,
    required this.builder,
    this.isRegisterForm = false,
    this.termsAccepted = false, 
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
  String? _termsErrorText; 
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
      _termsErrorText = null; 
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
    
    if (value == null || value.isEmpty) {
      return 'Şifre tekrar boş bırakılamaz';
    }
    if (value != _passwordController.text) {
      
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
        
        if (widget.isRegisterForm) {
          context.read<AuthBloc>().add(
            AuthRegister(
              email: _emailController.text,
              password: _passwordController.text,
              name: _nameController.text,
            ),
          );
        } else {
          context.read<AuthBloc>().add(
            AuthLogin(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
        }
      } catch (e) {
        
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
      _termsErrorText, 
      _validateName,
      _validateEmail,
      _validatePassword,
      _validateConfirmPassword,
      _onSubmit,
      _isLoading,
    );
  }
}
