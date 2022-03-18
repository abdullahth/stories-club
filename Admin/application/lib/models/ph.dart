class PH {
  late String id, name, desc;
  late DateTime establishedIn, joinedIn;
  late List writers, publishes;

  PH({
    required this.id,
    required this.name,
    required this.desc,
    required this.establishedIn,
    required this.joinedIn,
    required this.writers,
    required this.publishes,
  });

  PH.fromMap(Map map) {
    id = map["_id"];
    name = map["name"];
    desc = map["desc"];
    establishedIn = map["establishedIn"];
    joinedIn = map["joinedIn"];
    writers = map["writers"];
    publishes = map["publishes"];
  }

  Map get json => {
        "_id": id,
        "name": name,
        "desc": desc,
        "establishedIn": establishedIn,
        "joinedIn": joinedIn,
        "writers": writers,
        "publishes": publishes,
      };
}
