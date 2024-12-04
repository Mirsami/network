import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.whichUPage = 'forYou';
                            safeSetState(() {});
                          },
                          child: Container(
                            width: 104.0,
                            height: 41.0,
                            decoration: BoxDecoration(
                              color: _model.whichUPage == 'forYou'
                                  ? FlutterFlowTheme.of(context).primary
                                  : const Color(0x00121212),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Для Вас',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: _model.whichUPage == 'forYou'
                                          ? Colors.white
                                          : FlutterFlowTheme.of(context)
                                              .primary,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.whichUPage = 'subs';
                            safeSetState(() {});
                          },
                          child: Container(
                            width: 104.0,
                            height: 41.0,
                            decoration: BoxDecoration(
                              color: _model.whichUPage == 'subs'
                                  ? FlutterFlowTheme.of(context).primary
                                  : const Color(0x00121212),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Подписки',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: _model.whichUPage == 'subs'
                                          ? Colors.white
                                          : FlutterFlowTheme.of(context)
                                              .primary,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.whichUPage == 'forYou') {
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 0.0, 0.0),
                          child: StreamBuilder<List<PostsRecord>>(
                            stream: queryPostsRecord(),
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
                              List<PostsRecord> listViewPostsRecordList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewPostsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewPostsRecord =
                                      listViewPostsRecordList[listViewIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        28.0, 25.0, 28.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: StreamBuilder<UserRecord>(
                                        stream: UserRecord.getDocument(
                                            listViewPostsRecord.author!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          final columnUserRecord =
                                              snapshot.data!;

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      columnUserRecord.photoUrl,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(13.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      columnUserRecord
                                                          .displayName,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: columnUserRecord
                                                            .subs
                                                            .contains(
                                                                currentUserReference)
                                                        ? null
                                                        : () async {
                                                            await columnUserRecord
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'subs': FieldValue
                                                                      .arrayUnion([
                                                                    currentUserReference
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                          },
                                                    text: 'Подписаться',
                                                    options: FFButtonOptions(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  13.0,
                                                                  16.0,
                                                                  13.0,
                                                                  16.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      disabledColor:
                                                          const Color(0xFFB7B7B7),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 14.0, 0.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                  child: Image.network(
                                                    listViewPostsRecord.image,
                                                    width: double.infinity,
                                                    height: 277.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 30.0,
                                                      height: 30.0,
                                                      decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xFFD70000),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: const Icon(
                                                        Icons.favorite_rounded,
                                                        color: Colors.white,
                                                        size: 17.0,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xFFF1F1F1),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: const Icon(
                                                          Icons
                                                              .message_outlined,
                                                          color:
                                                              Color(0xFFAEAEAE),
                                                          size: 17.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 30.0,
                                                      height: 30.0,
                                                      decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xFFF1F1F1),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: const Icon(
                                                        Icons.send_outlined,
                                                        color:
                                                            Color(0xFFAEAEAE),
                                                        size: 17.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) =>
                                StreamBuilder<List<PostsRecord>>(
                              stream: queryPostsRecord(
                                queryBuilder: (postsRecord) =>
                                    postsRecord.whereIn(
                                        'author',
                                        (currentUserDocument?.subs.toList() ??
                                            [])),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<PostsRecord> listViewPostsRecordList =
                                    snapshot.data!;

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewPostsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewPostsRecord =
                                        listViewPostsRecordList[listViewIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          28.0, 25.0, 28.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: StreamBuilder<UserRecord>(
                                          stream: UserRecord.getDocument(
                                              listViewPostsRecord.author!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }

                                            final columnUserRecord =
                                                snapshot.data!;

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        columnUserRecord
                                                            .photoUrl,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  13.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        columnUserRecord
                                                            .displayName,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Manrope',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: columnUserRecord
                                                              .subs
                                                              .contains(
                                                                  currentUserReference)
                                                          ? null
                                                          : () async {
                                                              await columnUserRecord
                                                                  .reference
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'subs': FieldValue
                                                                        .arrayUnion([
                                                                      currentUserReference
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                            },
                                                      text: 'Подписаться',
                                                      options: FFButtonOptions(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    13.0,
                                                                    16.0,
                                                                    13.0,
                                                                    16.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        disabledColor:
                                                            const Color(0xFFB7B7B7),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 14.0, 0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                    child: Image.network(
                                                      listViewPostsRecord.image,
                                                      width: double.infinity,
                                                      height: 277.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xFFD70000),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: const Icon(
                                                          Icons
                                                              .favorite_rounded,
                                                          color: Colors.white,
                                                          size: 17.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 30.0,
                                                          height: 30.0,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Color(
                                                                0xFFF1F1F1),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: const Icon(
                                                            Icons
                                                                .message_outlined,
                                                            color: Color(
                                                                0xFFAEAEAE),
                                                            size: 17.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xFFF1F1F1),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: const Icon(
                                                          Icons.send_outlined,
                                                          color:
                                                              Color(0xFFAEAEAE),
                                                          size: 17.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
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
