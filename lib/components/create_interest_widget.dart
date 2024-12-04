import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'create_interest_model.dart';
export 'create_interest_model.dart';

class CreateInterestWidget extends StatefulWidget {
  const CreateInterestWidget({super.key});

  @override
  State<CreateInterestWidget> createState() => _CreateInterestWidgetState();
}

class _CreateInterestWidgetState extends State<CreateInterestWidget> {
  late CreateInterestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateInterestModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 23.0, 25.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Создание публикации',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(33.0, 0.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 30.0, 25.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                final selectedMedia = await selectMediaWithSourceBottomSheet(
                  context: context,
                  allowPhoto: true,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  safeSetState(() => _model.isDataUploading = true);
                  var selectedUploadedFiles = <FFUploadedFile>[];

                  var downloadUrls = <String>[];
                  try {
                    selectedUploadedFiles = selectedMedia
                        .map((m) => FFUploadedFile(
                              name: m.storagePath.split('/').last,
                              bytes: m.bytes,
                              height: m.dimensions?.height,
                              width: m.dimensions?.width,
                              blurHash: m.blurHash,
                            ))
                        .toList();

                    downloadUrls = (await Future.wait(
                      selectedMedia.map(
                        (m) async => await uploadData(m.storagePath, m.bytes),
                      ),
                    ))
                        .where((u) => u != null)
                        .map((u) => u!)
                        .toList();
                  } finally {
                    _model.isDataUploading = false;
                  }
                  if (selectedUploadedFiles.length == selectedMedia.length &&
                      downloadUrls.length == selectedMedia.length) {
                    safeSetState(() {
                      _model.uploadedLocalFile = selectedUploadedFiles.first;
                      _model.uploadedFileUrl = downloadUrls.first;
                    });
                  } else {
                    safeSetState(() {});
                    return;
                  }
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Group_51.png',
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 15.0, 25.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: const Color(0xFFAAAAAA),
                ),
              ),
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
                      labelText: 'Введите название...',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Manrope',
                                color: const Color(0xFFAAAAAA),
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Manrope',
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 0.0, 10.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                        ),
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(6.0, 21.0, 0.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 108.0,
                      height: 31.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Отмена',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      var interestRecordReference =
                          InterestRecord.collection.doc();
                      await interestRecordReference
                          .set(createInterestRecordData(
                        name: _model.textController.text,
                        photoUrl: _model.uploadedFileUrl,
                      ));
                      _model.outGegff = InterestRecord.getDocumentFromData(
                          createInterestRecordData(
                            name: _model.textController.text,
                            photoUrl: _model.uploadedFileUrl,
                          ),
                          interestRecordReference);
                      Navigator.pop(context);

                      safeSetState(() {});
                    },
                    child: Container(
                      width: 108.0,
                      height: 31.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Опубликовать',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
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
    );
  }
}
