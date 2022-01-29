import 'package:custom_utilities/authentication/models/user_app_base_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension user on User {
  UserAppBaseModel get toUser {
    return UserAppBaseModel(
        id: uid, email: email!, name: displayName, photo: photoURL);
  }
}
