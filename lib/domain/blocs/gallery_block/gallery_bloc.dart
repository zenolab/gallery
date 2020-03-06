import 'dart:async';
import 'bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:online_gallery/data/repository/gallery_repository.dart';
import 'package:online_gallery/domain/repository/repository.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  BaseRepository photoRepository = MainPhotoRepository();

  GalleryBloc();

  @override
  GalleryState get initialState => InitialGalleryState();

  @override
  Stream<GalleryState> transformEvents(
    Stream<GalleryEvent> events,
    Stream<GalleryState> Function(GalleryEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<GalleryEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<GalleryState> mapEventToState(
    GalleryEvent event,
  ) async* {
    final currentState = state;
    if (event is FetchEvent) {
      try {
        if (currentState is InitialGalleryState) {
          final photos = await photoRepository.getData();
          yield GalleryLoaded(photos);
        } else if (currentState is GalleryLoaded) {
          final photos = await photoRepository.getData();
          yield photos.isEmpty
              ? currentState.copyWith(photos)
              : GalleryLoaded(currentState.photos + photos);
        }
      } catch (error, stacktrace) {
        yield GalleryError();
        print(error);
        print(stacktrace);
      }
    }
  }
}
