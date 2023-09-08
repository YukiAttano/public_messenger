import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/app_user_snapshot/app_user_snapshot.dart';
import '../../../logic/notifier/appuser_notifier.dart';
import 'logout_button.dart';
import 'messenger_appbar.dart';

class UserAppBar extends ConsumerWidget implements PreferredSizeWidget{
  const UserAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppUserSnapshot snap = ref.watch(appUserProvider);

    String name = snap.loggedIn ? snap.appUser!.username : "Anonymous";

    return MessengerAppBar(
      title: Text("Welcome $name", overflow: TextOverflow.ellipsis),
      actions: const [
        LogoutButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
