import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/widgets/circular_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_coding_challenge/theme_constants.dart' as theme;

class ListArticleWidget extends StatelessWidget {
  const ListArticleWidget({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.author,
    required this.publishedDate,
  }) : super(key: key);

  final String thumbnail;
  final String title;
  final String author;
  final String publishedDate;

  @override
  Widget build(BuildContext context) {
    // * This is the component used in the articles list for better reusability
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularNetworkImage(
          url: thumbnail,
          diameter: 45.r,
        ),
        theme.sbW10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.articleListTitleTheme,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              theme.sbH10,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      author,
                      style: theme.articleListAuthorTheme,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14.sp,
                        color: Colors.grey[500],
                      ),
                      theme.sbW5,
                      Text(
                        publishedDate,
                        style: theme.articleListAuthorTheme,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        theme.sbW10,
        theme.chevronForwardGreyIcon,
      ],
    );
  }
}
