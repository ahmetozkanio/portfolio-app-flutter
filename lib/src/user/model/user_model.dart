class User {
  int? id;
  String? userName;
  String? firsName;
  String? lastName;
  String? title;
  String? email;
  String? image;
  String? description;
  String? birthday;
  bool? avaliable;
  List<UserImages>? userImages;
  List<UserAccounts>? userAccounts;

  User(
      {this.id,
      this.userName,
      this.firsName,
      this.lastName,
      this.title,
      this.email,
      this.image,
      this.description,
      this.birthday,
      this.avaliable,
      this.userImages,
      this.userAccounts});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    firsName = json['firs_name'];
    lastName = json['last_name'];
    title = json['title'];
    email = json['email'];
    image = json['image'];
    description = json['description'];
    birthday = json['birthday'];
    avaliable = json['avaliable'];
    if (json['user_images'] != null) {
      userImages = <UserImages>[];
      json['user_images'].forEach((v) {
        userImages!.add(new UserImages.fromJson(v));
      });
    }
    if (json['user_accounts'] != null) {
      userAccounts = <UserAccounts>[];
      json['user_accounts'].forEach((v) {
        userAccounts!.add(new UserAccounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['firs_name'] = this.firsName;
    data['last_name'] = this.lastName;
    data['title'] = this.title;
    data['email'] = this.email;
    data['image'] = this.image;
    data['description'] = this.description;
    data['birthday'] = this.birthday;
    data['avaliable'] = this.avaliable;
    if (this.userImages != null) {
      data['user_images'] = this.userImages!.map((v) => v.toJson()).toList();
    }
    if (this.userAccounts != null) {
      data['user_accounts'] =
          this.userAccounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserImages {
  int? id;
  String? image;
  int? user;

  UserImages({this.id, this.image, this.user});

  UserImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['user'] = this.user;
    return data;
  }
}

class UserAccounts {
  int? id;
  String? accountName;
  String? accountImage;
  String? accountUrl;
  int? user;

  UserAccounts(
      {this.id,
      this.accountName,
      this.accountImage,
      this.accountUrl,
      this.user});

  UserAccounts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountName = json['account_name'];
    accountImage = json['account_image'];
    accountUrl = json['account_url'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['account_name'] = this.accountName;
    data['account_image'] = this.accountImage;
    data['account_url'] = this.accountUrl;
    data['user'] = this.user;
    return data;
  }
}
