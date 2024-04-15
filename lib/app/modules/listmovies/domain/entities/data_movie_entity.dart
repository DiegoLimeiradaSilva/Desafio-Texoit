class DataMovieEntity {
  List<Content>? content;
  Pageable? pageable;
  int? totalElements;
  bool? last;
  int? totalPages;
  bool? first;
  Sort? sort;
  int? number;
  int? numberOfElements;
  int? size;

  DataMovieEntity(
      {this.content,
      this.pageable,
      this.totalElements,
      this.last,
      this.totalPages,
      this.first,
      this.sort,
      this.number,
      this.numberOfElements,
      this.size});

  DataMovieEntity.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    pageable = json['pageable'] != null
        ? new Pageable.fromJson(json['pageable'])
        : null;
    totalElements = json['totalElements'];
    last = json['last'];
    totalPages = json['totalPages'];
    first = json['first'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    number = json['number'];
    numberOfElements = json['numberOfElements'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    if (this.pageable != null) {
      data['pageable'] = this.pageable!.toJson();
    }
    data['totalElements'] = this.totalElements;
    data['last'] = this.last;
    data['totalPages'] = this.totalPages;
    data['first'] = this.first;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['number'] = this.number;
    data['numberOfElements'] = this.numberOfElements;
    data['size'] = this.size;
    return data;
  }
}

class Content {
  int? id;
  int? year;
  String? title;
  List<String>? studios;
  List<String>? producers;
  bool? winner;

  Content(
      {this.id,
      this.year,
      this.title,
      this.studios,
      this.producers,
      this.winner});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    year = json['year'];
    title = json['title'];
    studios = json['studios'].cast<String>();
    producers = json['producers'].cast<String>();
    winner = json['winner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['year'] = this.year;
    data['title'] = this.title;
    data['studios'] = this.studios;
    data['producers'] = this.producers;
    data['winner'] = this.winner;
    return data;
  }
}

class Pageable {
  Sort? sort;
  int? pageSize;
  int? pageNumber;
  int? offset;
  bool? paged;
  bool? unpaged;

  Pageable(
      {this.sort,
      this.pageSize,
      this.pageNumber,
      this.offset,
      this.paged,
      this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    pageSize = json['pageSize'];
    pageNumber = json['pageNumber'];
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['pageSize'] = this.pageSize;
    data['pageNumber'] = this.pageNumber;
    data['offset'] = this.offset;
    data['paged'] = this.paged;
    data['unpaged'] = this.unpaged;
    return data;
  }
}

class Sort {
  bool? sorted;
  bool? unsorted;

  Sort({this.sorted, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sorted'] = this.sorted;
    data['unsorted'] = this.unsorted;
    return data;
  }
}
