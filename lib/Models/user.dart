class User {
  final String uid;
  String email;
  String fname;
  String lname;
  List<String> friends;

  User({this.uid, this.email, this.fname, this.lname});

  User.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        email = data['email'],
        fname = data['fname'],
        lname = data['lname'],
        friends = <String>[];

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'email': email, 'fname': fname, 'lname': lname};
  }
}
