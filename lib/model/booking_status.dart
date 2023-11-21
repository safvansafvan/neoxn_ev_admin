class BookingStatus {
  String? id;
  String? names;
  String? lastName;
  String? email;
  int? phone;
  int? pincode;
  String? city;
  String? model;
  int? bookingPrice;
  String? address1;
  String? address2;
  String? state;
  String? dealer;
  String? status;
  String? createdAt;
  String? updatedAt;

  BookingStatus({
    this.id,
    this.names,
    this.lastName,
    this.email,
    this.phone,
    this.pincode,
    this.city,
    this.model,
    this.bookingPrice,
    this.address1,
    this.address2,
    this.state,
    this.dealer,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  factory BookingStatus.fromJson(Map<String, dynamic> json) => BookingStatus(
        id: json["_id"],
        names: json["names"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        pincode: json["pincode"],
        city: json["city"],
        model: json["model"],
        address1: json["address1"],
        address2: json["address2"],
        bookingPrice: json["bookingPrice"],
        state: json["state"],
        dealer: json["dealer"],
        status: json["status"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );
}
