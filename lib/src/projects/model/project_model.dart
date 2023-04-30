class Projects {
  String? projectName;
  String? projectDescription;
  String? date;
  String? github;
  String? thumbnail;
  String? readme;
  List<Tools>? tools;

  Projects(
      {this.projectName,
      this.projectDescription,
      this.date,
      this.github,
      this.thumbnail,
      this.readme,
      this.tools});

  Projects.fromJson(Map<String, dynamic> json) {
    projectName = json['project_name'];
    projectDescription = json['project_description'];
    date = json['date'];
    github = json['github'];
    thumbnail = json['thumbnail'];
    readme = json['readme'];
    if (json['tools'] != null) {
      tools = <Tools>[];
      json['tools'].forEach((v) {
        tools!.add(new Tools.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_name'] = this.projectName;
    data['project_description'] = this.projectDescription;
    data['date'] = this.date;
    data['github'] = this.github;
    data['thumbnail'] = this.thumbnail;
    data['readme'] = this.readme;
    if (this.tools != null) {
      data['tools'] = this.tools!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tools {
  String? id;

  Tools({this.id});

  Tools.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
