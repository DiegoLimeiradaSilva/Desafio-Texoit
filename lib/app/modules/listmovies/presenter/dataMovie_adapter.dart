import 'package:desafiotecnico/app/modules/listmovies/domain/entities/data_movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataMovieAdapter extends DataGridSource {
  DataMovieAdapter({required List<Content> movieData}) {
    _movieData = movieData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<int>(columnName: 'year', value: e.year),
              DataGridCell<String>(columnName: 'title', value: e.title),
              DataGridCell<bool>(columnName: 'winner', value: e.winner),
            ]))
        .toList();
  }

  List<DataGridRow> _movieData = [];

  @override
  List<DataGridRow> get rows => _movieData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
