class Seasons {
  int id;
  String url;
  int number;
  String name;
  int episodeOrder;
  String premiereDate;
  String endDate;
  Network network;
  Null webChannel;
  Image image;
  String summary;
  Links lLinks;

  Seasons(
      {this.id,
      this.url,
      this.number,
      this.name,
      this.episodeOrder,
      this.premiereDate,
      this.endDate,
      this.network,
      this.webChannel,
      this.image,
      this.summary,
      this.lLinks});

  Seasons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    number = json['number'];
    name = json['name'];
    episodeOrder = json['episodeOrder'];
    premiereDate = json['premiereDate'];
    endDate = json['endDate'];
    network =
        json['network'] != null ? Network.fromJson(json['network']) : null;
    webChannel = json['webChannel'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    summary = json['summary'];
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['number'] = this.number;
    data['name'] = this.name;
    data['episodeOrder'] = this.episodeOrder;
    data['premiereDate'] = this.premiereDate;
    data['endDate'] = this.endDate;
    if (this.network != null) {
      data['network'] = this.network.toJson();
    }
    data['webChannel'] = this.webChannel;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['summary'] = this.summary;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

class Network {
  int id;
  String name;
  Country country;

  Network({this.id, this.name, this.country});

  Network.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.country != null) {
      data['country'] = this.country.toJson();
    }
    return data;
  }
}

class Country {
  String name;
  String code;
  String timezone;

  Country({this.name, this.code, this.timezone});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['timezone'] = this.timezone;
    return data;
  }
}

class Image {
  String medium;
  String original;

  Image({this.medium, this.original});

  Image.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['medium'] = this.medium;
    data['original'] = this.original;
    return data;
  }
}

class Links {
  Self self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? Self.fromJson(json['self']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self.toJson();
    }
    return data;
  }
}

class Self {
  String href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
