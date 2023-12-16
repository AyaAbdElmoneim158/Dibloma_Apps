class UserModel {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;

  UserModel({id, email, password, name, role, avatar});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['role'] = role;
    data['avatar'] = avatar;
    return data;
  }

  static List<UserModel> dummyUsers = [
    UserModel(id: 1, name: 'John Doe', email: 'john.doe@example.com'),
    UserModel(
      id: 2,
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
    ),
    UserModel(
      id: 3,
      name: 'Alice Johnson',
      email: 'alice.johnson@example.com',
    ),
    UserModel(
      id: 4,
      name: 'Bob Williams',
      email: 'bob.williams@example.com',
    ),
    UserModel(
      id: 5,
      name: 'Eva Brown',
      email: 'eva.brown@example.com',
    ),
    UserModel(
      id: 6,
      name: 'Charlie Davis',
      email: 'charlie.davis@example.com',
    ),
    UserModel(
      id: 7,
      name: 'Grace Miller',
      email: 'grace.miller@example.com',
    ),
    UserModel(
      id: 8,
      name: 'Daniel Wilson',
      email: 'daniel.wilson@example.com',
    ),
    UserModel(
      id: 9,
      name: 'Sophia Moore',
      email: 'sophia.moore@example.com',
    ),
    UserModel(
      id: 10,
      name: 'Oliver Taylor',
      email: 'oliver.taylor@example.com',
    ),
  ];
}
