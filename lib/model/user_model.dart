// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String usename;
  String password;
  UserModel({
    required this.usename,
    required this.password,
  });

  UserModel copyWith({
    String? usename,
    String? password,
  }) {
    return UserModel(
      usename: usename ?? this.usename,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'usename': usename,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      usename: map['usename'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(usename: $usename, password: $password)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.usename == usename &&
      other.password == password;
  }

  @override
  int get hashCode => usename.hashCode ^ password.hashCode;
}
