import 'package:provider_architecture/core/enums/viewstate.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class HomeModel extends BaseModel {
  final Api _api = locator<Api>();
  List<Post>? posts;
  Future getPosts(int userId) async {
    setState(ViewState.busy);
    print('Getting posts for user $userId');
    posts = await _api.getPostsForUser(userId);
    if (posts!.isEmpty) {
      print('No posts found for user $userId');
    }
    print('Posts found for user $userId: ${posts!.length}');
    setState(ViewState.idle);
  }
}
