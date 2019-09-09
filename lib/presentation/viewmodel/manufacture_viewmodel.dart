class ManufactureViewModel{
  String _id;
  String _name;
  String _country;
  String _imageURL;

   ManufactureViewModel(this._id, this._name, this._country, this._imageURL);

  String get getManufactureID => _id;
  String get getName => _name;
  String get getCountry => _country;
  String get getImageURL => _imageURL;
}