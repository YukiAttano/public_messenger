import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../visual/screens/messenger/messenger_screen.dart';


class MessengerRoute extends GoRouteData {
  const MessengerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const MessengerScreen();
}
