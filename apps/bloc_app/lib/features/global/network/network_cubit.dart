import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/connectivity_plus.dart';

class NetworkCubit extends Cubit<NetworkState> {
  NetworkCubit(this._connectivity) : super(NetworkState(null)) {
    _connectivity.onConnectivityChanged.listen(
      (status) => emit(NetworkState(status)),
    );
  }

  final Connectivity _connectivity;

  Future<void> checkConnection() async {
    emit(NetworkState(await _connectivity.checkConnectivity()));
  }
}

class NetworkState {
  NetworkState(this.status);

  final ConnectivityResult? status;
}
