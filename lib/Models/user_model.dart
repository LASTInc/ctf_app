class UserModel {
  String login;
  String password;
  UserModel({required this.login, required this.password});


  Map<String, dynamic> toJson() {
    return {
      "login":login,
      "password":password
    };
  }
}