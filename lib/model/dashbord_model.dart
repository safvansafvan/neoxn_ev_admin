class DashboardData {
  final bool auth;
  final double revenue;
  final int totalBooking;
  final int todayBookingCount;
  final int todayTestDriveCount;
  final String status;
  final String message;

  DashboardData({
    required this.auth,
    required this.revenue,
    required this.totalBooking,
    required this.todayBookingCount,
    required this.todayTestDriveCount,
    required this.status,
    required this.message,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      auth: json['auth'],
      revenue: json['revenue'].toDouble(),
      totalBooking: json['totalBooking'],
      todayBookingCount: json['todayBookingCount'],
      todayTestDriveCount: json['todayTestDriveCount'],
      status: json['status'],
      message: json['message'],
    );
  }
}
