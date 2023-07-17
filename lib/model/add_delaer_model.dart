class AddDealerReq {
  String? dealerName;
  String? phone;
  String? city;
  String? state;
  String? email;
  String? password;

  AddDealerReq({
    this.dealerName,
    this.phone,
    this.city,
    this.state,
    this.email,
    this.password,
  });

  factory AddDealerReq.fromJson(Map<String, dynamic> json) => AddDealerReq(
        dealerName: json["dealerName"],
        phone: json["phone"],
        city: json["city"],
        state: json["state"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "dealerName": dealerName,
        "phone": phone,
        "city": city,
        "state": state,
        "email": email,
        "password": password,
      };
}
