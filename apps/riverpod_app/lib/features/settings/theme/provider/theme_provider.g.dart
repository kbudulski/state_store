// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ThemeState _$$_ThemeStateFromJson(Map<String, dynamic> json) =>
    _$_ThemeState(
      colorScheme:
          $enumDecodeNullable(_$FlexSchemeEnumMap, json['colorScheme']),
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']),
    );

Map<String, dynamic> _$$_ThemeStateToJson(_$_ThemeState instance) =>
    <String, dynamic>{
      'colorScheme': _$FlexSchemeEnumMap[instance.colorScheme],
      'themeMode': _$ThemeModeEnumMap[instance.themeMode],
    };

const _$FlexSchemeEnumMap = {
  FlexScheme.material: 'material',
  FlexScheme.materialHc: 'materialHc',
  FlexScheme.blue: 'blue',
  FlexScheme.indigo: 'indigo',
  FlexScheme.hippieBlue: 'hippieBlue',
  FlexScheme.aquaBlue: 'aquaBlue',
  FlexScheme.brandBlue: 'brandBlue',
  FlexScheme.deepBlue: 'deepBlue',
  FlexScheme.sakura: 'sakura',
  FlexScheme.mandyRed: 'mandyRed',
  FlexScheme.red: 'red',
  FlexScheme.redWine: 'redWine',
  FlexScheme.purpleBrown: 'purpleBrown',
  FlexScheme.green: 'green',
  FlexScheme.money: 'money',
  FlexScheme.jungle: 'jungle',
  FlexScheme.greyLaw: 'greyLaw',
  FlexScheme.wasabi: 'wasabi',
  FlexScheme.gold: 'gold',
  FlexScheme.mango: 'mango',
  FlexScheme.amber: 'amber',
  FlexScheme.vesuviusBurn: 'vesuviusBurn',
  FlexScheme.deepPurple: 'deepPurple',
  FlexScheme.ebonyClay: 'ebonyClay',
  FlexScheme.barossa: 'barossa',
  FlexScheme.shark: 'shark',
  FlexScheme.bigStone: 'bigStone',
  FlexScheme.damask: 'damask',
  FlexScheme.bahamaBlue: 'bahamaBlue',
  FlexScheme.mallardGreen: 'mallardGreen',
  FlexScheme.espresso: 'espresso',
  FlexScheme.outerSpace: 'outerSpace',
  FlexScheme.blueWhale: 'blueWhale',
  FlexScheme.sanJuanBlue: 'sanJuanBlue',
  FlexScheme.rosewood: 'rosewood',
  FlexScheme.blumineBlue: 'blumineBlue',
  FlexScheme.flutterDash: 'flutterDash',
  FlexScheme.materialBaseline: 'materialBaseline',
  FlexScheme.verdunHemlock: 'verdunHemlock',
  FlexScheme.dellGenoa: 'dellGenoa',
  FlexScheme.redM3: 'redM3',
  FlexScheme.pinkM3: 'pinkM3',
  FlexScheme.purpleM3: 'purpleM3',
  FlexScheme.indigoM3: 'indigoM3',
  FlexScheme.blueM3: 'blueM3',
  FlexScheme.cyanM3: 'cyanM3',
  FlexScheme.tealM3: 'tealM3',
  FlexScheme.greenM3: 'greenM3',
  FlexScheme.limeM3: 'limeM3',
  FlexScheme.yellowM3: 'yellowM3',
  FlexScheme.orangeM3: 'orangeM3',
  FlexScheme.deepOrangeM3: 'deepOrangeM3',
  FlexScheme.custom: 'custom',
};

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themesHash() => r'c499b1d0fe550757dbf8e5e49e04851a42952013';

/// See also [Themes].
@ProviderFor(Themes)
final themesProvider =
    AutoDisposeAsyncNotifierProvider<Themes, ThemeState>.internal(
  Themes.new,
  name: r'themesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$themesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Themes = AutoDisposeAsyncNotifier<ThemeState>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
