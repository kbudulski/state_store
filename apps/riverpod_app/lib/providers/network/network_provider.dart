import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_dependencies/connectivity_plus.dart';

part 'network_provider.g.dart';

@riverpod
class Network extends _$Network {
  Network() {
    _connectivity.onConnectivityChanged.listen((status) => state = status);
  }

  final Connectivity _connectivity = Connectivity();

  @override
  ConnectivityResult? build() => null;

  Future<void> checkConnection() async {
    state = await _connectivity.checkConnectivity();
  }
}
