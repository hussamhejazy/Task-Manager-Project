

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/models/Department.dart';
import 'package:task_manager/models/Duty.dart';
import 'package:task_manager/models/Employee.dart';
import 'package:task_manager/models/Task.dart';

class FbFirestoreController{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final String _collectionDepartment = 'Department';
  final String _collectionEmployee = 'Employee';
  final String _collectionDuty = 'Duty';
  final String _collectionTask = 'Task';


  // Department  Firestore  Controller
  Future<bool> CreateDepartment({required Department department}) async{
    return await _firebaseFirestore.collection(_collectionDepartment)
        .add(department.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }
  Stream<QuerySnapshot> getDepartments() async*{
    yield* _firebaseFirestore.collection(_collectionDepartment).snapshots();
  }
  Future<bool> updateDepartment({required String path,required Department department}) async{
    return await _firebaseFirestore.collection(_collectionDepartment)
        .doc(path).update(department.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }
  Future<bool> deleteDepartment({required String path}) async{
    return await _firebaseFirestore.collection(_collectionDepartment)
        .doc(path).delete()
        .then((value) => true)
        .catchError((error) => false);
  }



 // Employee  Firestore  Controller
  Future<bool> CreateEmployee({required Employee employee}) async{
    return await _firebaseFirestore.collection(_collectionEmployee)
        .add(employee.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }
  Stream<QuerySnapshot> getEmployees() async*{
    yield* _firebaseFirestore.collection(_collectionEmployee).snapshots();
  }
  Future<bool> updateEmployee({required String path,required Employee employee}) async{
    return await _firebaseFirestore.collection(_collectionEmployee)
        .doc(path).update(employee.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }
  Future<bool> deleteEmployee({required String path}) async{
    return await _firebaseFirestore.collection(_collectionEmployee)
        .doc(path).delete()
        .then((value) => true)
        .catchError((error) => false);
  }


  // Duty  Firestore  Controller
  Future<bool> CreateDuty({required Duty duty}) async{
    return await _firebaseFirestore.collection(_collectionDuty)
        .add(duty.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }
  Stream<QuerySnapshot> getDuty() async*{
    yield* _firebaseFirestore.collection(_collectionDuty).snapshots();
  }
  Future<bool> updateDuty({required String path,required Duty duty}) async{
    return await _firebaseFirestore.collection(_collectionDuty)
        .doc(path).update(duty.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }
  Future<bool> deleteDuty({required String path}) async{
    return await _firebaseFirestore.collection(_collectionDuty)
        .doc(path).delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  // Task  Firestore  Controller
  Future<bool> CreateTask({required Task task}) async{
    return await _firebaseFirestore.collection(_collectionTask)
        .add(task.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }
  Stream<QuerySnapshot> getTasks() async*{
    yield* _firebaseFirestore.collection(_collectionTask).snapshots();
  }
  Future<bool> updateTask({required String path,required Task task}) async{
    return await _firebaseFirestore.collection(_collectionTask)
        .doc(path).update(task.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }
  Future<bool> deleteTask({required String path}) async{
    return await _firebaseFirestore.collection(_collectionTask)
        .doc(path).delete()
        .then((value) => true)
        .catchError((error) => false);
  }
}

