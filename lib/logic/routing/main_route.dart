import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/logic/routing/routes/credential_shell.dart';

import 'routes/login_route.dart';
import 'routes/messenger_route.dart';
import 'routes/navigation_shell.dart';
import 'routes/register_route.dart';

part 'main_route.g.dart';

@TypedGoRoute<MainRoute>(
  path: '/',
  routes: [
    TypedShellRoute<CredentialShell>(
      routes: [
        TypedGoRoute<LoginRoute>(
          path: "login",
        ),
        TypedGoRoute<RegisterRoute>(
          path: "register",
        ),
      ],
    ),
    TypedShellRoute<NavigationShell>(
      routes: [
        TypedGoRoute<MessengerRoute>(
          path: "messenger",
        ),
      ],
    ),
  ],
)
class MainRoute extends GoRouteData {
  const MainRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}
