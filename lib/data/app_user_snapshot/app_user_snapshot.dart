import '../app_user/app_user.dart';

class AppUserSnapshot {
  bool get loggedIn => appUser != null;
  final bool loading;
  final AppUser? appUser;

  const AppUserSnapshot({required this.appUser, required this.loading});

  const AppUserSnapshot.loading() : this(appUser: null, loading: true);

  AppUserSnapshot copyWith({AppUser? appUser, bool? loading}) {
    return AppUserSnapshot(
      appUser: appUser ?? this.appUser,
      loading: loading ?? this.loading,
    );
  }
}
