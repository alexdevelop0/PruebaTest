import 'package:pruebaTest/redux2/settingApp/settingsHomeActions.dart';
import 'package:pruebaTest/redux2/settingApp/settingsHomeState.dart';


postsReducerHome(PostsStateHome prevState, SetPostsStateActionHome action) {
  final payload = action.postsState;
  return prevState.copyWith(
    isError: payload.isError,
    isLoading: payload.isLoading,
   
    dataUserList: payload.dataUserList,
    modelRestaurant: payload.modelRestaurant,
    search: payload.search,


    // posts: payload.posts,
  );
}
