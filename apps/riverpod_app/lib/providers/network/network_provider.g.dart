// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$networkHash() => r'26660fcd95f8aa77136de4c1b4e7bc73f3116b5c';

/// See also [Network].
@ProviderFor(Network)
final networkProvider =
    AutoDisposeNotifierProvider<Network, ConnectivityResult?>.internal(
  Network.new,
  name: r'networkProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$networkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Network = AutoDisposeNotifier<ConnectivityResult?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
