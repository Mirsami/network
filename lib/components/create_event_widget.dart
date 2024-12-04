import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'create_event_model.dart';
export 'create_event_model.dart';

class CreateEventWidget extends StatefulWidget {
  const CreateEventWidget({super.key});

  @override
  State<CreateEventWidget> createState() => _CreateEventWidgetState();
}

class _CreateEventWidgetState extends State<CreateEventWidget> {
  late CreateEventModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateEventModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();
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
                  'Создание мероприятия',
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
                    controller: _model.textController1,
                    focusNode: _model.textFieldFocusNode1,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Введите Название...',
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
                        _model.textController1Validator.asValidator(context),
                  ),
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
                    controller: _model.textController2,
                    focusNode: _model.textFieldFocusNode2,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Описание...',
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
                    maxLines: 7,
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    validator:
                        _model.textController2Validator.asValidator(context),
                  ),
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
                    controller: _model.textController3,
                    focusNode: _model.textFieldFocusNode3,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Укажите адрес...',
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
                        _model.textController3Validator.asValidator(context),
                  ),
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
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController ??=
                      FormFieldController<String>(null),
                  options: const ['Стартапы', 'Ресерчи', 'Школьные'],
                  onChanged: (val) =>
                      safeSetState(() => _model.dropDownValue = val),
                  width: double.infinity,
                  height: 40.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                  hintText: 'Введите категорию...',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: Colors.transparent,
                  borderWidth: 0.0,
                  borderRadius: 8.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  hidesUnderline: true,
                  isOverButton: false,
                  isSearchable: false,
                  isMultiSelect: false,
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
                      var eventRecordReference = EventRecord.collection.doc();
                      await eventRecordReference.set(createEventRecordData(
                        name: _model.textController1.text,
                        description: _model.textController2.text,
                        photo: _model.uploadedFileUrl,
                        location: _model.textController3.text,
                        category: _model.dropDownValue,
                      ));
                      _model.outEvent = EventRecord.getDocumentFromData(
                          createEventRecordData(
                            name: _model.textController1.text,
                            description: _model.textController2.text,
                            photo: _model.uploadedFileUrl,
                            location: _model.textController3.text,
                            category: _model.dropDownValue,
                          ),
                          eventRecordReference);
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
