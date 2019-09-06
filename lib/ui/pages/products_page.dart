import 'package:flutter/material.dart';
import 'package:market/ui/widgets/small_info_product_widget.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final String _title = 'Маркет';
  final int _crossAxisCount = 2;

  final List<DropdownMenuItem> _categories = [
    DropdownMenuItem(
      child: Text('Одежда'),
    ),
  ];

  final List<DropdownMenuItem> _sorting = [
    DropdownMenuItem(
      child: Text('По возрастанию'),
    ),
    DropdownMenuItem(
      child: Text('По убыванию'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: _buildBody(),
    );
  }

  _buildBody() {
    return Center(
      child: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _showWidgetWithData();
          } else if (snapshot.hasError) {
            return _showWidgetWithError("poka tak");
          }
          return _showWidgetWithLoading();
        },
      ),
    );
  }

  _showWidgetWithLoading() {
    return CircularProgressIndicator();
  }

  _showWidgetWithError(String error) {
    return Text(error);
  }

  _showWidgetWithData() {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              DropdownButton(
                items: _categories,
                onChanged: (it) {},
              ),
              DropdownButton(
                items: _sorting,
                onChanged: (it) {},
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {},
                  child: SmallInfoProductWidget(
                      "Дутая куртка",
                      "Tommy Hilfiger",
                      "Томас Джейкоб Хилфигер основал свой одноименный бренд Tommy Hilfiger в 1985 году, включив в его ассортимент одежду, аксессуары, дорожные сумки и духи. ",
                      14320,
                      'http://images.jacketmen.org/men-premium-heavyweight-micro-fleece-puffer-hooded.jpg'));
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount,
                childAspectRatio: MediaQuery.of(context).size.width /
                    MediaQuery.of(context).size.height *
                    1.3),
          ),
        ),
      ],
    );
  }
}
