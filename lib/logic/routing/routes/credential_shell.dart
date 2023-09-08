
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CredentialShell extends ShellRouteData {
  const CredentialShell();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return Scaffold(
      body: navigator,
    );
  }
}
