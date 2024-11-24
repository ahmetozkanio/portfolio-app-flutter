class User {
  String? username;
  String? title;
  String? firstName;
  String? lastName;
  String? description;
  String? profilePhoto;
  String? mail;
  String? location;
  String? birthday;

  User(
      {this.username,
      this.title,
      this.firstName,
      this.lastName,
      this.description,
      this.profilePhoto,
      this.mail,
      this.location,
      this.birthday});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    description = json['description'];
    profilePhoto = json['profilePhoto'];
    mail = json['mail'];
    location = json['location'];
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['title'] = this.title;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['description'] = this.description;
    data['profilePhoto'] = this.profilePhoto;
    data['mail'] = this.mail;
    data['location'] = this.location;
    data['birthday'] = this.birthday;
    return data;
  }
}
