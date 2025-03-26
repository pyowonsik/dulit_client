import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dulit_client/post/model/post_model.dart';

final postProvider = StateNotifierProvider<PostNotifier, PostState>((ref) {
  return PostNotifier();
});

class PostState {
  final List<PostModel> posts;

  PostState({required this.posts});
}

class PostNotifier extends StateNotifier<PostState> {
  PostNotifier() : super(PostState(posts: []));

  // PostModel 추가
  void addPost(PostModel post) {
    // state = PostState(
    //   posts: [...state.posts, post],
    // );
  }

  // PostModel 삭제
  void removePost(int post) {
    // state = PostState(
    //   posts: state.posts.where((post) => Post.id != id).toList(),
    // );
  }

  // PostModel 업데이트
  void updatePost(PostModel post) {
    // state = PostState(
    //   posts: state.posts.map((e) => e.id == Post.id ? Post : e).toList(),
    // );
  }

  // 페이지 변경
  void updatePage(int page) {
    // state = PostState(
    //   posts: state.posts,
    // );
  }
}
