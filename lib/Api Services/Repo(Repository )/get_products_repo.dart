import '../Repo1ExampleUsingAnotherApiPostman/LoginResponseModel.dart';
import '../../Model/Response/product_response_model1.dart';
import 'package:http/http.dart' as http;
import '../api_handlers.dart';
import 'api_routes.dart';

class GetProductRepo {
  static Future<ProductResponseModel> getProductRepo() async {
    ProductResponseModel? productResponseModel;
    http.Response response = await http.get(Uri.parse(
        ApiRoutes.getProducts)); //ApiRoutes thi product pass karvanu che

    if (response.statusCode == 200) {
      productResponseModel = productResponseModelFromJson(response.body);

      print("RESPONSE : ${response.body}");
    } else {
      print("STATUS CODE : ${response.statusCode}");
    }
    return productResponseModel!;
  }
  //here we can create muliple method like we can create upadte,delete,insert method in one class
}
// class GetProductRepo {
//   static Future<ProductResponseModel> getProductRepo() async {
//     var response = await ApiService()
//         .getResponse(apiType: APIType.aGet, url: ApiRoutes.getProducts);
//
//     ProductResponseModel productResponseModel =
//         ProductResponseModel.fromJson(response);
//     return productResponseModel;
//   }
// }
