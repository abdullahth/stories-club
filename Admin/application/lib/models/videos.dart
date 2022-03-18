class Video {
  late String id, title, desc, publisher, book, ph;
  late DateTime publishedIn;
  late int category;
  late List parts, likers, comments;

  Video({
    required this.id,
    required this.title,
    required this.desc,
    required this.publisher,
    required this.book,
    required this.ph,
    required this.publishedIn,
    required this.category,
    required this.parts,
    required this.likers,
    required this.comments,
  });

  Video.fromMap(Map map) {
    id = map["_id"];
    title = map["title"];
    desc = map["desc"];
    publisher = map["publisher"];
    book = map["book"];
    ph = map["ph"];
    publishedIn = DateTime.parse(map["publishedIn"]);
    category = map["category"].toInt();
    parts = map["parts"];
    likers = map["likers"];
    comments = map["comments"];
  }

  Map get json => {
        "_id": id,
        "title": title,
        "desc": desc,
        "publisher": publisher,
        "book": book,
        "ph": ph,
        "publishedIn": publishedIn,
        "category": category,
        "parts": parts,
        "likers": likers,
        "comments": comments,
      };
}
