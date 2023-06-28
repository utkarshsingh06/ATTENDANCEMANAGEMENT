import 'package:employee_attendance_system/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:math';

class DBService extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;

  String generateRandomEmployeeId() {
    final random = Random();
    const allChars =
        "faangBETA12345"; //random number will bw created from this allchars only
    final randomString =
        List.generate(8, (index) => allChars[random.nextInt(allChars.length)])
            .join();
    return randomString;
  }

  Future insertNewUser(String email, var id) async {
    await _supabase.from(Constants.employeeTable).insert({
      //WHILE REGISTERING FOR NEW USER WE WILL CALL THIS INSERT SO THAT DATA ENTERED IS SENT TO DATABASE
      'id': id,
      'name': '',
      'email': email,
      'employee_id':
          generateRandomEmployeeId(), //create a function to generate a random id
      'department': null
    });
  }
}
