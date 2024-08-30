class LiveMusic {
  List<LiveMusicData>? data;
  Meta? meta;

  LiveMusic({this.data, this.meta});

  LiveMusic.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LiveMusicData>[];
      json['data'].forEach((v) {
        data!.add(LiveMusicData.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class LiveMusicData {
  String? coverImageUrl;
  String? imageUrl;
  String? title;
  String? address;
  String? googleLink;
  String? eventLink;
  String? locality;
  Category? category;
  List<Tags>? tags;
  String? city;
  String? status;
  String? createdBy;
  String? eventType;
  int? costOf2;
  String? id;
  int? eventStartDate;
  int? eventVisibilityStartDate;
  int? eventVisibilityEndDate;

  LiveMusicData(
      {this.coverImageUrl,
      this.imageUrl,
      this.title,
      this.address,
      this.googleLink,
      this.eventLink,
      this.locality,
      this.category,
      this.tags,
      this.city,
      this.status,
      this.createdBy,
      this.eventType,
      this.costOf2,
      this.id,
      this.eventStartDate,
      this.eventVisibilityStartDate,
      this.eventVisibilityEndDate});

  LiveMusicData.fromJson(Map<String, dynamic> json) {
    coverImageUrl = json['cover_image_url'];
    imageUrl = json['image_url'];
    title = json['title'];
    address = json['address'];
    googleLink = json['google_link'];
    eventLink = json['event_link'];
    locality = json['locality'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    city = json['city'];
    status = json['status'];
    createdBy = json['created_by'];
    eventType = json['event_type'];
    costOf2 = json['cost_of_2'];
    id = json['id'];
    eventStartDate = json['event_start_date'];
    eventVisibilityStartDate = json['event_visibility_start_date'];
    eventVisibilityEndDate = json['event_visibility_end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cover_image_url'] = coverImageUrl;
    data['image_url'] = imageUrl;
    data['title'] = title;
    data['address'] = address;
    data['google_link'] = googleLink;
    data['event_link'] = eventLink;
    data['locality'] = locality;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    data['city'] = city;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['event_type'] = eventType;
    data['cost_of_2'] = costOf2;
    data['id'] = id;
    data['event_start_date'] = eventStartDate;
    data['event_visibility_start_date'] = eventVisibilityStartDate;
    data['event_visibility_end_date'] = eventVisibilityEndDate;
    return data;
  }
}

class Category {
  String? name;
  String? iconKey;
  String? id;

  Category({this.name, this.iconKey, this.id});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iconKey = json['icon_key'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon_key'] = iconKey;
    data['id'] = id;
    return data;
  }
}

class Tags {
  String? name;
  String? id;

  Tags({this.name, this.id});

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class Meta {
  int? page;
  int? limit;
  int? totalPages;
  int? totalResults;

  Meta({this.page, this.limit, this.totalPages, this.totalResults});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    totalResults = json['totalResults'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['limit'] = limit;
    data['totalPages'] = totalPages;
    data['totalResults'] = totalResults;
    return data;
  }
}
