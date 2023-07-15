import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_fun/models/feed_response.dart';
import 'package:video_fun/videos/repository/creators_repository.dart';

class FeedBloc {
  final CreatorRepository _repository = CreatorRepository();
  final BehaviorSubject<FeedResponse> _subject =
      BehaviorSubject<FeedResponse>();

  getFeeds() async {
    FeedResponse response = await _repository.getFeeds();
    _subject.sink.add(response);
  }

  drainStream() {
    _subject.value = FeedResponse([], "");
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<FeedResponse> get subject => _subject;
}

final feedBloc = FeedBloc();
