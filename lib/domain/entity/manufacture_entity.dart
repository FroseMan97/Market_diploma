class ManufactureEntity{
  String manufactureID;
  String name;
  String address;

  ManufactureEntity(this.manufactureID,this.name,this.address);

  @override
  String toString() {
    return 'ID производителя: $manufactureID | Название: $name | Адрес: $address';
  }
}