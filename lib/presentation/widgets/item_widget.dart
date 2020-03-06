import 'package:flutter/material.dart';
import 'package:online_gallery/domain/models/photo.dart';
import 'package:online_gallery/presentation/pages/detail_page.dart';

Widget buildItem(BuildContext context,Photo photo) {
  return new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            leading: FadeInImage.assetNetwork(
              placeholder: 'assets/placeholder.png',
              image: photo.urls.regular,
              fit: BoxFit.cover,
              width: 100,
            ),
            title: Text(
              photo.user.name, style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(photo.user.username,
                style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
            onTap: () {
              _onItem(context,photo);
            },
          )
        ],
      ));
}


Widget buildItem2(BuildContext context,Photo photo) {
  double itemWidth = MediaQuery.of(context).size.width;
  double itemHeight = itemWidth / (photo.width / photo.height);
  return Container(
    width: 300,
    height: 300,
    child: InkWell(
      onTap: () {
        _onItem(context,photo);
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          FadeInImage.assetNetwork(
            placeholder: 'assets/placeholder.png',
            image: photo.urls.regular,
            fit: BoxFit.fitWidth,
            width: itemWidth ,
            height: itemHeight,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text("Name ${photo.user.name}", style: TextStyle(fontSize: 28,color: Colors.white),),
                Text("User ${photo.user.username}", style: TextStyle(fontSize: 22,color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    ),
  );
}


Widget buildItem3(BuildContext context,Photo photo) {
  double itemWidth = MediaQuery.of(context).size.width;
  double itemHeight = itemWidth / (photo.width / photo.height);
  return InkWell(
    onTap: () {
      _onItem(context,photo);
    },
    child: FadeInImage.assetNetwork(
      placeholder: 'assets/placeholder.png',
      image: photo.urls.regular,
      fit: BoxFit.fitWidth,
      width: itemWidth,
      height: itemHeight,
    ),
  );
}


_onItem(BuildContext context,Photo photo) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailsPage(),
      settings: RouteSettings(
        arguments: DetailPage(photo),
      ),
    ),
  );
}