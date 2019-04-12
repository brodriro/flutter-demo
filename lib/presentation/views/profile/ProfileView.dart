import 'package:base_flutter/entities/User.dart';

abstract class ProfileView {
  void onCompleteProfile(User user);
  void onNetworkError();
}
