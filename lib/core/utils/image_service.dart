import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();

  // 1. PICK IMAGE (Works for both mobile and web)
  Future<XFile?> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85, // Compress for web
      );
      return image;
    } catch (e) {
      log('Error picking image: $e');
      return null;
    }
  }

  // 2. UPLOAD IMAGE TO FIREBASE STORAGE
  Future<String?> uploadImage(XFile imageFile, String userId) async {
    try {
      // Create a unique filename
      String fileName =
          'user_$userId/${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Convert XFile to bytes (works for web)
      final bytes = await imageFile.readAsBytes();

      // Upload to Firebase Storage
      final Reference storageRef = _storage.ref().child(fileName);
      final UploadTask uploadTask = storageRef.putData(
        bytes,
        SettableMetadata(contentType: 'image/jpeg'),
      );

      // Wait for upload to complete
      final TaskSnapshot snapshot = await uploadTask;

      // Get download URL
      final String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      log('Error uploading image: $e');
      return null;
    }
  }

  // 3. SAVE URL TO FIRESTORE
  Future<void> saveImageUrlToFirestore({
    required String userId,
    required String imageUrl,
    required String imageName,
  }) async {
    await _firestore.collection('users').doc(userId).update({
      'profileImage': imageUrl,
      'profileImageName': imageName,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  // 4. COMPLETE UPLOAD PROCESS
  Future<String?> uploadAndSaveProfileImage(String userId) async {
    try {
      // Pick image
      final XFile? image = await pickImage();
      if (image == null) return null;

      // Upload to Storage
      final String? imageUrl = await uploadImage(image, userId);
      if (imageUrl == null) return null;

      // Save URL to Firestore
      await saveImageUrlToFirestore(
        userId: userId,
        imageUrl: imageUrl,
        imageName: image.name,
      );

      return imageUrl;
    } catch (e) {
      log('Error in complete process: $e');
      return null;
    }
  }

  // 5. GET IMAGE URL FROM FIRESTORE
  Future<String?> getUserImageUrl(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    return doc.data()?['profileImage'];
  }

  // 6. DELETE IMAGE
  Future<void> deleteImage(String userId, String imagePath) async {
    try {
      // Delete from Storage
      await _storage.ref(imagePath).delete();

      // Remove URL from Firestore
      await _firestore.collection('users').doc(userId).update({
        'profileImage': FieldValue.delete(),
        'profileImageName': FieldValue.delete(),
      });
    } catch (e) {
      log('Error deleting image: $e');
    }
  }
}
