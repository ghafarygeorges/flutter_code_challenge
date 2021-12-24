import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/viewmodels/article_view_model.dart';
import 'package:flutter_coding_challenge/theme_constants.dart' as theme;
import 'package:flutter_coding_challenge/widgets/regular_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleDetailsView extends StatelessWidget {
  const ArticleDetailsView({Key? key, required this.articleViewModel})
      : super(key: key);

  final ArticleViewModel articleViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NY Times Most Popular",
          style: theme.appBarTitleTheme,
        ),
        backgroundColor: theme.appBarBgColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: ListView(
          children: [
            theme.sbH20,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * Title Widget
                  Text(
                    articleViewModel.title,
                    style: theme.articleDetailsTitleTheme,
                  ),
                  theme.sbH20,
                  // * Abstract Widget
                  Text(
                    articleViewModel.abstract,
                    style: theme.articleDetailsAbstractTheme,
                  ),
                  theme.sbH20,
                  // * Author Widget
                  Text(
                    articleViewModel.author,
                    style: theme.articleDetailsAuthorTheme,
                  ),
                  theme.sbH5,
                  // * Row for Date and Section Widgets
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        articleViewModel.publishedDate,
                        style: theme.articleDetailsAuthorTheme,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: theme.appBarBgColor,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 5.h,
                          ),
                          child: Text(
                            articleViewModel.section,
                            style: theme.articleDetailsSectionTheme,
                          ),
                        ),
                      ),
                    ],
                  ),
                  theme.sbH10,
                ],
              ),
            ),
            // * Article Details Image Widget
            RegularNetworkImage(
              height: 200.h,
              width: theme.screenWidth(context),
              url: articleViewModel.image,
              curved: true,
            ),
            theme.sbH20,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              // * API isn't returning the content of the article, used this as placeholder
              child: Text(
                """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at suscipit justo. Donec et finibus felis. In hac habitasse platea dictumst. Curabitur a lectus a quam posuere consequat a eu orci. Donec sit amet vulputate metus, sit amet interdum metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam vitae sem consequat, rhoncus massa vel, fringilla lacus. Nam dapibus efficitur tellus ac vestibulum. Mauris dapibus dolor nunc. Mauris id mi mattis, egestas elit sit amet, venenatis mi.

Etiam mollis facilisis eleifend. Etiam rutrum, metus id aliquam tincidunt, elit diam pellentesque mauris, quis viverra nibh ex id nibh. Aenean pharetra vehicula nisl, quis auctor quam. Phasellus volutpat nibh quis nisl molestie consequat. Donec in semper lacus, vel iaculis orci. In bibendum risus vitae mauris pellentesque ornare. Donec vitae tortor eu eros pretium congue. Aenean venenatis aliquam sapien, in ornare ligula pulvinar eu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Duis lobortis nisi sed urna lacinia molestie. Maecenas consectetur porta tortor, non lacinia lorem dapibus ac. Nunc ac libero at libero finibus elementum id nec lectus. Cras porta pulvinar orci, vitae hendrerit magna vestibulum et. Nullam turpis diam, condimentum ut orci eget, cursus imperdiet leo. Integer tempus ligula id magna convallis laoreet. Proin luctus dapibus nibh, eleifend varius velit fermentum iaculis.

Nam mollis blandit enim in blandit. Proin scelerisque, eros quis facilisis viverra, ipsum enim mollis turpis, sed viverra nisi mauris et felis. Sed sodales ante a lacus tempor, consequat mollis leo interdum. Donec ullamcorper, arcu sit amet eleifend dictum, eros ante euismod nisi, et faucibus metus nibh nec velit. Aenean pharetra sem pulvinar, ornare augue non, semper mauris. Proin sagittis ligula ex, a tempus felis tempus id. Phasellus vel erat neque. Nunc suscipit et est id ultricies. Donec et nulla vitae sapien pharetra lobortis. Cras vitae est at lectus iaculis pretium. Vivamus aliquam ex vel libero accumsan facilisis. Ut lectus nisi, vehicula sit amet mi vel, ultrices venenatis massa. Nullam vitae mattis neque. Morbi eu mi sed risus varius hendrerit eu non quam. Quisque eu finibus nisi.

Praesent dui risus, lobortis quis vehicula nec, sodales vitae nulla. Suspendisse faucibus congue nisl, quis faucibus elit. Suspendisse gravida sem ipsum, et sollicitudin neque efficitur eget. Integer dui elit, porta non nunc non, placerat scelerisque elit. Sed nec tincidunt odio. Maecenas rutrum accumsan ultrices. Pellentesque neque turpis, porta a leo sed, tristique vulputate ligula. Sed sit amet feugiat sem.

Etiam pharetra justo mi, varius varius ante auctor vitae. In hac habitasse platea dictumst. Etiam lectus nunc, sollicitudin a nisl ac, congue fringilla massa. Suspendisse lobortis mi quis mauris scelerisque faucibus. Aenean aliquam mollis lectus et mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur nisi tellus, luctus sit amet pretium eu, feugiat id purus.
            
            """,
                style: theme.articleDetailsContentTheme,
              ),
            ),
            theme.sbH20,
          ],
        ),
      ),
    );
  }
}
