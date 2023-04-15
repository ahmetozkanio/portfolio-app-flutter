class User {
  String? username;
  String? firstName;
  String? lastName;
  String? description;
  String? profilePhoto;

  User(
      {this.username,
      this.firstName,
      this.lastName,
      this.description,
      this.profilePhoto});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    description = json['description'];
    profilePhoto = json['profilePhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['description'] = this.description;
    data['profilePhoto'] = this.profilePhoto;
    return data;
  }
}