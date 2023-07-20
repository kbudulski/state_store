// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authServiceHash() => r'adc4e5cfa575c35b6eafe81362029167b17d78ca';

/// See also [authService].
@ProviderFor(authService)
final authServiceProvider = AutoDisposeProvider<AuthenticationService>.internal(
  authService,
  name: r'authServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthServiceRef = AutoDisposeProviderRef<AuthenticationService>;
String _$notificationServiceHash() =>
    r'bde70972c38e05f8468b99fcf04d607a16f41c02';

/// See also [notificationService].
@ProviderFor(notificationService)
final notificationServiceProvider =
    AutoDisposeProvider<NotificationService>.internal(
  notificationService,
  name: r'notificationServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotificationServiceRef = AutoDisposeProviderRef<NotificationService>;
String _$locationServiceHash() => r'f7b3dbe3e362693a99dbd0c857f576f80a3f5f74';

/// See also [locationService].
@ProviderFor(locationService)
final locationServiceProvider = AutoDisposeProvider<LocationService>.internal(
  locationService,
  name: r'locationServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationServiceRef = AutoDisposeProviderRef<LocationService>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
