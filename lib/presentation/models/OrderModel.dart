class OrderModel {
  OrderModel(
      this.id,
      this.userId,
      this.total,
      this.status,
      this.createdAt,
      );

  int id;
  String userId;
  double total;
  String status;
  String createdAt;
}