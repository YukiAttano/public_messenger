import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/app_user/app_user.dart';
import '../../data/app_user_snapshot/app_user_snapshot.dart';
import '../network/app_user_handler.dart';

final appUserProvider = StateNotifierProvider<AppUserNotifier, AppUserSnapshot>((ref) => AppUserNotifier());

class AppUserNotifier extends StateNotifier<AppUserSnapshot> {

  late StreamSubscription<AppUser?> _userStream;

  AppUserNotifier() : super(const AppUserSnapshot.loading()) {
    _init();
  }

  void _init() {
    _userStream = AppUserHandler.getUserStream().listen(_handleUserEvent);
  }

  Future<void> login(String email, String password) async {
    await AppUserHandler.loginIn(email, password);
  }

  Future<void> register(String email, String username, String password) async {

    String displayname = username.trim();

    await AppUserHandler.register(email, password, displayname.isEmpty ? null : displayname);
  }

  Future<void> logout() async {
    await AppUserHandler.logOut();
  }

  void _handleUserEvent(AppUser? user) {
    state = AppUserSnapshot(appUser: user, loading: false);
  }

  @override
  Future<void> dispose() async {
    await _userStream.cancel();
    super.dispose();
  }
}
