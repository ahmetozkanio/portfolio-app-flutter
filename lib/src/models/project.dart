class Project {
  String? projectName;
  String? projectDescription;
  String? date;
  String? github;
  String? appStore;
  String? playStore;
  String? thumbnail;
  String? readme;

  Project({
    this.projectName,
    this.projectDescription,
    this.date,
    this.github,
    this.thumbnail,
    this.readme,
  });

  Project.fromJson(Map<String, dynamic> json) {
    projectName = json['project_name'];
    projectDescription = json['project_description'];
    date = json['date'];
    github = json['github'];
    appStore = json['app_store'];
    playStore = json['play_store'];

    thumbnail = json['thumbnail'];
    readme = json['readme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_name'] = this.projectName;
    data['project_description'] = this.projectDescription;
    data['date'] = this.date;
    data['github'] = this.github;
    data['app_store'] = this.appStore;
    data['play_store'] = this.playStore;

    data['thumbnail'] = this.thumbnail;
    data['readme'] = this.readme;

    return data;
  }
}
