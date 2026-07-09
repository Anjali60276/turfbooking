class BookingModel {
  final String id;
  final String customer;
  final String service;
  final String dateTime;
  final String amount;
  final String status;

  const BookingModel({
    required this.id,
    required this.customer,
    required this.service,
    required this.dateTime,
    required this.amount,
    required this.status,
  });
}