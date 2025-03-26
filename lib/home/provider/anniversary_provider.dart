import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dulit_client/home/model/anniversary_model.dart';

final anniversaryProvider =
    StateNotifierProvider<AnniversaryNotifier, AnniversaryState>((ref) {
  return AnniversaryNotifier();
});

class AnniversaryState {
  final List<AnniversaryModel> anniversaries;
  final int currentPage;

  AnniversaryState({required this.anniversaries, required this.currentPage});
}

class AnniversaryNotifier extends StateNotifier<AnniversaryState> {
  AnniversaryNotifier()
      : super(AnniversaryState(anniversaries: [], currentPage: 1));

  // AnniversaryModel 추가
  void addAnniversary(AnniversaryModel anniversary) {
    state = AnniversaryState(
      anniversaries: [...state.anniversaries, anniversary],
      currentPage: state.currentPage,
    );
  }

  // AnniversaryModel 삭제
  void removeAnniversary(int id) {
    state = AnniversaryState(
      anniversaries: state.anniversaries
          .where((anniversary) => anniversary.id != id)
          .toList(),
      currentPage: state.currentPage,
    );
  }

  // AnniversaryModel 업데이트
  void updateAnniversary(AnniversaryModel anniversary) {
    state = AnniversaryState(
      anniversaries: state.anniversaries
          .map((e) => e.id == anniversary.id ? anniversary : e)
          .toList(),
      currentPage: state.currentPage,
    );
  }

  // 페이지 변경
  void updatePage(int page) {
    state = AnniversaryState(
      anniversaries: state.anniversaries,
      currentPage: page,
    );
  }
}
