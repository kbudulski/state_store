import 'package:firebase_dependencies/firebase_dependencies.dart';
import 'package:firebase_ui_dependencies/firebase_ui_dependencies.dart';

const String kFirebaseWebClientId = String.fromEnvironment('CLIENT_ID');

Future<void> initializeFirebase() async {
  await Firebase.initializeApp();
  FirebaseUIAuth.configureProviders([
    GoogleProvider(clientId: kFirebaseWebClientId),
  ]);
}
