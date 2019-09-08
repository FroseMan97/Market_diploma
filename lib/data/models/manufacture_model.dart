class ManufactureModel {
  String _manufactureID;
  String _name;
  String _address;

  ManufactureModel(this._manufactureID, this._name, this._address);

  String get getManufactureID => _manufactureID;
  String get getName => _name;
  String get getAddress => _address;
}
