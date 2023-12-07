class UserModel {
  String? name;
  String? email;
   String? image;
  String? uId;

  UserModel({this.email, this.name, this.uId, this.image}); 

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    image = json['image'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'image': image,
      'uId': uId,
    };
  }
}
