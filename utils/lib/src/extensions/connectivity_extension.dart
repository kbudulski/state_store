import 'package:connectivity_plus/connectivity_plus.dart';

extension ConnectivityExt on ConnectivityResult? {
  bool get isConnected =>
      this == ConnectivityResult.wifi || this == ConnectivityResult.mobile;
}
