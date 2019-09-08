class ManufactureEntity {
  String _manufactureID;
  String _name;
  String _address;

  ManufactureEntity(this._manufactureID, this._name, this._address);

  String get getManufactureID => _manufactureID;
  String get getName => _name;
  String get getAddress => _address;

  @override
  String toString() {
    return 'ID производителя: $_manufactureID | Название: $_name | Адрес: $_address';
  }
}
