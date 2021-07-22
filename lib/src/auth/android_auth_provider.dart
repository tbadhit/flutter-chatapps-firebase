import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_provider_base.dart';

class _AndroidAuthProvider implements AuthProviderBase {
  @override
  Future<FirebaseApp> initialize() async {
    return await Firebase.initializeApp(
        name: 'The Chat Crew',
        options: FirebaseOptions(
            apiKey: "AIzaSyCWfO-7dhgdb7c-BhhP5BFc3YjnDXNA5bI",
            authDomain: "the-chat-crew-795be.firebaseapp.com",
            projectId: "the-chat-crew-795be",
            storageBucket: "the-chat-crew-795be.appspot.com",
            messagingSenderId: "1073286801208",
            appId: "1:1073286801208:android:7f6cd9a78d897452d143cd"));
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class AuthProvider extends _AndroidAuthProvider {}
