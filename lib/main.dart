import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_widget/Animation/animated_container.dart';
import 'package:new_widget/LocalStorage1Example/home_page.dart';
import 'package:new_widget/reoderable_list.dart';
import 'package:new_widget/search_topic_in_textfield.dart';
import 'package:new_widget/sliver_app_bar.dart';
import 'package:new_widget/time_picker.dart';
import 'package:provider/provider.dart';

import 'Animation/animated_align.dart';
import 'Animation/animated_opacity.dart';
import 'Animation/animated_padding.dart';
import 'Animation/animated_rotation.dart';
import 'Animation/explicit_alignment_tween.dart';
import 'Animation/explicit_animation.dart';
import 'Animation/explicit_border_tween.dart';
import 'Animation/explicit_borderradius_tween.dart';
import 'Animation/explicit_curve_tween.dart';
import 'Animation/explicit_decoration_tween.dart';
import 'Animation/explicit_textstyle_tween.dart';
import 'Api Services/Repo1ExampleUsingAnotherApiPostman/logindemo.dart';
import 'Api Services/Repo(Repository )/get_api_repo.dart';
import 'Api/Without_futureBuilder_search_product.dart';
import 'Api/withoutfuturebuilderexmple.dart';
import 'Api/get_api_demo.dart';
import 'Api/1product_api_example1.dart';
import 'Api/2all_categories.dart';
import 'ApiExample/delete_api.dart';
import 'ApiExample/patch_api.dart';
import 'ApiExample/post_api.dart';
import 'ApiExample/post_api_using_list.dart';
import 'ApiExample/put_api.dart';
import 'CStateManagementGetx/demo_counter.dart';
import 'DataProvider/counter_provider.dart';
import 'DataProvider/home_screen.dart';
import 'Database/demo_database.dart';
import 'Future_Builder/future.dart';
import 'Api/product_api_example.dart';
import 'LocalStorage/demo_storage.dart';
import 'LocalStorage/login_page.dart';
import 'LocalStorage/register_page.dart';
import 'LocalStorage1Example/login_page.dart';
import 'LocalStorage1Example/register_page.dart';
import 'Model/Response/categories_api_response.dart';
import 'Model/Response/get_api_response.dart';
import 'Model/Response/product_get_api_response1.dart';
import 'RazorPay/razorpay_demo.dart';
import 'Stream_Builder/stream_builder.dart';
import 'Stream_Builder/stream_builder_example.dart';
import 'Stream_Builder/stream_builder_example11.dart';
import 'alert_box.dart';
import 'bottom_tab_bar.dart';
import 'constrained_Box.dart';
import 'data_table.dart';
import 'date_picker.dart';
import 'date_range_picker.dart';
import 'dismissible.dart';
import 'draggable_scrollable_sheet.dart';
//import 'Future_Stream/future.dart';
import 'image_filtered.dart';

import 'Animation/implicit_animation.dart';
import 'listwheel_scrollview.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final box = GetStorage();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CounterProvider>(
            create: (_) => CounterProvider(),
          )
        ],
        child: GetMaterialApp(
          title: 'Flutter Demo',
          // home: box.read('uname') == null ? RegisterPage1() : HomePage1(),
          home: WithoutFutureBuilderSearchProduct(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
