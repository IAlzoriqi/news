import 'package:news/models/data_model.dart';
import 'package:news/models/pagination_model.dart';

class NewsModel {
  final PaginationModel paginationModel;
  final List<DataModel> dataModel;
  NewsModel({
    required this.paginationModel,
    required this.dataModel,
  });
  factory NewsModel.fromJson(Map<String, dynamic> json) {

    print(json);
    return NewsModel(
      paginationModel: PaginationModel.fromJson(json['pagination']),
      dataModel: parseData(json),
      // dataModel: List.from(json['dataModel'])
      //     .map((e) => DataModel.fromJson(e))
      //     .toList(),
    );
  }


  // factory NewsModel.toJson() {
  //   return NewsModel(
  //     paginationModel: PaginationModel.fromJson(json['pagination']),
  //     dataModel: parseData(json),
  //     // dataModel: List.from(json['dataModel'])
  //     //     .map((e) => DataModel.fromJson(e))
  //     //     .toList(),
  //   );
  // }
  static List<DataModel> parseData(Map<String, dynamic> dataJson) {
    print("step");
    var list = dataJson['data'] as List;
    print('ddddddd');
    List<DataModel> dataList = list.map((e) => DataModel.fromJson(e)).toList();
    print ('data model news model');
    return dataList;
  }
}
