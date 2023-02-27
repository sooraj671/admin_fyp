class Order {
  String id;
  int totalPrice;
  String date;
  String customerLocation;

  Order({
    this.id,
    this.totalPrice,
    this.date,
    this.customerLocation,
  });

  Order.fromJson(Map<String, dynamic> json) {
    totalPrice = json['totalPrice'];
    date = json['date'];
    customerLocation = json['customerLocation'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['totalPrice'] = this.totalPrice;
    data['date'] = this.date;
    data['customerLocatin'] = this.customerLocation;
    data['id'] = this.id;
    return data;
  }
}
