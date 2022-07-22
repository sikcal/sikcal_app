import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/providers.dart';
import 'package:sikcal/data/shared_preferences.dart';
import 'package:sikcal/model/user.dart';
import 'package:sikcal/screen/welcome/welcome_screen.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, ref) {
    User? user = ref.watch(userProvider);

    if (user == null) {
      autoLogin(ref);
    }

    return user == null ? WelcomeScreen() : child;
  }

  void autoLogin(WidgetRef ref) async {
    if (refreshToken != null) {
      final user = await ref.read(userRepoProvider).getUserInfo();
      ref.read(userProvider.state).update((state) => user);
    }
  }
}
