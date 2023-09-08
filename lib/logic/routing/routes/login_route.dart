import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../visual/screens/login/login_screen.dart';


class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginScreen();
}
