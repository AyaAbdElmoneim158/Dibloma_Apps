class UserModel {
  String? name;
  String? email;
  String? uId;

  UserModel({this.email, this.name, this.uId}); //this.password

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'uId': uId,
    };
  }
}
