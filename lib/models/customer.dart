class Customer {
  String id;
  String name;
  double balance;

  Customer({this.id, this.name, this.balance});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    balance = json['balance'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['balance'] = this.balance;
    return data;
  }
}