import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/connectivity_plus.dart';

class NetworkCubit extends Cubit<ConnectivityResult?> {
  NetworkCubit(this._connectivity) : super(null) {
    _connectivity.onConnectivityChanged.listen(emit);
  }

  final Connectivity _connectivity;

  Future<void> checkConnection() async {
    emit(await _connectivity.checkConnectivity());
  }
}
