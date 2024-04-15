// entidade  Anos com mais de um vencedor

class ProjectionWinnersEntity {
  List<Years>? years;

  ProjectionWinnersEntity({this.years});

  ProjectionWinnersEntity.fromJson(Map<String, dynamic> json) {
    if (json['years'] != null) {
      years = <Years>[];
      json['years'].forEach((v) {
        years!.add(new Years.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.years != null) {
      data['years'] = this.years!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Years {
  int? year;
  int? winnerCount;

  Years({this.year, this.winnerCount});

  Years.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    winnerCount = json['winnerCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['winnerCount'] = this.winnerCount;
    return data;
  }
}
