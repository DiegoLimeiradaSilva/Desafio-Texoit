import 'package:desafiotecnico/app/core/shared/widgets/drawer_custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../domain/stores/dashboard_store.dart';

class DashBoardPage extends StatefulWidget {
  final DashboardStore dashStore;
  const DashBoardPage({super.key, required this.dashStore});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  late final VoidCallback disposer;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      await widget.dashStore.getProjectionWinners();
      await widget.dashStore.getProjectionStudioWithWinner();
      await widget.dashStore.getProjectionForProduces();
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
                store: widget.dashStore,
                onLoading: (context) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                onState: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'List years with multiple winners',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      DataTable(
                                          //columnSpacing: 0,

                                          border: TableBorder(
                                              left: BorderSide(width: 1),
                                              right: BorderSide(width: 1),
                                              bottom: BorderSide(width: 1),
                                              top: BorderSide(width: 1)),
                                          columns: [
                                            DataColumn(
                                                label: Text(
                                              'Year',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn(
                                                label: Text(
                                              'Win Count',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ],
                                          rows: widget.dashStore
                                                      .projectionWinners !=
                                                  null
                                              ? _createRowsProjectionYearWinners()
                                              : []),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text('Top 3 studios with winners',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      DataTable(
                                          border: TableBorder(
                                              left: BorderSide(width: 1),
                                              right: BorderSide(width: 1),
                                              bottom: BorderSide(width: 1),
                                              top: BorderSide(width: 1)),
                                          columns: [
                                            DataColumn(
                                                label: Text(
                                              'Name',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn(
                                                label: Text(
                                              'Win Count',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ],
                                          rows: widget.dashStore
                                                      .studiosWithWinEntity !=
                                                  null
                                              ? _createRowsStudiosWithWinners()
                                              : []),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Card(
                            child: Column(
                              children: [
                                Text(
                                    'Producers with longest and shortest interval between wins',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Maximum'),
                                DataTable(
                                    border: TableBorder(
                                        left: BorderSide(width: 1),
                                        right: BorderSide(width: 1),
                                        bottom: BorderSide(width: 1),
                                        top: BorderSide(width: 1)),
                                    columns: [
                                      DataColumn(
                                          label: Text(
                                        'Producer',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'interval',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Previous Year',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'Following Year',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ],
                                    rows:
                                        widget.dashStore.studiosWithWinEntity !=
                                                null
                                            ? _createRowsIntervalmin()
                                            : []),
                                Text('Minimum'),
                                DataTable(
                                    border: TableBorder(
                                        left: BorderSide(width: 1),
                                        right: BorderSide(width: 1),
                                        bottom: BorderSide(width: 1),
                                        top: BorderSide(width: 1)),
                                    columns: [
                                      DataColumn(
                                          label: Text(
                                        'Producer',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'interval',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataColumn(
                                        label: Text(
                                          'Previous Year',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Following Year',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                    rows:
                                        widget.dashStore.studiosWithWinEntity !=
                                                null
                                            ? _createRowsIntervalmax()
                                            : []),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text('List movie winners by year',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: SpinBox(
                                              max: 2024,
                                              value: 1950,
                                              step: 1,
                                              onChanged: (value) {
                                                widget.dashStore.edtyear =
                                                    value.toInt();
                                              },
                                              decoration: InputDecoration(
                                                  labelText: 'Search by year'),
                                            ),
                                          ),
                                          IconButton(
                                              color: Colors.blueAccent,
                                              onPressed: () async {
                                                await widget.dashStore
                                                    .getWinnersMoviesYear(widget
                                                        .dashStore.edtyear);
                                              },
                                              icon: Icon(Icons.search))
                                        ],
                                      ),
                                      DataTable(
                                          border: TableBorder(
                                              left: BorderSide(width: 1),
                                              right: BorderSide(width: 1),
                                              bottom: BorderSide(width: 1),
                                              top: BorderSide(width: 1)),
                                          columns: [
                                            DataColumn(
                                                label: Text(
                                              'ID',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn(
                                                label: Text(
                                              'Year',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            DataColumn(
                                                label: Text(
                                              'Title',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ],
                                          rows: widget.dashStore
                                                      .studiosWithWinEntity !=
                                                  null
                                              ? _createRowsWinnerYear()
                                              : []),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              )
            : ScopedBuilder(
                store: widget.dashStore,
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
                          child: SingleChildScrollView(
                              child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          'List years with multiple winners',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        DataTable(
                                            //columnSpacing: 0,

                                            border: TableBorder(
                                                left: BorderSide(width: 1),
                                                right: BorderSide(width: 1),
                                                bottom: BorderSide(width: 1),
                                                top: BorderSide(width: 1)),
                                            columns: [
                                              DataColumn(
                                                  label: Text(
                                                'Year',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Win Count',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ],
                                            rows: widget.dashStore
                                                        .projectionWinners !=
                                                    null
                                                ? _createRowsProjectionYearWinners()
                                                : []),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text('Top 3 studios with winners',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        DataTable(
                                            border: TableBorder(
                                                left: BorderSide(width: 1),
                                                right: BorderSide(width: 1),
                                                bottom: BorderSide(width: 1),
                                                top: BorderSide(width: 1)),
                                            columns: [
                                              DataColumn(
                                                  label: Text(
                                                'Name',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Win Count',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ],
                                            rows: widget.dashStore
                                                        .studiosWithWinEntity !=
                                                    null
                                                ? _createRowsStudiosWithWinners()
                                                : []),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                            'Producers with longest and shortest interval between wins',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text('Maximum'),
                                        DataTable(
                                            border: TableBorder(
                                                left: BorderSide(width: 1),
                                                right: BorderSide(width: 1),
                                                bottom: BorderSide(width: 1),
                                                top: BorderSide(width: 1)),
                                            columns: [
                                              DataColumn(
                                                  label: Text(
                                                'Producer',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'interval',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Previous Year',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Following Year',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ],
                                            rows: widget.dashStore
                                                        .studiosWithWinEntity !=
                                                    null
                                                ? _createRowsIntervalmax()
                                                : []),
                                        Text('Minimum'),
                                        DataTable(
                                            border: TableBorder(
                                                left: BorderSide(width: 1),
                                                right: BorderSide(width: 1),
                                                bottom: BorderSide(width: 1),
                                                top: BorderSide(width: 1)),
                                            columns: [
                                              DataColumn(
                                                  label: Text(
                                                'Producer',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'interval',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn(
                                                label: Text(
                                                  'Previous Year',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Following Year',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                            rows: widget.dashStore
                                                        .studiosWithWinEntity !=
                                                    null
                                                ? _createRowsIntervalmin()
                                                : []),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text('List movie winners by year',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: SpinBox(
                                                max: 2024,
                                                value: 1950,
                                                step: 1,
                                                onChanged: (value) {
                                                  widget.dashStore.edtyear =
                                                      value.toInt();
                                                },
                                                decoration: InputDecoration(
                                                    labelText:
                                                        'Search by year'),
                                              ),
                                            ),
                                            IconButton(
                                                color: Colors.blueAccent,
                                                onPressed: () async {
                                                  await widget.dashStore
                                                      .getWinnersMoviesYear(
                                                          widget.dashStore
                                                              .edtyear);
                                                },
                                                icon: Icon(Icons.search))
                                          ],
                                        ),
                                        DataTable(
                                            border: TableBorder(
                                                left: BorderSide(width: 1),
                                                right: BorderSide(width: 1),
                                                bottom: BorderSide(width: 1),
                                                top: BorderSide(width: 1)),
                                            columns: [
                                              DataColumn(
                                                  label: Text(
                                                'ID',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Year',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Title',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ],
                                            rows: widget.dashStore
                                                        .studiosWithWinEntity !=
                                                    null
                                                ? _createRowsWinnerYear()
                                                : []),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ))),
                    ],
                  );
                },
              ),
      );
    });
  }

  List<DataRow> _createRowsProjectionYearWinners() {
    return widget.dashStore.projectionWinners!.years!
        .map((projection) => DataRow(cells: [
              DataCell(Text(projection.year.toString() ?? '0')),
              DataCell(Text(projection.winnerCount.toString() ?? '0'))
            ]))
        .toList();
  }

  List<DataRow> _createRowsStudiosWithWinners() {
    return widget.dashStore.studiosWithWinEntity!.studios!
        .map((studio) => DataRow(cells: [
              DataCell(Text(studio.name.toString() ?? ' ')),
              DataCell(Text(studio.winCount.toString() ?? '0'))
            ]))
        .toList();
  }

  List<DataRow> _createRowsIntervalmin() {
    return widget.dashStore.projectionIntervalForProducersEntity!.min!
        .map((min) => DataRow(cells: [
              DataCell(Text(min.producer.toString() ?? ' ')),
              DataCell(Text(min.interval.toString() ?? '0')),
              DataCell(Text(min.previousWin.toString() ?? '0')),
              DataCell(Text(min.followingWin.toString() ?? '0'))
            ]))
        .toList();
  }

  List<DataRow> _createRowsIntervalmax() {
    return widget.dashStore.projectionIntervalForProducersEntity!.max!
        .map((max) => DataRow(cells: [
              DataCell(Text(max.producer.toString() ?? ' ')),
              DataCell(Text(max.interval.toString() ?? '0')),
              DataCell(Text(max.previousWin.toString() ?? '0')),
              DataCell(Text(max.followingWin.toString() ?? '0'))
            ]))
        .toList();
  }

  List<DataRow> _createRowsWinnerYear() {
    return widget.dashStore.winnersEntity != null
        ? widget.dashStore.winnersEntity!
            .map((winners) => DataRow(cells: [
                  DataCell(Text(winners.id.toString() ?? '0')),
                  DataCell(Text(winners.year.toString() ?? '0')),
                  DataCell(Text(winners.title.toString() ?? '0')),
                ]))
            .toList()
        : [];
  }
}
