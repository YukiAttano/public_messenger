import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'data/theming.dart';
import 'logic/network/database_handler.dart';
import 'logic/routing/root_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseHandler.init();

  runApp(const ProviderScope(child: Messenger()));
}

class Messenger extends ConsumerWidget {
  const Messenger({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GoRouter router = ref.watch(RootRouter.router);

    return MaterialApp.router(
      title: 'Attano Messenger',
      routerConfig: router,
      theme: Theming.lightTheme,
      darkTheme: Theming.darkTheme,
    );
  }
}
