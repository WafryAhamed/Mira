/// User model for Mira Banking App
class User {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String? nic;
  final String? accountNumber;
  final bool isEmailVerified;
  final DateTime? createdAt;

  const User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    this.nic,
    this.accountNumber,
    this.isEmailVerified = false,
    this.createdAt,
  });

  User copyWith({
    String? id,
    String? fullName,
    String? email,
    String? phone,
    String? nic,
    String? accountNumber,
    bool? isEmailVerified,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      nic: nic ?? this.nic,
      accountNumber: accountNumber ?? this.accountNumber,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Demo user for testing
  static User get demoUser => User(
    id: 'demo-001',
    fullName: 'Kasun Perera',
    email: 'demo@mira.com',
    phone: '0771234567',
    nic: '200012345678',
    accountNumber: '1234567890',
    isEmailVerified: true,
    createdAt: DateTime.now(),
  );
}
