class ProductModel {
  ProductModel(
      this.id,
      this.title,
      this.subtitle,
      this.imageUri,
      this.cost,
      this.isFavorite,
      );

  final int? id;
  final String title;
  final String subtitle;
  final String imageUri;
  final double cost;
  bool isFavorite = false;
}