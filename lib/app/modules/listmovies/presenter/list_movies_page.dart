import 'package:desafiotecnico/app/core/shared/widgets/drawer_custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:pluto_grid/pluto_grid.dart';

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
    // TODO: implement initState
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
                  return Container(
                    child: PlutoGrid(
                      configuration: const PlutoGridConfiguration(),
                      createFooter: (stateManager) {
                        stateManager.setPageSize(5,
                            notify: false); // default 40
                        return PlutoPagination(stateManager);
                      },
                      // configuration: PlutoGridConfiguration(columnFilter: PlutoGridColumnFilterConfig(filters: PlutoFilterTyp)),
                      columns: columns,
                      mode: PlutoGridMode.readOnly,
                      rows: loadingRow(),
                      onChanged: (PlutoGridOnChangedEvent event) {
                        print(event);
                      },
                      onLoaded: (PlutoGridOnLoadedEvent event) {
                        event.stateManager.setShowColumnFilter(true);
                      },
                    ),
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
                          child: PlutoGrid(
                            configuration: const PlutoGridConfiguration(),
                            createFooter: (stateManager) {
                              stateManager.setPageSize(5,
                                  notify: false); // default 40
                              return PlutoPagination(stateManager);
                            },
                            // configuration: PlutoGridConfiguration(columnFilter: PlutoGridColumnFilterConfig(filters: PlutoFilterTyp)),
                            columns: columns,
                            mode: PlutoGridMode.readOnly,
                            rows: loadingRow(),
                            onChanged: (PlutoGridOnChangedEvent event) {
                              print(event);
                            },
                            onLoaded: (PlutoGridOnLoadedEvent event) {
                              event.stateManager.setShowColumnFilter(true);
                            },
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

  List<PlutoColumn> columns = [
    /// Text Column definition
    PlutoColumn(
      title: 'ID',
      field: 'id',
      type: PlutoColumnType.number(),
    ),

    /// Number Column definition
    PlutoColumn(
      title: 'Year',
      field: 'year',
      type: PlutoColumnType.text(),
    ),

    /// Select Column definition
    PlutoColumn(
      title: 'Title',
      field: 'title',
      type: PlutoColumnType.text(),
    ),

    /// Datetime Column definition
    PlutoColumn(
      title: 'Winner',
      field: 'winner',
      type: PlutoColumnType.text(),
    ),
  ];
  List<PlutoRow> loadingRow() {
    List<PlutoRow> listRow = [];
    if (widget.listMoviesStore.movieswinnersEntity != null)
      listRow = widget.listMoviesStore.movieswinnersEntity!.content!
          .map(
            (e) => PlutoRow(
              cells: {
                'id': PlutoCell(value: e.id),
                'year': PlutoCell(value: e.year),
                'title': PlutoCell(value: e.title),
                'winner': PlutoCell(value: e.winner),
              },
            ),
          )
          .toList();
    return listRow;
  }
}
