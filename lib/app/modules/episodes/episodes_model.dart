class Episodes {
  int id;
  String url;
  String name;
  int season;
  int number;
  String type;
  String airdate;
  String airtime;
  String airstamp;
  int runtime;
  Image image;
  String summary;
  Links lLinks;

  Episodes(
      {this.id,
      this.url,
      this.name,
      this.season,
      this.number,
      this.type,
      this.airdate,
      this.airtime,
      this.airstamp,
      this.runtime,
      this.image,
      this.summary,
      this.lLinks});

  Episodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    season = json['season'];
    number = json['number'];
    type = json['type'];
    airdate = json['airdate'];
    airtime = json['airtime'];
    airstamp = json['airstamp'];
    runtime = json['runtime'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    summary = json['summary'];
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['name'] = this.name;
    data['season'] = this.season;
    data['number'] = this.number;
    data['type'] = this.type;
    data['airdate'] = this.airdate;
    data['airtime'] = this.airtime;
    data['airstamp'] = this.airstamp;
    data['runtime'] = this.runtime;
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
