import 'package:firebase_dependencies/firebase_core.dart';
import 'package:firebase_dependencies/firebase_ui_auth.dart';
import 'package:firebase_dependencies/firebase_ui_oauth.dart';

const String kFirebaseWebClientId = String.fromEnvironment('CLIENT_ID');

Future<void> initializeFirebase() async {
  await Firebase.initializeApp();
  FirebaseUIAuth.configureProviders([
    GoogleProvider(clientId: kFirebaseWebClientId),
  ]);
}
