class ProductEntity {
  String _productID;
  String _manufactureID;
  String _categoryID;
  String _name;
  String _description;
  List<String> _imageURL;
  double _price;

  ProductEntity(this._productID, this._manufactureID, this._categoryID,
      this._name, this._description, this._imageURL, this._price);

  String get getProductID => _productID;
  String get getManufactureID => _manufactureID;
  String get getCategoryID => _categoryID;
  String get getName => _name;
  String get getDescription => _description;
  List<String> get getImagesURL => _imageURL;
  double get getPrice => _price;

  @override
  String toString() {
    return 'ID товара: $_productID | ID производителя: $_manufactureID | ID категории: $_categoryID | Название: $_name | Описание: $_description | Image url: $_imageURL | Цена: $_price\n';
  }
}
