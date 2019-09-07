import 'package:flutter/material.dart';
import 'package:market/ui/pages/base_page.dart';

class ProfilePage extends BasePage {
  final String title;
  ProfilePage(this.title, {Key key}) : super(title, key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return _showUIAuthorizedUser();
          }
        }
        return _showUIUnAuthorizedUser();
      },
    );
  }

  _showUIUnAuthorizedUser() {
    return Center(
      child: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.supervised_user_circle,
              size: 100,
              ),
               SizedBox(
              height: 20,
            ),
            Text(
              'Заходите',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Посмотреть заказы и\nобновить данные',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              minWidth: 250,
              child: Text(
                'Войти',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
              onPressed: () {},
            ),
            MaterialButton(
              minWidth: 250,
              child: Text(
                'Регистрация',
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.white,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  _showUIAuthorizedUser() {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        CircleAvatar(
          minRadius: 40,
          backgroundColor: Colors.black,
          child: Text('S L'),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Здравствуйте,',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Sergey Lazarev',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(
          height: 30,
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.event_note),
          title: Text('Мои заказы'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(color: Colors.black),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.account_box),
          title: Text('Моя информация'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.home),
          title: Text('Адресная книга'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(color: Colors.black),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.exit_to_app),
          title: Text(
            'Выйти',
            style: TextStyle(color: Colors.red),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
