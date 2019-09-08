class CategoryEntity {
  String _categoryID;
  String _name;
  String _imageURL;

  CategoryEntity(this._categoryID, this._name,this._imageURL);

  String get getCategoryID => _categoryID;
  String get getName => _name;
  String get getImageURL =>_imageURL;
}
