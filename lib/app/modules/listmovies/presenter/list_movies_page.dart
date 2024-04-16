import 'package:desafiotecnico/app/core/shared/widgets/drawer_custom_widget.dart';
import 'package:desafiotecnico/app/modules/listmovies/domain/entities/data_movie_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../domain/stores/list_movies_store.dart';

class ListMoviesPage extends StatefulWidget {
  final ListMoviesStore listMoviesStore;
  const ListMoviesPage({super.key, required this.listMoviesStore});

  @override
  State<ListMoviesPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<ListMoviesPage> {
  late final VoidCallback disposer;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await widget.listMoviesStore.getListMovies(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final bool isMobile = constraints.maxWidth < 600;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            "FrontEnd Test",
            style: TextStyle(color: Colors.grey.shade200),
          ),
        ),
        drawer: isMobile
            ? DrawerCustomWidget(
                isMobile: isMobile,
              )
            : null,
        body: isMobile
            ? ScopedBuilder(
                store: widget.listMoviesStore,
                onLoading: (context) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                onState: (context, state) {
                  return Column(
                    children: [
                      Container(
                        child: SfDataGrid(
                          allowFiltering: true,
                          source: widget.listMoviesStore.moviesDataSource!,
                          rowsPerPage: 5,
                          columnWidthMode: ColumnWidthMode.fill,
                          columns: <GridColumn>[
                            GridColumn(
                                columnName: 'id',
                                label: Container(
                                    padding: EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'ID',
                                    ))),
                            GridColumn(
                                columnName: 'year',
                                label: Container(
                                    padding: EdgeInsets.all(8.0),
                                    alignment: Alignment.center,
                                    child: Text('Year'))),
                            GridColumn(
                                columnName: 'title',
                                label: Container(
                                    padding: EdgeInsets.all(8.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Title',
                                      overflow: TextOverflow.ellipsis,
                                    ))),
                            GridColumn(
                                columnName: 'winner',
                                allowFiltering: true,
                                label: Container(
                                    padding: EdgeInsets.all(8.0),
                                    alignment: Alignment.center,
                                    child: Text('Winner'))),
                          ],
                        ),
                      ),
                      Container(
                          height: widget.listMoviesStore.dataPagerHeight,
                          child: SfDataPager(
                            delegate: widget.listMoviesStore.moviesDataSource!,
                            pageCount: widget.listMoviesStore
                                    .movieswinnersEntity!.content!.length /
                                widget.listMoviesStore.rowsPerPage,
                            direction: Axis.horizontal,
                          ))
                    ],
                  );
                })
            : ScopedBuilder(
                store: widget.listMoviesStore,
                onLoading: (context) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                onState: (context, state) {
                  return Row(
                    children: [
                      DrawerCustomWidget(isMobile: isMobile),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            children: [
                              Expanded(
                                child: SfDataGrid(
                                  allowFiltering: true,
                                  source:
                                      widget.listMoviesStore.moviesDataSource!,
                                  rowsPerPage:
                                      widget.listMoviesStore.rowsPerPage,
                                  columnWidthMode: ColumnWidthMode.fill,
                                  columns: <GridColumn>[
                                    GridColumn(
                                        columnName: 'id',
                                        label: Container(
                                            padding: EdgeInsets.all(16.0),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'ID',
                                            ))),
                                    GridColumn(
                                        columnName: 'year',
                                        label: Container(
                                            padding: EdgeInsets.all(8.0),
                                            alignment: Alignment.center,
                                            child: Text('Year'))),
                                    GridColumn(
                                        columnName: 'title',
                                        label: Container(
                                            padding: EdgeInsets.all(8.0),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Title',
                                              overflow: TextOverflow.ellipsis,
                                            ))),
                                    GridColumn(
                                        columnName: 'winner',
                                        allowFiltering: true,
                                        label: Container(
                                            padding: EdgeInsets.all(8.0),
                                            alignment: Alignment.center,
                                            child: Text('Winner'))),
                                  ],
                                ),
                              ),
                              Container(
                                height: widget.listMoviesStore.dataPagerHeight,
                                child: SfDataPager(
                                  delegate:
                                      widget.listMoviesStore.moviesDataSource!,
                                  pageCount: widget
                                          .listMoviesStore
                                          .movieswinnersEntity!
                                          .content!
                                          .length /
                                      widget.listMoviesStore.rowsPerPage,
                                  direction: Axis.horizontal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
      );
    });
  }
}
