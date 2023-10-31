import 'package:cleannewsapp/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc_bloc.dart';
import 'package:cleannewsapp/features/daily_news/presentation/pages/article_details/article_detail.dart';
import 'package:cleannewsapp/features/daily_news/presentation/pages/saved_artcile.dart/saved_article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    const GetArticle();
    return Scaffold(floatingActionButton: FloatingActionButton(child: const Text('offline'),onPressed: () {
 Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SavedArticles(),));
      
    },),
      body: BlocBuilder<RemoteArticleBlocBloc, RemoteArticleBlocState>(
        builder: (_, state) {
          if (state is RemoteArticleLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is RemoteArticleError) {
            return const Center(
              child: Icon(Icons.refresh),
            );
          }
          if (state is RemoteArticleDone) {
            return ListView.builder(
              itemCount: state.article!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: GestureDetector(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArticleDetailsView(article:state.article![index] ),)),
                      child: Row(
                        children: [
                          state.article![index].urlToImage == null
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  decoration: const BoxDecoration(
                                    color:
                                        Color.fromARGB(255, 226, 225, 225),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.error),
                                  ))
                              : 
                                Container(
                                    height:
                                        MediaQuery.of(context).size.height * 0.2,
                                    width: MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.all(Radius.circular(20)),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              state.article![index].urlToImage!),
                                          fit: BoxFit.fitHeight,
                                        )),
                                  ),
                              
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Column(
                              children: [
                                Text(
                                  state.article![index].title ?? '',
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  state.article![index].description ?? '..................',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
