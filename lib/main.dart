import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/viewmodels/article_list_view_model.dart';
import 'package:flutter_coding_challenge/views/article_list_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NY Times News',
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        designSize: const Size(393, 760),
        builder: () => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ArticleListViewModel())
          ],
          child: const ArticleListView(),
        ),
      ),
    );
  }
}
