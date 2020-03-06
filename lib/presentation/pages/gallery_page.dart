import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_gallery/domain/blocs/gallery_block/bloc.dart';
import 'package:online_gallery/domain/models/photo.dart';
import 'package:online_gallery/presentation/widgets/item_widget.dart';
import 'package:online_gallery/presentation/widgets/progress_loader.dart';

import 'detail_page.dart';

class HomePage extends StatelessWidget {
  static final routeName = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gallery"),
        ),
        body: GalleryWidget());
  }
}

class GalleryWidget extends StatelessWidget {
  const GalleryWidget() : super();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: _GalleryWidget(),
      create: (context) => GalleryBloc(),
    );
  }
}

class _GalleryWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<_GalleryWidget> {
  GalleryBloc _bloc;
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    _bloc = BlocProvider.of<GalleryBloc>(context);
    _bloc.add(FetchEvent());
    super.initState();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _bloc.add(FetchEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryBloc, GalleryState>(
      builder: (buildContext, state) {
        if (state is GalleryError)
          return Center(
            child: Text("Error"),
          );
        if (state is InitialGalleryState)
          return Center(
            child: CircularProgressIndicator(),
          );
        if (state is GalleryLoaded) {
          return ListView.builder(
              itemCount: state.photos.length,
              controller: _scrollController,
              itemBuilder: (buildContext, index) {
                if (index >= state.photos.length) return ProgressLoader();
                Photo photo = state.photos[index];
                return buildItem(context, photo);
              });
        }
        return Center(child: Text("Empty"));
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
