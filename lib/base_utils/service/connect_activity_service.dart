import 'package:connectivity_plus/connectivity_plus.dart';

Future<void> checkConnectivity(
    {Future Function()? function,
    Future Function()? functionNoInternet}) async {
  var result = await Connectivity().checkConnectivity();
  if (result.contains(ConnectivityResult.wifi) ||
      result.contains(ConnectivityResult.mobile) ||
      result.contains(ConnectivityResult.ethernet)) {
    await function?.call();
  } else {
    await functionNoInternet?.call();
  }
}
