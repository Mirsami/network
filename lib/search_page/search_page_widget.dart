import '/backend/backend.dart';
import '/components/create_interest_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_page_model.dart';
export 'search_page_model.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({super.key});

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  late SearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(42.0, 35.0, 42.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color: const Color(0xFFAAAAAA),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.search_rounded,
                              color: Color(0xFFAAAAAA),
                              size: 20.0,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Поиск..',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: const Color(0xFFAAAAAA),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            11.0, 10.0, 0.0, 10.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(28.0, 26.0, 28.0, 0.0),
                    child: StreamBuilder<List<InterestRecord>>(
                      stream: queryInterestRecord(),
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
                        List<InterestRecord> gridViewInterestRecordList =
                            snapshot.data!;

                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 1.3,
                          ),
                          primary: false,
                          scrollDirection: Axis.vertical,
                          itemCount: gridViewInterestRecordList.length,
                          itemBuilder: (context, gridViewIndex) {
                            final gridViewInterestRecord =
                                gridViewInterestRecordList[gridViewIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'interestPage',
                                  queryParameters: {
                                    'interestRef': serializeParam(
                                      gridViewInterestRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: const Color(0x5E000000),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    image: Image.network(
                                      gridViewInterestRecord.photoUrl,
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    gridViewInterestRecord.name,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
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
                              child: const CreateInterestWidget(),
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
