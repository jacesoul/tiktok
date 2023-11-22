import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/features/videos/models/playback_config_model.dart';
import 'package:tiktok/features/videos/repos/playback_config_repo.dart';

class PlayBackConfigViewModel extends Notifier<PlayBackConfigModel> {
  final PlaybackConfigRepository _repository;

  PlayBackConfigViewModel(this._repository);

  void setMuted(bool value) {
    _repository.setMuted(value);
    state = PlayBackConfigModel(
      muted: value,
      autoplay: state.autoplay,
    );
  }

  void setAutoplay(bool value) {
    _repository.setAutoplay(value);
    state = PlayBackConfigModel(
      muted: state.muted,
      autoplay: value,
    );
  }

  // build 메소드에서 state 초기 데이터를 반환한다.
  @override
  PlayBackConfigModel build() {
    return PlayBackConfigModel(
      muted: _repository.isMuted(),
      autoplay: _repository.isAutoplay(),
    );
  }
}

final playbackConfigProvider =
    NotifierProvider<PlayBackConfigViewModel, PlayBackConfigModel>(
  () => throw UnimplementedError(),
);
