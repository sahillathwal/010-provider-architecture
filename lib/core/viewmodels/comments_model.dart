import 'package:provider_architecture/core/enums/viewstate.dart';
import 'package:provider_architecture/core/models/comment.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class CommentsModel extends BaseModel {
  final Api _api = locator<Api>();
  List<Comment>? comments;
  Future fetchComments(int postId) async {
    setState(ViewState.busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.idle);
  }
}
