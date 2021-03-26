import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_stock/src/models/post.dart';
import 'package:my_stock/src/services/network.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial());


  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is PostFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostInitial) {
          final posts = await _fetchPosts(0, 20);
          yield PostSuccess(posts: posts, hasReachedMax: false);
          return;
        }
        if (currentState is PostSuccess) {
          final posts =
          await _fetchPosts(currentState.posts.length, 20);
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostSuccess(
            posts: currentState.posts + posts,
            hasReachedMax: false,
          );
        }
      } catch (_) {
        yield PostFailure();
      }
    }
  }

  bool _hasReachedMax(PostState state) =>
      state is PostSuccess && state.hasReachedMax;

  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {
    final response = await NetworkService().fetchPosts(startIndex, limit: limit);
    return response;
  }
}