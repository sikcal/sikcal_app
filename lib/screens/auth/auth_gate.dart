import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/provider.dart';
import 'package:sikcal/screen/welcome/welcome_screen.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(userProvider);

    return user == null ? WelcomeScreen() : child;
  }
}
