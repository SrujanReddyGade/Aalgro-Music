class TopAlbums {
  Feed feed;

  TopAlbums({this.feed});

  TopAlbums.fromJson(Map<String, dynamic> json) {
    feed = json['feed'] != null ? new Feed.fromJson(json['feed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.feed != null) {
      data['feed'] = this.feed.toJson();
    }
    return data;
  }
}

class Feed {
  Author author;
  List<Entry> entry;
  Name updated;
  Name rights;
  Name title;
  Name icon;
  Name id;

  Feed(
      {this.author,
      this.entry,
      this.updated,
      this.rights,
      this.title,
      this.icon,
      this.id});

  Feed.fromJson(Map<String, dynamic> json) {
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    if (json['entry'] != null) {
      entry = new List<Entry>();
      json['entry'].forEach((v) {
        entry.add(new Entry.fromJson(v));
      });
    }
    updated =
        json['updated'] != null ? new Name.fromJson(json['updated']) : null;
    rights = json['rights'] != null ? new Name.fromJson(json['rights']) : null;
    title = json['title'] != null ? new Name.fromJson(json['title']) : null;
    icon = json['icon'] != null ? new Name.fromJson(json['icon']) : null;
    id = json['id'] != null ? new Name.fromJson(json['id']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.entry != null) {
      data['entry'] = this.entry.map((v) => v.toJson()).toList();
    }
    if (this.updated != null) {
      data['updated'] = this.updated.toJson();
    }
    if (this.rights != null) {
      data['rights'] = this.rights.toJson();
    }
    if (this.title != null) {
      data['title'] = this.title.toJson();
    }
    if (this.icon != null) {
      data['icon'] = this.icon.toJson();
    }
    if (this.id != null) {
      data['id'] = this.id.toJson();
    }
    return data;
  }
}

class Author {
  Name name;
  Name uri;

  Author({this.name, this.uri});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    uri = json['uri'] != null ? new Name.fromJson(json['uri']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    if (this.uri != null) {
      data['uri'] = this.uri.toJson();
    }
    return data;
  }
}

class Name {
  String label;

  Name({this.label});

  Name.fromJson(Map<String, dynamic> json) {
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}

class Entry {
  Name imName;
  List<ImImage> imImage;
  Name imItemCount;
  ImImage imPrice;
  Name rights;
  Name title;
  Name id;
  ImImage imArtist;
  ImImage imReleaseDate;

  Entry(
      {this.imName,
      this.imImage,
      this.imItemCount,
      this.imPrice,
      this.rights,
      this.title,
      this.id,
      this.imArtist,
      this.imReleaseDate});

  Entry.fromJson(Map<String, dynamic> json) {
    imName =
        json['im:name'] != null ? new Name.fromJson(json['im:name']) : null;
    if (json['im:image'] != null) {
      imImage = new List<ImImage>();
      json['im:image'].forEach((v) {
        imImage.add(new ImImage.fromJson(v));
      });
    }
    imItemCount = json['im:itemCount'] != null
        ? new Name.fromJson(json['im:itemCount'])
        : null;
    imPrice = json['im:price'] != null
        ? new ImImage.fromJson(json['im:price'])
        : null;
    rights = json['rights'] != null ? new Name.fromJson(json['rights']) : null;
    title = json['title'] != null ? new Name.fromJson(json['title']) : null;
    id = json['id'] != null ? new Name.fromJson(json['id']) : null;
    imArtist = json['im:artist'] != null
        ? new ImImage.fromJson(json['im:artist'])
        : null;
    imReleaseDate = json['im:releaseDate'] != null
        ? new ImImage.fromJson(json['im:releaseDate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.imName != null) {
      data['im:name'] = this.imName.toJson();
    }
    if (this.imImage != null) {
      data['im:image'] = this.imImage.map((v) => v.toJson()).toList();
    }
    if (this.imItemCount != null) {
      data['im:itemCount'] = this.imItemCount.toJson();
    }
    if (this.imPrice != null) {
      data['im:price'] = this.imPrice.toJson();
    }
    if (this.rights != null) {
      data['rights'] = this.rights.toJson();
    }
    if (this.title != null) {
      data['title'] = this.title.toJson();
    }
    if (this.id != null) {
      data['id'] = this.id.toJson();
    }
    if (this.imArtist != null) {
      data['im:artist'] = this.imArtist.toJson();
    }
    if (this.imReleaseDate != null) {
      data['im:releaseDate'] = this.imReleaseDate.toJson();
    }
    return data;
  }
}

class ImImage {
  String label;

  ImImage({this.label});

  ImImage.fromJson(Map<String, dynamic> json) {
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}

class Attributes {
  String amount;
  String currency;

  Attributes({this.amount, this.currency});

  Attributes.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    return data;
  }
}

class ImContentType {
  Attributes attributes;

  ImContentType({this.attributes});

  ImContentType.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributes != null) {
      data['attributes'] = this.attributes.toJson();
    }
    return data;
  }
}
