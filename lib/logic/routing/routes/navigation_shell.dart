import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../visual/widgets/user_credential/messenger_appbar.dart';
import '../../../visual/widgets/user_credential/user_app_bar.dart';


class NavigationShell extends ShellRouteData {
  const NavigationShell();

  static const EdgeInsets _screenPadding = EdgeInsets.fromLTRB(20, 0, 20, 10);

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return Scaffold(
      appBar: const UserAppBar(),
      body: Padding(
        padding: _screenPadding,
        child: navigator,
      ),
    );
  }
}
