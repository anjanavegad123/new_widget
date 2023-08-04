import '../Repo(Repository )/api_routes.dart';
import '../api_handlers.dart';
import 'LoginResponseModel.dart';

class PostLoginRepo {
  static Future<LoginResponseModel> postLoginRepo(
      String email, String password) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: ApiRoutes.login,
      body: {
        "email": email,
        "password": password,
      },
    );

    LoginResponseModel? loginResponseModel =
        LoginResponseModel.fromJson(response);

    return loginResponseModel;
  }
}

// class PostLoginRepo {
//   static Future<LoginResponseModel> postLoginRepo() async {
//     var response = await ApiService().getResponse(
//       apiType: APIType.aPost,
//       url: ApiRoutes.login,
//       body: {
//         "email": "amangupta2404@gmail.com",
//         "password": "123456789",
//       },
//     );
//
//     LoginResponseModel? loginResponseModel =
//         LoginResponseModel.fromJson(response);
//
//     return loginResponseModel;
//   }
// }
