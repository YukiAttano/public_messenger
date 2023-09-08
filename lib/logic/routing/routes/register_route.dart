import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../visual/screens/messenger/messenger_screen.dart';
import '../../../visual/screens/register/register_screen.dart';


class RegisterRoute extends GoRouteData {
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const RegisterScreen();
}
