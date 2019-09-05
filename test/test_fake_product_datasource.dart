import 'package:market/data/datasource/fake_product_datasource_impl.dart';
import 'package:market/data/models/product_model.dart';
import 'package:market/datasource/fake_product_datasource.dart';

void main()async{
  FakeProductDatasource fakeProductDatasource = FakeProductDatasourceImpl();
  ProductModel productByProductID = await fakeProductDatasource.getProductByID('productID1');
  List<ProductModel> productByCategoryID = await fakeProductDatasource.getProductsByCategoryID('categoryID1');
  print(productByProductID);
  print(productByCategoryID);
}