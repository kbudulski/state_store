import 'dart:async';

import 'package:bloc_app/features/maps/cubit/maps_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_service/location_service.dart';
import 'package:shared_dependencies/google_maps_flutter.dart';
import 'package:styleguide/components.dart';

const CameraPosition _kInitialPosition = CameraPosition(
  target: LatLng(50.2644846, 19.0249612),
  zoom: 13.25,
);

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => MapSampleState();
}

class MapSampleState extends State<MapsPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    context.read<MapsCubit>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Google Maps')),
          body: Column(
            children: [
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: _kInitialPosition,
                  onMapCreated: _controller.complete,
                  myLocationEnabled: true,
                  onTap: context.read<MapsCubit>().selectLocation,
                ),
              ),
              LocationInfoSection(
                gpsEnabled: state.gpsEnabled,
                status: state.status.value,
                cachedLocation: state.cachedLocation,
                currentLocation: state.currentLocation,
                onRefresh: context.read<MapsCubit>().getPermissions,
                onClearCache: context.read<MapsCubit>().clearCache,
              ),
            ],
          ),
        );
      },
    );
  }
}
