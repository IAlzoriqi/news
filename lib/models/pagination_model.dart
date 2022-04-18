class PaginationModel {
   final int? limit;
   final int? offset;
   final int? count;
   final int? total;

  PaginationModel({
       this.limit,
      this.offset,
       this.count,
     this.total,
  });
  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    print("PaginationModel start = ${json}");
    return PaginationModel(
      limit: json['limit']?? 'some limit' ,
      offset: json['offset']?? 'some offset',
      count: json['count'] ?? 'some count',
      total: json['total']?? 'some total',
    );
  }
}
