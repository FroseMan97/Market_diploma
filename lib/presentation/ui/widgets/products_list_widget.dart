import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:market/presentation/ui/pages/detail_product_page.dart';
import 'package:market/presentation/ui/widgets/small_info_product_widget.dart';
import 'package:market/presentation/viewmodel/product_viewmodel.dart';

class ProductsListWidget extends StatelessWidget {
  final List<ProductViewModel> items;

  final List<DropdownMenuItem> _sorting = [
    DropdownMenuItem(
      child: Text('По возрастанию'),
    ),
    DropdownMenuItem(
      child: Text('По убыванию'),
    )
  ];

  ProductsListWidget(this.items, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _showWidgetWithData(items, context),
    );
  }

  _showWidgetWithData(List<ProductViewModel> items, BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DropdownButton(
              items: _sorting,
              onChanged: (it) {},
            ),
          ],
        ),
        StaggeredGridView.countBuilder(
          primary: false,
          shrinkWrap: true,
          itemCount: items.length,
          crossAxisCount: 4,
          itemBuilder: (context, i) {
            ProductViewModel item = items[i];
            return Container(
              child: InkWell(
                onTap: () {
                  _navigateToDetailProductPage(
                      item.getName, item.getProductID, context);
                },
                child: SmallInfoProductWidget(
                    item.getName, item.getPrice, item.getImagesURL[0]),
              ),
            );
          },
          staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
        ),
      ],
    );
  }

  void _navigateToDetailProductPage(
      String name, String productID, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailProductPage(name, productID)),
    );
  }
}
