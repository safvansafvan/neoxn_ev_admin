class AddDealerReq {
  String? name;
  String? phone;
  String? city;
  String? state;

  AddDealerReq({
    this.name,
    this.phone,
    this.city,
    this.state,
  });

  factory AddDealerReq.fromJson(Map<String, dynamic> json) => AddDealerReq(
        name: json["name"],
        phone: json["phone"],
        city: json["city"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "city": city,
        "state": state,
      };
}
