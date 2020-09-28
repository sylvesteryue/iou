class Record {
  String loanerUid;
  String debtorUid;
  int moneyAmt;
  String description;
  String type;

  Record(
      {this.loanerUid,
      this.debtorUid,
      this.moneyAmt,
      this.description,
      this.type});

  Record.fromData(Map<String, dynamic> data)
      : this.loanerUid = data['loaner_uid'],
        this.debtorUid = data['debtor_uid'],
        this.description = data['description'],
        this.moneyAmt = data['money_amount'],
        this.type = data['type'];

  Map<String, dynamic> toJson() {
    return {
      'loaner_uid': loanerUid,
      'debtor_uid': debtorUid,
      'description': description,
      'money_amount': moneyAmt,
      'type': type
    };
  }
}
