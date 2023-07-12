import 'package:core_dependencies/location.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:location_service/location_service.dart';
import 'package:shared_dependencies/geocoding.dart';
import 'package:shared_dependencies/google_maps_flutter.dart';

class MapsCubit extends HydratedCubit<MapsState> {
  MapsCubit(this._locationService) : super(MapsState());

  final LocationService _locationService;

  Future<void> initialize() async {
    await getPermissions();
    _locationService.onLocationChanges().listen((data) async {
      final location = await _getLocationFromCords(
        data.latitude,
        data.longitude,
      );
      emit(state.copyWith(currentLocation: location));
    });
  }

  Future<void> getPermissions() async {
    final gpsCheck = await _locationService.requestPermission();
    emit(
      state.copyWith(
        gpsEnabled: gpsCheck.$1,
        status: gpsCheck.$2,
      ),
    );
  }

  Future<void> selectLocation(LatLng latLng) async {
    final location = await _getLocationFromCords(
      latLng.latitude,
      latLng.longitude,
    );
    emit(state.copyWith(cachedLocation: location));
  }

  void clearCache() => emit(state.clearCache());

  Future<String> _getLocationFromCords(double? lat, double? lng) async {
    if (lat == null || lng == null) return '-';
    final location = await placemarkFromCoordinates(lat, lng);
    return '${location.first.street}, ${location.first.locality}';
  }

  @override
  MapsState fromJson(Map<String, dynamic> json) =>
      MapsState(cachedLocation: json['cachedLocation'] as String?);

  @override
  Map<String, dynamic> toJson(MapsState state) => <String, dynamic>{
        'cachedLocation': state.cachedLocation,
      };
}

class MapsState {
  MapsState({
    this.status,
    this.gpsEnabled,
    this.currentLocation,
    this.cachedLocation,
  });

  final PermissionStatus? status;
  final bool? gpsEnabled;
  final String? currentLocation;
  final String? cachedLocation;

  MapsState copyWith({
    PermissionStatus? status,
    bool? gpsEnabled,
    String? currentLocation,
    String? cachedLocation,
  }) {
    return MapsState(
      status: status ?? this.status,
      gpsEnabled: gpsEnabled ?? this.gpsEnabled,
      currentLocation: currentLocation ?? this.currentLocation,
      cachedLocation: cachedLocation ?? this.cachedLocation,
    );
  }

  MapsState clearCache() {
    return MapsState(
      status: status,
      gpsEnabled: gpsEnabled,
      currentLocation: currentLocation,
    );
  }
}
