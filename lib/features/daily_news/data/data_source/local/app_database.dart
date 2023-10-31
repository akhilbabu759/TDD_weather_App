

import 'package:cleannewsapp/features/daily_news/data/data_source/local/DAO/article_dao.dart';
import 'package:cleannewsapp/features/daily_news/data/model/article.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';
@Database(version: 1, entities: [ArticleModl])
abstract class AppDatabase extends FloorDatabase{
  ArticleDao get articleDao;

}