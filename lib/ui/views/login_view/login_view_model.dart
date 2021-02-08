import 'package:setup_app/app/locator.dart';

import 'package:setup_app/services/auth_service.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  Future logIN(String email, String password) async {
    setBusy(true);
    var result = await _authService.signInwithEMAILandPassword(
      email,
      password,
    );
    setBusy(false);
    if (result is bool) {
      if (result) {
        _navigationService.navigateTo('/');
      } else {
        await _dialogService.showDialog(
            title: 'Login Failed', description: 'Please try again later');
      }
    } else {
      await _dialogService.showDialog(
          title: 'Login Failed', description: result);
    }
  }

  navigate() {
    _navigationService.navigateTo('/sign-up-view');
  }
}
