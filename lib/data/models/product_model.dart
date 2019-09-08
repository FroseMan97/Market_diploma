class ProductModel {
  String _productID;
  String _manufactureID;
  String _categoryID;
  String _name;
  String _description;
  List<String> _imagesURL;
  double _price;

  ProductModel(this._productID, this._manufactureID, this._categoryID,
      this._name, this._description, this._imagesURL, this._price);
      
  String get getProductID => _productID;
  String get getManufactureID => _manufactureID;
  String get getCategoryID => _categoryID;
  String get getName => _name;
  String get getDescription => _description;
  List<String> get getImagesURL => _imagesURL;
  double get getPrice => _price;
}
