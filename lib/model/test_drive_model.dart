class TestDriveStatus {
  String? id;
  String? name;
  String? email;
  int? phone;
  String? city;
  String? state;
  String? model;
  String? dealership;
  bool? checked;
  String? status;
  String? createdAt;
  String? updatedAt;

  TestDriveStatus({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.city,
    this.state,
    this.model,
    this.dealership,
    this.checked,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  factory TestDriveStatus.fromJson(Map<String, dynamic> json) =>
      TestDriveStatus(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        city: json["city"],
        state: json["state"],
        model: json["model"],
        dealership: json["dealership"],
        checked: json["checked"],
        status: json["status"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );
}
