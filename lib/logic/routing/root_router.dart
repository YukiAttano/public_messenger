import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/app_user_snapshot/app_user_snapshot.dart';
import '../notifier/appuser_notifier.dart';
import 'main_route.dart';
import 'routes/login_route.dart';
import 'routes/messenger_route.dart';
import 'routes/register_route.dart';

abstract class RootRouter {
  static final String _initialLocation = const MessengerRoute().location;

  static final router = Provider<GoRouter>(
    (ref) {
      bool isLoggedIn = ref.watch(appUserProvider.select((value) => value.loggedIn));

      return GoRouter(
        routes: $appRoutes,
        initialLocation: _initialLocation,
        redirect: (context, state) {
          String mainRoute = const MainRoute().location;
          String messengerRoute = const MessengerRoute().location;
          String loginRoute = const LoginRoute().location;
          String registerRoute = const RegisterRoute().location;

          bool targetMainRoute = state.matchedLocation == mainRoute;
          bool targetLoginRoute = state.matchedLocation == loginRoute;
          bool targetRegisterRoute = state.matchedLocation == registerRoute;

          if (!isLoggedIn && !(targetLoginRoute || targetRegisterRoute)) {
            return loginRoute;
          } else if (isLoggedIn && (targetLoginRoute || targetRegisterRoute)) {
            return _initialLocation;
          }

          if (targetMainRoute) return _initialLocation;
        },
      );
    },
  );
}
