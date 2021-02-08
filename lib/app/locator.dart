import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:setup_app/app/locator.config.dart';

final locator  = GetIt.instance;
@InjectableInit()
void setupLocator() => $initGetIt(locator);
