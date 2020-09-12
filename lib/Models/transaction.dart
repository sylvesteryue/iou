class Transaction {
  String friendUid;
  int price;
  String description;
  String type;

  Transaction({this.friendUid, this.price, this.description, this.type});

  Transaction.fromData(Map<String, dynamic> data)
      : this.friendUid = data['friend_uid'],
        this.description = data['description'],
        this.price = data['price'],
        this.type = data['type'];

  Map<String, dynamic> toJson() {
    return {
      'friend_uid': friendUid,
      'description': description,
      'price': price,
      'type': type
    };
  }
}
