import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<String>> getSavedCities(String uid) async {
    try {
      final snapshot = await _firestore
          .collection('users_saved_cities')
          .doc(uid)
          .collection('cities')
          .get();
      return snapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> saveCities(String uid, List<String> cities) async {
    try {
      final batch = _firestore.batch();
      
      // Update parent document timestamp
      final parentRef = _firestore.collection('users_saved_cities').doc(uid);
      batch.set(parentRef, {
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      // Get currently saved cities in the sub-collection to determine additions/deletions
      final currentDocs = await _firestore
          .collection('users_saved_cities')
          .doc(uid)
          .collection('cities')
          .get();
      final currentCities = currentDocs.docs.map((doc) => doc.id).toList();

      // Add new cities
      for (final city in cities) {
        if (!currentCities.contains(city)) {
          final docRef = _firestore
              .collection('users_saved_cities')
              .doc(uid)
              .collection('cities')
              .doc(city);
          batch.set(docRef, {
            'createdAt': FieldValue.serverTimestamp(),
          });
        }
      }

      // Delete removed cities
      for (final currentCity in currentCities) {
        if (!cities.contains(currentCity)) {
          final docRef = _firestore
              .collection('users_saved_cities')
              .doc(uid)
              .collection('cities')
              .doc(currentCity);
          batch.delete(docRef);
        }
      }

      await batch.commit();
    } catch (e) {
      // Firestore handles offline synchronization automatically.
    }
  }
}
