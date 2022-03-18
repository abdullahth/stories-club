class Book {
  late String id, title, desc, publisher, ph, depositNumber;
  late DateTime publishingDate;
  late int category, numOfChapters, isin;
  late List likers, comments;

  Book({
    required this.id,
    required this.title,
    required this.desc,
    required this.publisher,
    required this.depositNumber,
    required this.ph,
    required this.publishingDate,
    required this.category,
    required this.likers,
    required this.comments,
  });

  Book.fromMap(Map map) {
    title = map["title"];
    id = map["_id"];
    desc = map["desc"];
    publisher = map["publisher"];
    depositNumber = map["depositNumber"];
    ph = map["ph"];
    publishingDate = DateTime.parse(map["publishingDate"]);
    category = map["category"].toInt();
    numOfChapters = map["numOfChapters"].toInt();
    isin = map["isin"].toInt();
    likers = map["likers"];
    comments = map["comment"];
  }

  Map get json => {
        "title": title,
        "_id": id,
        "desc": desc,
        "publisher": publisher,
        "depositNumber": depositNumber,
        "ph": ph,
        "publishingDate": publishingDate,
        "category": category,
        "numOfChapters": numOfChapters,
        "isin": isin,
        "likers": likers,
        "comment": comments,
      };
}
