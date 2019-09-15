class ManufactureEntity {
  String _manufactureID;
  String _name;
  String _country;
  String _imageURL;
  String _description;

  ManufactureEntity(this._manufactureID, this._name, this._country,this._imageURL, this._description);

  String get getManufactureID => _manufactureID;
  String get getName => _name;
  String get getCountry => _country;
  String get getImageURL => _imageURL;
  String get getDescription => _description;

  @override
  String toString() {
    return 'ID производителя: $_manufactureID | Название: $_name | Адрес: $_country';
  }
}
