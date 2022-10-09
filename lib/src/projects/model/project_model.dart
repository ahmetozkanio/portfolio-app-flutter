class Projects {
  String? projectName;
  String? projectDescription;
  String? category;
  String? tools;
  String? date;
  String? github;
  List<Images>? images;

  Projects(
      {this.projectName,
      this.projectDescription,
      this.category,
      this.tools,
      this.date,
      this.github,
      this.images});

  Projects.fromJson(Map<String, dynamic> json) {
    projectName = json['project_name'];
    projectDescription = json['project_description'];
    category = json['category'];
    tools = json['tools'];
    date = json['date'];
    github = json['github'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_name'] = this.projectName;
    data['project_description'] = this.projectDescription;
    data['category'] = this.category;
    data['tools'] = this.tools;
    data['date'] = this.date;
    data['github'] = this.github;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? imageUrl;

  Images({this.imageUrl});

  Images.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_url'] = this.imageUrl;
    return data;
  }
}
