class CategoryViewModel{
  String _id;
  String _name;
  String _imageURL;

  CategoryViewModel(this._id,this._name,this._imageURL);

  String get getID => _id;
  String get getName => _name;
  String get getImageURL => _imageURL;
}