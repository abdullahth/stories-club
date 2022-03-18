class User {
  late String id,
      name,
      email,
      password,
      phoneNumber,
      withdrawlBankAccount,
      withdrawlPhoneWallet;

  late List publishes, withdrawlRequests;
  late int gender;
  late bool verified;
  late DateTime joinedIn;
  late Map log;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.withdrawlBankAccount,
    required this.withdrawlPhoneWallet,
    required this.publishes,
    required this.withdrawlRequests,
    required this.verified,
    required this.gender,
    required this.joinedIn,
    required this.log,
  });

  User.formMap(Map map) {
    id = map["_id"];
    name = map["name"];
    email = map["email"];
    password = map["password"];
    phoneNumber = map["phoneNumber"];
    withdrawlBankAccount = map["withdrawlBankAccount"];
    withdrawlPhoneWallet = map["withdrawlPhoneWallet"];
    publishes = map["publishes"];
    withdrawlRequests = map["withdrawlRequests"];
    verified = map["verified"];
    gender = map["gender"].toInt();
    joinedIn = DateTime.parse(map["joinedIn"]);
    log = map["log"];
  }

  Map get json => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "withdrawlBankAccount": withdrawlBankAccount,
        "withdrawlPhoneWallet": withdrawlPhoneWallet,
        "publishes": publishes,
        "withdrawlRequests": withdrawlRequests,
        "gender": gender,
        "verified": verified,
        "joinedIn": joinedIn,
        "log": log,
      };

  get cityCide => null;
}
