import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application/core/strings_manager.dart';
import 'package:news_application/data/models/article_response/Article.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';


class ArticleItem extends StatelessWidget {
  ArticleItem({super.key, required this.article});

  final Article article;


  @override
  Widget build(BuildContext context) {
    final fifteenAgo = DateTime.parse(article.publishedAt ?? "");
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                alignment: Alignment.bottomCenter,
                insetPadding: REdgeInsets.all(16),
                contentPadding: REdgeInsets.all(8),
                backgroundColor: Theme
                    .of(context)
                    .colorScheme
                    .primary,
                content: Container(
                  width: ScreenUtil().screenWidth,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            imageUrl: article.urlToImage ??
                                "https://www.vuelio.com/uk/wp-content/uploads/2019/02/Breaking-News-700x400.jpg",
                            height: 220.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                Center(
                                    child: CircularProgressIndicator(
                                      color: Theme
                                          .of(context)
                                          .colorScheme
                                          .primary,
                                    )),
                            errorWidget: (context, url, error) =>
                                Icon(
                                  Icons.error_sharp,
                                  size: 40.sp,
                                ),
                          )),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        article.description ?? StringsManager.someNews.tr(),
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .secondary,
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r)),
                            padding: REdgeInsets.all(16),
                            backgroundColor:
                            Theme
                                .of(context)
                                .colorScheme
                                .secondary,
                          ),
                          onPressed: () async {
                            //assignment
                            await  _launchUrl();

                          },
                          child: Text(
                            StringsManager.viewAll.tr(),
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
        );
      },
      child: Container(
        padding: REdgeInsets.all(8),
        margin: REdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary, width: 2.w),
            borderRadius: BorderRadius.circular(16),
            color: Theme
                .of(context)
                .colorScheme
                .secondary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ??
                      "https://www.vuelio.com/uk/wp-content/uploads/2019/02/Breaking-News-700x400.jpg",
                  height: 220.h,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (context, url) =>
                      Center(
                          child: CircularProgressIndicator(
                            color: Theme
                                .of(context)
                                .colorScheme
                                .primary,
                          )),
                  errorWidget: (context, url, error) =>
                      Icon(
                        Icons.error_sharp,
                        size: 40.sp,
                      ),
                )),
            SizedBox(
              height: 10.h,
            ),
            Text(
              article.title ?? StringsManager.someNews.tr(),
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    "By: ${article.author ?? ""}",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    textAlign: TextAlign.end,
                    // DateTime
                    //     .now()
                    //     .difference(fifteenAgo)
                    //     .inDays < 2?
                         timeago.format(fifteenAgo,
                        locale: context.locale.languageCode),
                        // : article.publishedAt ?? "",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(article.url??""),mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch ${article.url}');
    }
}}