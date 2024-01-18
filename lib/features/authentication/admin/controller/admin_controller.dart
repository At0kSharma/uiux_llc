import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uiux/features/admin/screen/admin_login_screen.dart';

class AdminController extends GetxController {
  static AdminController get instance => Get.find();

  // Hash the password using SHA-256
  String hashPassword(String password) {
    var bytes = utf8.encode(password); // Encode the password as bytes
    var digest = sha256.convert(bytes); // Compute the SHA-256 hash
    return digest.toString(); // Convert the hash to a string
  }

  Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

// Create or update user with hashed password in Firestore
  Future<void> createOrUpdateUser(String email, String password) async {
    final hashedPassword = hashPassword(password);
    final CollectionReference adminsCollection =
        FirebaseFirestore.instance.collection('admin');

    // Check if the admin already exists by querying the collection with the email
    QuerySnapshot querySnapshot =
        await adminsCollection.where('email', isEqualTo: email).get();

    if (querySnapshot.docs.isNotEmpty) {
      // If admin already exists, update the existing admin with the new hashed password
      await adminsCollection
          .doc(querySnapshot.docs.first.id)
          .update({'authentication': hashedPassword});
    } else {
      // If admin doesn't exist, create a new admin with the email and hashed password
      await adminsCollection.add({
        'email': email,
        'authentication': hashedPassword,
        'registrationDate': FieldValue.serverTimestamp(),
        'isAdmin': false, // You can customize this based on your logic
      });
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Error", "Something went wrong. Try Again");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", "Something went wrong. Try Again");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong. Try Again");
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.code);

      // if (e.code == 'user-not-found') {
      //   Get.snackbar("Error", "Something went wrong. Try Again");
      // } else if (e.code == 'wrong-password') {
      //   Get.snackbar("Error", "Something went wrong. Try Again");
      // }
    }
  }

  // Verify if entered password matches the hashed password in Firestore
  Future<bool> verifyPassword(String email, String enteredPassword) async {
    final CollectionReference adminsCollection =
        FirebaseFirestore.instance.collection('admin');

    // Retrieve the document of the admin based on the email
    QuerySnapshot querySnapshot =
        await adminsCollection.where('email', isEqualTo: email).get();

    if (querySnapshot.docs.isNotEmpty) {
      // Get the stored hashed password from the Firestore document
      var storedHashedPassword =
          querySnapshot.docs.first['authentication'].toString();

      // Hash the entered password for comparison
      var enteredHash = hashPassword(enteredPassword);

      // Compare the entered password hash with the stored hash
      return enteredHash == storedHashedPassword;
    }

    // Return false if the admin with the specified email does not exist
    return false;
  }

  Future<void> resetUserPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar("Success", "Check Your email for reset link");
      Get.to(() => const AdminLogin());
    } catch (e) {
      Get.snackbar("Error", "Email not found");
    }
  }
}
