class AudioApi {
  String? status;
  List<Audio>? audio;

  AudioApi({this.status, this.audio});

  AudioApi.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['audio'] != null) {
      audio = <Audio>[];
      json['audio'].forEach((v) {
        audio!.add(new Audio.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.audio != null) {
      data['audio'] = this.audio!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Audio {
  int? id;
  String? title;
  String? subtitle;
  String? audioPath;
  String? imgPath;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  Audio(
      {this.id,
        this.title,
        this.subtitle,
        this.audioPath,
        this.imgPath,
        this.categoryId,
        this.createdAt,
        this.updatedAt});

  Audio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    audioPath = json['audio_path'];
    imgPath = json['img_path'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['audio_path'] = this.audioPath;
    data['img_path'] = this.imgPath;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
