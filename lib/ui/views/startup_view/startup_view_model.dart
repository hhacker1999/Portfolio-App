import 'package:setup_app/app/locator.dart';
import 'package:setup_app/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future startupLogic() async {
    var hasuserLoggedIn = await _authService.isUserLoggedIn();
    if (hasuserLoggedIn) {
      _navigationService.navigateTo('/home-view');
    } else {
      _navigationService.navigateTo('/login-view');
    }
  }
}
