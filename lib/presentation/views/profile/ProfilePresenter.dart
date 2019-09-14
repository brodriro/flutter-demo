import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/profile/ProfileView.dart';
import 'package:DemoFlutter/domain/usescase/UserUseCase.dart';

class ProfilePresenter {
  ProfileView view;
  UserUseCase userUseCase;

  ProfilePresenter() {
    this.userUseCase = Injector.inject().resolve<UserUseCase>();
  }

  void start(ProfileView _view) {
    this.view = _view;
  }

  void getUser() {
    this.userUseCase.getUser().then((_user) {
      this.view.onCompleteProfile(_user);
      this.userUseCase.user = _user;
    }, onError: (e) => this.view.onNetworkError());
  }
}
