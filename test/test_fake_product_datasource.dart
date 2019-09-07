import 'package:market/data/datasource/fake_product_datasource_impl.dart';
import 'package:market/data/models/product_model.dart';
import 'package:market/datasource/product_datasource.dart';

void main()async{
  ProductDatasource productDatasource = FakeProductDatasourceImpl();
  ProductModel productByProductID = await productDatasource.getProductByID('productID12');
  List<ProductModel> productByCategoryID = await productDatasource.getProductsByCategoryID('categoryID1');
  print(productByProductID);
  print(productByCategoryID);
}