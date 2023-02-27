class Rider {
  String name;
  String number;
  String imgUrl;
  // String number;

  Rider({this.name, this.number, this.imgUrl});

  Rider.fromJson(Map<String, dynamic> json) {
    name = json['userName'];
    number = json['phoneNumber'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['number'] = this.number;
    // data['number'] = this.number;
    // data['category'] = this.category;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}
