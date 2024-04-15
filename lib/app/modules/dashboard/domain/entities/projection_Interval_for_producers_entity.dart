// Entidade Intervalo de prêmios

class ProjectionIntervalForProducersEntity {
  List<Min>? min;
  List<Max>? max;

  ProjectionIntervalForProducersEntity({this.min, this.max});

  ProjectionIntervalForProducersEntity.fromJson(Map<String, dynamic> json) {
    if (json['min'] != null) {
      min = <Min>[];
      json['min'].forEach((v) {
        min!.add(new Min.fromJson(v));
      });
    }
    if (json['max'] != null) {
      max = <Max>[];
      json['max'].forEach((v) {
        max!.add(new Max.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.min != null) {
      data['min'] = this.min!.map((v) => v.toJson()).toList();
    }
    if (this.max != null) {
      data['max'] = this.max!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Min {
  String? producer;
  int? interval;
  int? previousWin;
  int? followingWin;

  Min({this.producer, this.interval, this.previousWin, this.followingWin});

  Min.fromJson(Map<String, dynamic> json) {
    producer = json['producer'];
    interval = json['interval'];
    previousWin = json['previousWin'];
    followingWin = json['followingWin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['producer'] = this.producer;
    data['interval'] = this.interval;
    data['previousWin'] = this.previousWin;
    data['followingWin'] = this.followingWin;
    return data;
  }
}

class Max {
  String? producer;
  int? interval;
  int? previousWin;
  int? followingWin;

  Max({this.producer, this.interval, this.previousWin, this.followingWin});

  Max.fromJson(Map<String, dynamic> json) {
    producer = json['producer'];
    interval = json['interval'];
    previousWin = json['previousWin'];
    followingWin = json['followingWin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['producer'] = this.producer;
    data['interval'] = this.interval;
    data['previousWin'] = this.previousWin;
    data['followingWin'] = this.followingWin;
    return data;
  }
}
