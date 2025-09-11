import 'package:flutter/material.dart';
import 'package:shartflix/presentation/widgets/common/app_layout.dart';

class AuthScreenWrapper extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    ValueNotifier<bool> hasErrorNotifier,
  )
  builder;

  const AuthScreenWrapper({super.key, required this.builder});

  @override
  State<AuthScreenWrapper> createState() => _AuthScreenWrapperState();
}

class _AuthScreenWrapperState extends State<AuthScreenWrapper> {
  final ValueNotifier<bool> _hasErrorNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _hasErrorNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: AppLayout(
        child: SingleChildScrollView(
          physics: MediaQuery.of(context).viewInsets.bottom == 0
              ? const NeverScrollableScrollPhysics() // Klavye kapalı → scroll yok
              : const BouncingScrollPhysics(), // Klavye açık → scroll var
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [widget.builder(context, _hasErrorNotifier)],
            ),
          ),
        ),
      ),
    );
  }
}
