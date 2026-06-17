import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<String>> getSavedCities(String uid) async {
    try {
      final doc = await _firestore.collection('users_saved_cities').doc(uid).get();
      if (doc.exists) {
        final data = doc.data();
        if (data != null && data['cities'] != null) {
          return List<String>.from(data['cities'] as List);
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<void> saveCities(String uid, List<String> cities) async {
    try {
      await _firestore.collection('users_saved_cities').doc(uid).set({
        'cities': cities,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      // Firestore handles offline synchronization automatically.
    }
  }
}
