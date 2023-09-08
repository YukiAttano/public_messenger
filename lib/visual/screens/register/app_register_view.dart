import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../logic/notifier/appuser_notifier.dart';
import '../../widgets/user_credential/user_register_view.dart';

class AppRegisterView extends ConsumerWidget {
  const AppRegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UserRegisterView(
      onRegister: ref.read(appUserProvider.notifier).register,
    );
  }
}
