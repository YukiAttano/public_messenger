import 'package:firebase_auth/firebase_auth.dart';

import '../../data/app_user/app_user.dart';
import 'database_handler.dart';

abstract class AppUserHandler {
  static Stream<AppUser?> getUserStream() async* {
    await for (var user in DatabaseHandler.auth.userChanges()) {
      if (user != null) {
        yield AppUser(uuid: user.uid, username: user.displayName ?? user.email!);
      } else {
        yield null;
      }
    }
  }

  static Future<AppUser> loginIn(String email, String password) async {
    UserCredential userCred = await DatabaseHandler.auth.signInWithEmailAndPassword(email: email, password: password);

    User user = userCred.user!;

    return AppUser(username: user.displayName ?? user.email!, uuid: user.uid);
  }

  static Future<AppUser> register(String email, String password, [String? username]) async {
    UserCredential userCred = await DatabaseHandler.auth.createUserWithEmailAndPassword(email: email, password: password);

    if (username != null)
    {
      await DatabaseHandler.auth.currentUser!.updateDisplayName(username);
    }

    User user = userCred.user!;

    return AppUser(username: user.displayName ?? user.email!, uuid: user.uid);
  }

  static Future<void> logOut() {
    return DatabaseHandler.auth.signOut();
  }
}
