import 'package:provider_architecture/core/enums/viewstate.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/services/posts_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class HomeModel extends BaseModel {
  final PostsService _postsService = locator<PostsService>();

  List<Post> get posts => _postsService.posts;
  Future getPosts(int userId) async {
    setState(ViewState.busy);
    await _postsService.getPostsForUser(userId);
    setState(ViewState.idle);
  }
}
