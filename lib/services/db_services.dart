import 'package:employee_attendance_system/constants/constants.dart';
import 'package:employee_attendance_system/models/department_model.dart';
import 'package:employee_attendance_system/models/user_model.dart';
import 'package:employee_attendance_system/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:math';

class DBService extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;
  UserModel? userModel;
  List<DepartmentModel> alldepartments = [];
  int? employeeDepartment;

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

  Future<UserModel> getUserData() async {
    final userData = await _supabase
        .from(Constants.employeeTable)
        .select()
        .eq('id', _supabase.auth.currentUser!.id)
        .single();
    userModel = UserModel.fromJson(userData);
    //getting data from database in json and store into variable usermodel
    employeeDepartment == null
        ? employeeDepartment = userModel?.department
        : null;
    return userModel!;
  }

  Future<void> getAllDepartments() async {
    final List result =
        await _supabase.from(Constants.departmentTable).select();
    alldepartments = result
        .map((department) => DepartmentModel.fromJson(department))
        .toList();
    notifyListeners();
  }

  Future updateProfile(String name, BuildContext context) async {
    await _supabase.from(Constants.employeeTable).update({
      'name': name,
      'department': employeeDepartment,
    }).eq('id', _supabase.auth.currentUser!.id);

    Utils.showSnackBar("Profile Updated Successfully", context,
        color: Colors.green);
    notifyListeners();
  }
}
