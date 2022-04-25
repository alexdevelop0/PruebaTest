
import 'package:pruebaTest/data/models/RestaurantModel.dart';
import 'package:pruebaTest/data/models/UserModel2.dart';
import 'package:meta/meta.dart';


@immutable
class PostsStateHome {
  final bool isError;
  final bool isLoading;

  final ModelActivityUser dataUserList;
 final ModelRestaurant modelRestaurant;
 final String search;

  // final List<modelFavorites> posts;

  PostsStateHome({

    this.isError,

    this.isLoading,

    this.dataUserList,
    this.modelRestaurant,
    this.search,
    

    //this.posts,
  });

  factory PostsStateHome.initial() => PostsStateHome(
        isLoading: false,
        isError: false,


    dataUserList: null,
    modelRestaurant: null,
    search: "Barranquilla",

      );

  PostsStateHome copyWith({
    @required bool isError,

    @required bool isLoading,

    @required ModelActivityUser dataUserList,
    @required  ModelRestaurant modelRestaurant,
    @required String search,

  }) {
    return PostsStateHome(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,


      dataUserList: dataUserList ?? this.dataUserList,
      modelRestaurant: modelRestaurant ?? this.modelRestaurant,
      search: search ?? this.search,

    );
  }
}
