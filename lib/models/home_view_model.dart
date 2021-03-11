class HomeViewModel {
  List<Categories> categories;
  List<Banners> banners;
  Ads ads;

  HomeViewModel({this.categories, this.banners, this.ads});

  HomeViewModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = new List<Banners>();
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
    ads = json['ads'] != null ? new Ads.fromJson(json['ads']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    if (this.ads != null) {
      data['ads'] = this.ads.toJson();
    }
    return data;
  }
}

class Categories {
  int id;
  String name;
  String photo;

  Categories({this.id, this.name, this.photo});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    return data;
  }
}

class Banners {
  int id;
  String photo;

  Banners({this.id, this.photo});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    return data;
  }
}

class Ads {
  int currentPage;
  List<AdData> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String path;
  int perPage;
  int to;
  int total;

  Ads(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Ads.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<AdData>();
      json['data'].forEach((v) {
        data.add(new AdData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class AdData {
  int id;
  String title;
  int price;
  int views;
  int likesCount;
  int commentsCount;
  Photo photo;
  GetUser getUser;
  City city;
  bool isAdv;
  String createdAt;

  AdData(
      {this.id,
        this.title,
        this.price,
        this.views,
        this.likesCount,
        this.commentsCount,
        this.photo,
        this.getUser,
        this.city,
        this.isAdv,
        this.createdAt});

  AdData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    views = json['views'];
    likesCount = json['likes_count'];
    commentsCount = json['comments_count'];
    photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
    getUser = json['get_user'] != null
        ? new GetUser.fromJson(json['get_user'])
        : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    isAdv = json['is_adv'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['views'] = this.views;
    data['likes_count'] = this.likesCount;
    data['comments_count'] = this.commentsCount;
    if (this.photo != null) {
      data['photo'] = this.photo.toJson();
    }
    if (this.getUser != null) {
      data['get_user'] = this.getUser.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    data['is_adv'] = this.isAdv;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Photo {
  int id;
  int adsId;
  String photo;

  Photo({this.id, this.adsId, this.photo});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adsId = json['ads_id'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ads_id'] = this.adsId;
    data['photo'] = this.photo;
    return data;
  }
}

class GetUser {
  int id;
  String username;
  int userTypeId;
  String photo;

  GetUser({this.id, this.username, this.userTypeId, this.photo});

  GetUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    userTypeId = json['user_type_id'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['user_type_id'] = this.userTypeId;
    data['photo'] = this.photo;
    return data;
  }
}

class City {
  int id;
  String name;

  City({this.id, this.name});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}