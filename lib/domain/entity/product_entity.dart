class ProductEntity {
  String productID;
  String manufactureID;
  String categoryID;
  String name;
  String description;
  String imageURL;
  double price;

  ProductEntity(this.productID, this.manufactureID, this.categoryID, this.name,
      this.description, this.imageURL, this.price);

  @override
  String toString() {
    return 'ID товара: $productID | ID производителя: $manufactureID | ID категории: $categoryID | Название: $name | Описание: $description | Image url: $imageURL | Цена: $price\n';
  }
}
