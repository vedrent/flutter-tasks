class ProductModel {
  ProductModel(
      this.id,
      this.title,
      this.subtitle,
      this.imageUri,
      this.cost,
      this.isFavorite,
      );

  int? id;
  String title;
  String subtitle;
  String imageUri;
  double cost;
  bool isFavorite = false;
}