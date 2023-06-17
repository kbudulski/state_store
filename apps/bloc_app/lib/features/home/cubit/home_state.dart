part of 'home_cubit.dart';

class HomeState {
  const HomeState({
    this.customProperty = 'Default Value',
  });

  final String customProperty;

  HomeState copyWith({
    String? customProperty,
  }) {
    return HomeState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

class HomeInitial extends HomeState {
  const HomeInitial() : super();
}
