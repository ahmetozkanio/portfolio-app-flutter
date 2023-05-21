class Experience {
  String? company;
  String? title;
  String? startDate;
  String? endDate;
  String? location;
  String? locationType;

  Experience(
      {this.company,
      this.title,
      this.startDate,
      this.endDate,
      this.location,
      this.locationType});

  Experience.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    title = json['title'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    location = json['location'];
    locationType = json['locationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data['title'] = this.title;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['location'] = this.location;
    data['locationType'] = this.locationType;
    return data;
  }
}
