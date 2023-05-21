
class Education {
  String? university;
  String? licence;
  String? startDate;
  String? endDate;
  String? location;
  String? graduate;

  Education(
      {this.university,
      this.licence,
      this.startDate,
      this.endDate,
      this.location,
      this.graduate});

  Education.fromJson(Map<String, dynamic> json) {
    university = json['university'];
    licence = json['licence'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    location = json['location'];
    graduate = json['graduate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['university'] = this.university;
    data['licence'] = this.licence;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['location'] = this.location;
    data['graduate'] = this.graduate;
    return data;
  }
}
