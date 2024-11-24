import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  List<SocialAccount>? socialAccounts;

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
    if (json['socialAccounts'] != null) {
      socialAccounts = SocialAccount.fromJsonList(json['socialAccounts']);
    }
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
    if (this.socialAccounts != null) {
      data['socialAccounts'] =
          this.socialAccounts!.map((account) => account.toJson()).toList();
    }
    return data;
  }
}

class SocialAccount {
  final String account;
  final String url;
  final IconData iconData;

  SocialAccount(
      {required this.account, required this.url, required this.iconData});

  factory SocialAccount.fromJson(Map<String, dynamic> json) {
    return SocialAccount(
      account: json['account'],
      url: json['url'],
      iconData: _getIconData(json['account']),
    );
  }

  static IconData _getIconData(String account) {
    switch (account) {
      case 'linkedin':
        return FontAwesomeIcons.linkedin;
      case 'appstore':
        return FontAwesomeIcons.appStoreIos;
      case 'playstore':
        return FontAwesomeIcons.googlePlay;
      case 'instagram':
        return FontAwesomeIcons.instagram;
      case 'youtube':
        return FontAwesomeIcons.youtube;
      case 'github':
        return FontAwesomeIcons.github;
      case 'medium':
        return FontAwesomeIcons.medium;
      case 'x':
        return FontAwesomeIcons.xTwitter;
      default:
        return FontAwesomeIcons.link; // Default icon
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'account': this.account,
      'url': this.url,
      'iconData': this.iconData.codePoint,
    };
  }

  static List<SocialAccount> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => SocialAccount.fromJson(json)).toList();
  }
}
