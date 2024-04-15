//Entidade chamada Filme por ano
class WinnersEntity {
  int? id;
  int? year;
  String? title;
  List<String>? studios;
  List<String>? producers;
  bool? winner;

  WinnersEntity(
      {this.id,
      this.year,
      this.title,
      this.studios,
      this.producers,
      this.winner});

  WinnersEntity.fromJson(Map<String, dynamic> json) {
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
