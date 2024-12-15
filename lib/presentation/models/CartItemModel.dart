class CartItemModel {
  CartItemModel(
      this.id,
      this.title,
      this.subtitle,
      this.imageUri,
      this.cost,
      this.count
      );

  final int? id;
  final String title;
  final String subtitle;
  final String imageUri;
  final double cost;
  int count = 0;

  Map toJson() => {
    'product_id': id,
    'name': title,
    'description': subtitle,
    'image_url': imageUri,
    'price': cost,
    'quantity': count
  };
}