import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../utils/utils.dart';

class AuthService extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;
  bool _isLoading = false;
  bool get isloading => _isLoading;
  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future registerEmployee(
      String email, String password, BuildContext context) async {
    try {
      setIsLoading = true;
      if (email == "" || password == "") {
        throw ("ALL Fields are required");
      }
      final AuthResponse response =
          await _supabase.auth.signUp(email: email, password: password);
      Utils.showSnackBar("Success! You can login", context,
          color: Colors.green);
      Navigator.pop(context);
      setIsLoading = false;
    } catch (e) {
      setIsLoading = false;
      Utils.showSnackBar(e.toString(), context, color: Colors.red);
    }
  }

  Future loginEmployee(
      String email, String password, BuildContext context) async {
    try {
      setIsLoading = true;
      if (email == "" || password == "") {
        throw ("ALL Fields are required");
      }
      final AuthResponse response = await _supabase.auth
          .signInWithPassword(email: email, password: password);
      setIsLoading = false;
    } catch (e) {
      setIsLoading = false;
      Utils.showSnackBar(e.toString(), context, color: Colors.red);
    }
  }

  Future signout() async {
    await _supabase.auth.signOut();
    notifyListeners();
  }

  User? get currentUser => _supabase.auth.currentUser;
}
//HERE WE HAVE CREATED AN AUTHENTICATION SERVICE THAT MANAGES THE LOADING STATE
//FOR EXAPMLE IF UDER HAS LOGGED IN THEN IT WILL NOTIFY THEN YOU ARE LOGGED IN