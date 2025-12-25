import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_web/models/contact_message.dart';

class DataService {
  static final DataService _instance = DataService._internal();

  factory DataService() {
    return _instance;
  }

  DataService._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Collection references
  CollectionReference get _messagesCollection =>
      _firestore.collection('contact_messages');
  DocumentReference get _configDoc =>
      _firestore.collection('settings').doc('config');

  // Stream of messages
  Stream<List<ContactMessage>> get messagesStream {
    return _messagesCollection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return ContactMessage.fromMap(doc.data() as Map<String, dynamic>);
          }).toList();
        });
  }

  // Stream of CV URL
  Stream<String> get cvUrlStream {
    return _configDoc.snapshots().map((snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        final data = snapshot.data() as Map<String, dynamic>;
        final url = data['cv_url'] as String? ?? '';
        return url.isNotEmpty
            ? url
            : 'https://docs.google.com/document/u/0/'; // Placeholder
      }
      return 'https://docs.google.com/document/u/0/'; // Placeholder default
    });
  }

  Future<void> addMessage(ContactMessage message) async {
    await _messagesCollection.add(message.toMap());
  }

  Future<void> updateCvUrl(String newUrl) async {
    await _configDoc.set({'cv_url': newUrl}, SetOptions(merge: true));
  }
}
