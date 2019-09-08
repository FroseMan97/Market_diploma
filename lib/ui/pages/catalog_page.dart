import 'package:flutter/material.dart';
import 'package:market/bloc/catalog_bloc.dart';
import 'package:market/bloc/mapper/category_viewmodel_mapper.dart';
import 'package:market/bloc/viewmodel/category_viewmodel.dart';
import 'package:market/data/datasource/fake_category_datasource_impl.dart';
import 'package:market/data/mapper/category_mapper.dart';
import 'package:market/data/repository/category_repository.dart';
import 'package:market/datasource/category_datasource.dart';
import 'package:market/domain/repository/category_repository.dart';
import 'package:market/domain/usecase/get_categories_usecase.dart';
import 'package:market/ui/pages/base_page.dart';

class CatalogPage extends BasePage {
  final String title;
  CatalogPage(this.title, {Key key}) : super(title, key: key);
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  CatalogBloc _catalogBloc;

  @override
  void initState() {
    CategoryDatasource _categoryDatasource = FakeCategoryDatasourceImpl();
    CategoryMapper _categoryMapper = CategoryMapper();
    CategoryRepository _categoryRepository =
        CategoryRepositoryImpl(_categoryDatasource, _categoryMapper);
    GetCategoriesUsecase _getCategoriesUsecase =
        GetCategoriesUsecase(_categoryRepository);
    CategoryViewModelMapper _categoryViewModelMapper =
        CategoryViewModelMapper();
    _catalogBloc = CatalogBloc(_getCategoriesUsecase, _categoryViewModelMapper);
    _catalogBloc.fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: StreamBuilder<List<CategoryViewModel>>(
            stream: _catalogBloc.getCategories,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _showData(snapshot.data);
              } else if (snapshot.hasError) {}
              return Center(child: CircularProgressIndicator());
            }));
  }

  _showData(List<CategoryViewModel> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, i) {
        var item = data[i];
        return ListTile(
          title: Text(item.getName),
          trailing: CircleAvatar(
            backgroundImage: NetworkImage(item.getImageURL),
          ),
        );
      },
    );
  }
}
