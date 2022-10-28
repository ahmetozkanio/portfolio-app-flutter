class Certificate {
  int? id;
  String? name;
  String? companyName;
  String? companyIcon;
  String? certificateImage;
  String? certificateUrl;
  String? date;
  bool? avaliable;

  Certificate(
      {this.id,
      this.name,
      this.companyName,
      this.companyIcon,
      this.certificateImage,
      this.certificateUrl,
      this.date,
      this.avaliable});

  Certificate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    companyName = json['company_name'];
    companyIcon = json['company_icon'];
    certificateImage = json['certificate_image'];
    certificateUrl = json['certificate_url'];
    date = json['date'];
    avaliable = json['avaliable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['company_name'] = this.companyName;
    data['company_icon'] = this.companyIcon;
    data['certificate_image'] = this.certificateImage;
    data['certificate_url'] = this.certificateUrl;
    data['date'] = this.date;
    data['avaliable'] = this.avaliable;
    return data;
  }
}
