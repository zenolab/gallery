import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_gallery/domain/models/photo.dart';

class DetailPage {
  final Photo photo;

  DetailPage(this.photo);
}

class DetailsPage extends StatelessWidget {
  static final routeName = "details";

  @override
  Widget build(BuildContext context) {
    DetailPage args = ModalRoute.of(context).settings.arguments;
    return DetailWidget(
      photoListBean: args.photo,
    );
  }
}

class DetailWidget extends StatefulWidget {
  final Photo photoListBean;

  const DetailWidget({Key key, this.photoListBean}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DetailWidgetState();
  }
}

class DetailWidgetState extends State<DetailWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.photoListBean.urls.regular,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
}
