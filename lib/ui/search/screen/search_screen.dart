import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_application/core/compontes/EmptyNotificationsScreen.dart';
import 'package:news_application/core/strings_manager.dart';
import 'package:news_application/ui/search/screen/search_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../news_list/widget/article_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
static const String routeName="SearchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {
  final _scrollController = ScrollController();

  final TextEditingController _searchControllerText = TextEditingController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

  }
  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<SearchViewModel>().getArticle(
        _searchControllerText.text,
        loadMore: true,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchControllerText.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return

       Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                leading: SizedBox.shrink(),
                leadingWidth: 0,
                floating: true,
                toolbarHeight: 96.h,

                centerTitle: false,
                title: TextField(
                  controller: _searchControllerText,

                    onSubmitted: (value) async {

          if (value.isEmpty) return;
          context.read<SearchViewModel>().getArticle(value);                    },
                    decoration: InputDecoration(

                      contentPadding: REdgeInsets.all(16),
                      hintText: StringsManager.search.tr(),
                      prefixIcon: InkWell(
                          onTap: () {

                          },
                          child: Icon(Icons.search,size: 30.r,)),
                      // suffixIconConstraints: BoxConstraints.loose(Size.fromHeight(18.h)),
                      suffixIcon:InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.close,color: Theme.of(context).colorScheme.primary ,size: 30.r,)),
                      hintStyle: Theme.of(context).appBarTheme.titleTextStyle,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(width: 2.w,color: Theme.of(context).colorScheme.primary)
                    )

                    ,disabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(width: 2,color: Theme.of(context).colorScheme.primary)
                    ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(width: 2.w,color: Theme.of(context).colorScheme.primary)
                      ),
                    ),

                ),
              ),
              BlocBuilder<SearchViewModel,SearchState>(builder: (context, state) {
                if(state is LoadingSearchState){

                  return SliverFillRemaining(
                    child: Center(
                      child: LoadingAnimationWidget.inkDrop(
                        color: Colors.blueAccent,
                        size: 100.r,
                      ),
                    ),
                  );
                }
                else if(state is ErrorSearchState){
                  return SliverFillRemaining(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.errorMessage.tr()),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(StringsManager.goToHome.tr()),
                        ),
                      ],
                    ),
                  );
                  // return Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //
                  //   children: [
                  //     Text(
                  //       state.errorMassage.toString().tr(),
                  //       style: Theme
                  //           .of(context)
                  //           .textTheme
                  //           .labelLarge,
                  //     ),
                  //     ElevatedButton(
                  //         onPressed: () {
                  //         context  .read<SearchViewModel>()
                  //               .getArticle(_searchController.text);
                  //         }, child: Text(StringsManager.tryAgain.tr()))
                  //   ],
                  // );

                }
                else if(state is EmptySearchState){
                return  EmptyNotificationsScreen(
                    onTab: (){

                    },
                  );
                }
                else if(state is SuccessSearchState) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        if (index < state.article.length) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: ArticleItem(article: state.article[index]),
                          );
                        }
                        return state.hasMore
                            ? SizedBox(
                          width: 200.0.w,
                          height: 100.0.h,
                          child:
                          Shimmer.fromColors(
                            baseColor: Colors.red,
                            highlightColor: Colors.yellow,
                            child: Text(

                              'Loading',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ),
                        )


                            : Padding(
                          padding: EdgeInsets.all(16.r),
                          child: Center(
                            child: Text(StringsManager.noArticleFound.tr()
                              ,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: state.article.length + 1,
                    ),
                  );

                  // return ListView.separated(
                  //     itemBuilder: (context, index) => ArticleItem(
                  //       article:state.article[index] ,
                  //     ),
                  //     separatorBuilder: (context, index) => Gap(15.h),
                  //     itemCount: state.article.length
                  // );

                }

                return SliverFillRemaining(
                  child: EmptyNotificationsScreen(
                    onTab: (){

                    },
                  ),
                );

              },
                            )
            ],
          ),
        ),

    );
  }

}
