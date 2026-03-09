class UserModel {
  final String uid;
  final String email;
  final String displayName;
  final bool notificationsEnabled;

  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    this.notificationsEnabled = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'notificationsEnabled': notificationsEnabled,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'] ?? '',
      notificationsEnabled: map['notificationsEnabled'] ?? true,
    );
  }
}
