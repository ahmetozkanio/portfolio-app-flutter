class Project {
  int? id;
  String? name;
  String? description;
  String? githubUrl;
  String? date;
  String? image;
  String? slug;
  bool? avaliable;
  String? category;
  List<ProjectImages>? projectImages;
  List<ProjectTools>? projectTools;

  Project(
      {this.id,
      this.name,
      this.description,
      this.githubUrl,
      this.date,
      this.image,
      this.slug,
      this.avaliable,
      this.category,
      this.projectImages,
      this.projectTools});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    githubUrl = json['github_url'];
    date = json['date'];
    image = json['image'];
    slug = json['slug'];
    avaliable = json['avaliable'];
    category = json['category'];
    if (json['project_images'] != null) {
      projectImages = <ProjectImages>[];
      json['project_images'].forEach((v) {
        projectImages!.add(new ProjectImages.fromJson(v));
      });
    }
    if (json['project_tools'] != null) {
      projectTools = <ProjectTools>[];
      json['project_tools'].forEach((v) {
        projectTools!.add(new ProjectTools.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['github_url'] = this.githubUrl;
    data['date'] = this.date;
    data['image'] = this.image;
    data['slug'] = this.slug;
    data['avaliable'] = this.avaliable;
    data['category'] = this.category;
    if (this.projectImages != null) {
      data['project_images'] =
          this.projectImages!.map((v) => v.toJson()).toList();
    }
    if (this.projectTools != null) {
      data['project_tools'] =
          this.projectTools!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectImages {
  int? id;
  String? projectImages;
  int? project;

  ProjectImages({this.id, this.projectImages, this.project});

  ProjectImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectImages = json['project_images'];
    project = json['project'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_images'] = this.projectImages;
    data['project'] = this.project;
    return data;
  }
}

class ProjectTools {
  int? id;
  String? toolName;
  int? project;

  ProjectTools({this.id, this.toolName, this.project});

  ProjectTools.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    toolName = json['tool_name'];
    project = json['project'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tool_name'] = this.toolName;
    data['project'] = this.project;
    return data;
  }
}
