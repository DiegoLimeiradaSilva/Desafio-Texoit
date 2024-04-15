//Entidade chamada Estúdios

class StudiosWithWinEntity {
  List<Studios>? studios;

  StudiosWithWinEntity({this.studios});

  StudiosWithWinEntity.fromJson(Map<String, dynamic> json) {
    if (json['studios'] != null) {
      studios = <Studios>[];
      json['studios'].forEach((v) {
        studios!.add(new Studios.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.studios != null) {
      data['studios'] = this.studios!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Studios {
  String? name;
  int? winCount;

  Studios({this.name, this.winCount});

  Studios.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    winCount = json['winCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['winCount'] = this.winCount;
    return data;
  }
}
