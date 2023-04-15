
class Projects {
  String? projectName;
  String? projectDescription;
  String? category;
  String? tools;
  String? date;
  String? github;
  String? thumbnail;

  Projects(
      {this.projectName,
      this.projectDescription,
      this.category,
      this.tools,
      this.date,
      this.github,
      this.thumbnail});

  Projects.fromJson(Map<String, dynamic> json) {
    projectName = json['project_name'];
    projectDescription = json['project_description'];
    category = json['category'];
    tools = json['tools'];
    date = json['date'];
    github = json['github'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_name'] = this.projectName;
    data['project_description'] = this.projectDescription;
    data['category'] = this.category;
    data['tools'] = this.tools;
    data['date'] = this.date;
    data['github'] = this.github;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}