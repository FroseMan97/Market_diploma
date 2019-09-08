class ClientViewModel {
  String _id;
  String _name;
  String _surname;
  String _email;
  String _phone;

  ClientViewModel(
      this._id, this._name, this._surname, this._email, this._phone) {
    ArgumentError.checkNotNull(_id);
    ArgumentError.checkNotNull(_name);
    ArgumentError.checkNotNull(_surname);
    ArgumentError.checkNotNull(_email);
    ArgumentError.checkNotNull(_phone);
  }

  String get getID => _id;
  String get getName => _name;
  String get getSurname => _surname;
  String get getEmail => _email;
  String get getPhone => _phone;
}
