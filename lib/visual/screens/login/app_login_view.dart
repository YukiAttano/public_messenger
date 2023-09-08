import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../logic/notifier/appuser_notifier.dart';
import '../../widgets/user_credential/user_login_view.dart';

class AppLoginView extends ConsumerWidget {
  const AppLoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UserLoginView(
      onLogin: ref.read(appUserProvider.notifier).login,
    );
  }
}
