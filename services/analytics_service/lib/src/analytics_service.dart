import 'package:firebase_dependencies/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  static FirebaseAnalyticsObserver get observer => FirebaseAnalyticsObserver(
        analytics: FirebaseAnalytics.instance,
      );

  void logSideTapEvent({required String side}) => _analytics.logEvent(
        name: 'side_tap',
        parameters: {'side': side},
      );
}
