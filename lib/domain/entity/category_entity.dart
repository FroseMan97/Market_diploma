class CategoryEntity {
  String _categoryID;
  String _name;

  CategoryEntity(this._categoryID, this._name);

  String get getCategoryID => _categoryID;
  String get getName => _name;
}
