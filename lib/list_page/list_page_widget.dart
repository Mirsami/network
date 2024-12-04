import '/backend/backend.dart';
import '/components/create_event_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_page_model.dart';
export 'list_page_model.dart';

class ListPageWidget extends StatefulWidget {
  const ListPageWidget({super.key});

  @override
  State<ListPageWidget> createState() => _ListPageWidgetState();
}

class _ListPageWidgetState extends State<ListPageWidget> {
  late ListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                      child: Container(
                        width: 133.0,
                        height: 41.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Астана',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(27.0, 32.0, 0.0, 18.0),
                      child: Text(
                        'Стартапы',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 167.0,
                    decoration: const BoxDecoration(),
                    child: StreamBuilder<List<EventRecord>>(
                      stream: queryEventRecord(
                        queryBuilder: (eventRecord) => eventRecord.where(
                          'category',
                          isEqualTo: 'Стартапы',
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<EventRecord> listViewEventRecordList =
                            snapshot.data!;

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: listViewEventRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewEventRecord =
                                listViewEventRecordList[listViewIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: 180.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: const Color(0xFF121212),
                                    width: 0.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.network(
                                          listViewEventRecord.photo,
                                          width: double.infinity,
                                          height: 81.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 8.0, 0.0, 0.0),
                                          child: Text(
                                            'Мероприятие Astana Hub',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 2.0, 0.0, 0.0),
                                          child: Text(
                                            'Описание описание описание опис...',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 8.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            6.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'eventPage',
                                                  queryParameters: {
                                                    'eventRef': serializeParam(
                                                      listViewEventRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width: 69.0,
                                                height: 22.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Посетить',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: Colors.white,
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: 75.0,
                                                height: 22.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Подробнее',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(27.0, 32.0, 0.0, 18.0),
                      child: Text(
                        'Ресерчи',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 167.0,
                    decoration: const BoxDecoration(),
                    child: StreamBuilder<List<EventRecord>>(
                      stream: queryEventRecord(
                        queryBuilder: (eventRecord) => eventRecord.where(
                          'category',
                          isEqualTo: 'Ресерчи',
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<EventRecord> listViewEventRecordList =
                            snapshot.data!;

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: listViewEventRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewEventRecord =
                                listViewEventRecordList[listViewIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: 180.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: const Color(0xFF121212),
                                    width: 0.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.network(
                                          listViewEventRecord.photo,
                                          width: double.infinity,
                                          height: 81.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 8.0, 0.0, 0.0),
                                          child: Text(
                                            'Мероприятие Astana Hub',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 2.0, 0.0, 0.0),
                                          child: Text(
                                            'Описание описание описание опис...',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 8.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            6.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'eventPage',
                                                  queryParameters: {
                                                    'eventRef': serializeParam(
                                                      listViewEventRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width: 69.0,
                                                height: 22.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Посетить',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: Colors.white,
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: 75.0,
                                                height: 22.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Подробнее',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(27.0, 32.0, 0.0, 18.0),
                      child: Text(
                        'Школьные',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 120.0),
                    child: Container(
                      width: double.infinity,
                      height: 167.0,
                      decoration: const BoxDecoration(),
                      child: StreamBuilder<List<EventRecord>>(
                        stream: queryEventRecord(
                          queryBuilder: (eventRecord) => eventRecord.where(
                            'category',
                            isEqualTo: 'Школьные',
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<EventRecord> listViewEventRecordList =
                              snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: listViewEventRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewEventRecord =
                                  listViewEventRecordList[listViewIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 180.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: const Color(0xFF121212),
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            listViewEventRecord.photo,
                                            width: double.infinity,
                                            height: 81.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 8.0, 0.0, 0.0),
                                            child: Text(
                                              'Мероприятие Astana Hub',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 2.0, 0.0, 0.0),
                                            child: Text(
                                              'Описание описание описание опис...',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 8.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'eventPage',
                                                    queryParameters: {
                                                      'eventRef':
                                                          serializeParam(
                                                        listViewEventRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  width: 69.0,
                                                  height: 22.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      'Посетить',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            color: Colors.white,
                                                            fontSize: 8.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 75.0,
                                                  height: 22.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 0.5,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      'Подробнее',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            fontSize: 8.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(1.0, 1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 40.0, 120.0),
                child: Container(
                  width: 65.0,
                  height: 65.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () => FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: const CreateEventWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: const Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                      size: 34.0,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 40.0),
                child: Container(
                  width: double.infinity,
                  height: 66.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCFCFC),
                    borderRadius: BorderRadius.circular(34.0),
                    border: Border.all(
                      color: const Color(0xFFEAEAEA),
                      width: 1.0,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.goNamed('homePage');

                          FFAppState().whichPage = 'homePage';
                          safeSetState(() {});
                        },
                        child: Icon(
                          Icons.home_outlined,
                          color: FFAppState().whichPage == 'homePage'
                              ? FlutterFlowTheme.of(context).primary
                              : const Color(0xFFCDCDCD),
                          size: 30.0,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.goNamed('listPage');

                          FFAppState().whichPage = 'listPage';
                          safeSetState(() {});
                        },
                        child: Icon(
                          Icons.list_rounded,
                          color: FFAppState().whichPage == 'listPage'
                              ? FlutterFlowTheme.of(context).primary
                              : const Color(0xFFCDCDCD),
                          size: 30.0,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.goNamed('searchPage');

                          FFAppState().whichPage = 'searchPage';
                          safeSetState(() {});
                        },
                        child: Icon(
                          Icons.search_rounded,
                          color: FFAppState().whichPage == 'searchPage'
                              ? FlutterFlowTheme.of(context).primary
                              : const Color(0xFFCDCDCD),
                          size: 30.0,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.goNamed('profilePage');

                          FFAppState().whichPage = 'profilePage';
                          safeSetState(() {});
                        },
                        child: Icon(
                          Icons.person_outline_outlined,
                          color: FFAppState().whichPage == 'profilePage'
                              ? FlutterFlowTheme.of(context).primary
                              : const Color(0xFFCDCDCD),
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
