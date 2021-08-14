class User {
  String? fullName;
  String? userName;
  String? emailAddress;
  String? password;
  String? confirmPassword;
  String? userRole;

  User(this.emailAddress, this.password,
      {this.fullName, this.userName, this.confirmPassword, this.userRole});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['emailAddress'], json['password'],
        fullName: json['fullNmme'],
        userName: json['userName'],
        confirmPassword: json['confirmPassword'],
        userRole: json['userRole']);
  }

  Map<String, dynamic> tojson() {
    
    return {
      "fullName": fullName,
      "userName": userName,
      "emailAddress": emailAddress,
      "password": password,
      "confirmPassword": confirmPassword,
      "userRole": userRole
    };
  }
}
