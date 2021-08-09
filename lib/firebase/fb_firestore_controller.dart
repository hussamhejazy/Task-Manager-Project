

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/models/Department.dart';
import 'package:task_manager/models/Employee.dart';

class FbFirestoreController{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final String _collectionDepartment = 'Department';
  final String _collectionEmployee = 'Employee';
  final String _collectionTask = 'Task';


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
}

