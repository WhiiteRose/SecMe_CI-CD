class User {
  String name;
  String email;
  String password;
  String token;

  User(
      {required this.name,
      required this.email,
      required this.password,
      required this.token});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        password = json['password'],
        token = json['token'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['token'] = token;
    return data;
  }
}
