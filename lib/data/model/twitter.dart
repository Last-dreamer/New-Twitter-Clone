// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

class TweetModel {
  final String id;
  final String userId;
  final User user;
  final String body;
  final String createdAt;
  TweetModel({
    required this.id,
    required this.userId,
    required this.user,
    required this.body,
    required this.createdAt,
  });

  TweetModel copyWith({
    String? id,
    String? userId,
    User? user,
    String? body,
    String? createdAt,
  }) {
    return TweetModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user ?? this.user,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'user': user.toMap(),
      'body': body,
      'createdAt': createdAt,
    };
  }

  factory TweetModel.fromMap(Map<String, dynamic> map) {
    var test = TweetModel(
      id: map['id'] as String,
      userId: map['userId'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      body: map['body'] as String,
      createdAt: map['createdAt'] as String,
    );
    return test;
  }

  String toJson() => json.encode(toMap());

  factory TweetModel.fromJson(String source) =>
      TweetModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TweetModel(id: $id, userId: $userId, user: $user, body: $body, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant TweetModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.user == user &&
        other.body == body &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        user.hashCode ^
        body.hashCode ^
        createdAt.hashCode;
  }
}

class User {
  final String id;
  final String email;
  final String username;
  final String createdAt;
  User({
    required this.id,
    required this.email,
    required this.username,
    required this.createdAt,
  });

  User copyWith({
    String? id,
    String? email,
    String? username,
    String? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'username': username,
      'createdAt': createdAt,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
      createdAt: map['createdAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, email: $email, username: $username, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.username == username &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        username.hashCode ^
        createdAt.hashCode;
  }
}

class AuthResponse {
  final String accessToken;
  final User user;
  AuthResponse({
    required this.accessToken,
    required this.user,
  });

  AuthResponse copyWith({
    String? accessToken,
    User? user,
  }) {
    return AuthResponse(
      accessToken: accessToken ?? this.accessToken,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'user': user.toMap(),
    };
  }

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    log("testing map $map");
    log("testing map 2 ${map['user']}");

    return AuthResponse(
      accessToken: map['accessToken'] ?? "",
      user: User.fromMap(map['user'] ?? {}),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromJson(String source) =>
      AuthResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthResponse(accessToken: $accessToken, user: $user)';

  @override
  bool operator ==(covariant AuthResponse other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken && other.user == user;
  }

  @override
  int get hashCode => accessToken.hashCode ^ user.hashCode;
}
