import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_dependencies/connectivity_plus.dart';

part 'network_provider.g.dart';

@riverpod
class Network extends _$Network {
  Network() {
    _connectivity.onConnectivityChanged.listen(
      (status) => state = NetworkState(status),
    );
  }

  final Connectivity _connectivity = Connectivity();

  @override
  NetworkState build() => NetworkState(null);

  Future<void> checkConnection() async {
    state = NetworkState(await _connectivity.checkConnectivity());
  }
}

class NetworkState {
  NetworkState(this.status);

  final ConnectivityResult? status;

  bool get isConnected =>
      status == ConnectivityResult.wifi || status == ConnectivityResult.mobile;
}
