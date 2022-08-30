class VideoApi {
  String? status;
  List<Video>? video;

  VideoApi({this.status, this.video});

  VideoApi.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['video'] != null) {
      video = <Video>[];
      json['video'].forEach((v) {
        video!.add(new Video.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.video != null) {
      data['video'] = this.video!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Video {
  int? id;
  String? title;
  String? url;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  Video(
      {this.id,
        this.title,
        this.url,
        this.categoryId,
        this.createdAt,
        this.updatedAt});

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}