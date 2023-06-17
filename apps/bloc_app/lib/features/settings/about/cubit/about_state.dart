part of 'about_cubit.dart';

abstract class AboutState extends Equatable {
  const AboutState();
}

class AboutStateLoaded extends AboutState {
  const AboutStateLoaded({required this.appVersion});

  final String appVersion;

  @override
  List<Object?> get props => [appVersion];
}

class AboutStateLoading extends AboutState {
  @override
  List<Object> get props => [];
}
