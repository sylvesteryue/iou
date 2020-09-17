class Record {
  String creditorUid;
  String debtorUid;
  int moneyAmt;
  String description;
  String type;

  Record(
      {this.creditorUid,
      this.debtorUid,
      this.moneyAmt,
      this.description,
      this.type});

  Record.fromData(Map<String, dynamic> data)
      : this.creditorUid = data['creditor_uid'],
        this.debtorUid = data['debtor_uid'],
        this.description = data['description'],
        this.moneyAmt = data['money_amount'],
        this.type = data['type'];

  Map<String, dynamic> toJson() {
    return {
      'creditor_uid': creditorUid,
      'debtor_uid': debtorUid,
      'description': description,
      'money_amount': moneyAmt,
      'type': type
    };
  }
}
