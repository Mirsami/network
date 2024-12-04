import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'log_page_model.dart';
export 'log_page_model.dart';

class LogPageWidget extends StatefulWidget {
  const LogPageWidget({super.key});

  @override
  State<LogPageWidget> createState() => _LogPageWidgetState();
}

class _LogPageWidgetState extends State<LogPageWidget> {
  late LogPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogPageModel());

    _model.emailTextController ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'network',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                child: Text(
                  'Добро пожаловать!',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        fontSize: 28.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            Text(
              'Введите свои данные:',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Manrope',
                    color: const Color(0xFF5A5A5A),
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(42.0, 35.0, 42.0, 0.0),
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
                      controller: _model.emailTextController,
                      focusNode: _model.textFieldFocusNode1,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Введите почту...',
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
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 0.0, 10.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                          ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.emailTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(42.0, 10.0, 42.0, 0.0),
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
                      controller: _model.passwordTextController,
                      focusNode: _model.textFieldFocusNode2,
                      autofocus: false,
                      obscureText: !_model.passwordVisibility,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Введите пароль...',
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
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 0.0, 10.0),
                        suffixIcon: InkWell(
                          onTap: () => safeSetState(
                            () => _model.passwordVisibility =
                                !_model.passwordVisibility,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            _model.passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                          ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.passwordTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(73.0, 28.0, 73.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  GoRouter.of(context).prepareAuthEvent();

                  final user = await authManager.signInWithEmail(
                    context,
                    _model.emailTextController.text,
                    _model.passwordTextController.text,
                  );
                  if (user == null) {
                    return;
                  }

                  context.goNamedAuth('homePage', context.mounted);
                },
                text: 'Войти',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 48.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Manrope',
                        color: Colors.white,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                  child: Text(
                    'Еще нет аккаунта?',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 18.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('regPage');
                    },
                    child: Text(
                      'Зарегистрироваться',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            color: const Color(0xFF0866FF),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
