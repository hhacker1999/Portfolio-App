import 'package:setup_app/app/locator.dart';
import 'package:setup_app/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  bool _busyState = false;
  bool get busyState => _busyState;
  Future signUp(String email, String password, String name) async {
    _busyState = true;
    var result = await _authService.signIUpwithEMAILandPassword(
      email,
      password,
      name,
    );
    _busyState = false;
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
}
