class Record {
  String loanerUid;
  String debtorUid;
  double moneyAmt;
  String description;

  Record({this.loanerUid, this.debtorUid, this.moneyAmt, this.description});

  Record.fromData(Map<String, dynamic> data)
      : this.loanerUid = data['loaner_uid'],
        this.debtorUid = data['debtor_uid'],
        this.description = data['description'],
        this.moneyAmt = data['money_amount'];

  Map<String, dynamic> toJson() {
    return {
      'loaner_uid': loanerUid,
      'debtor_uid': debtorUid,
      'description': description,
      'money_amount': moneyAmt
    };
  }
}
