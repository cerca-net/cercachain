import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'method_order_model.dart';
export 'method_order_model.dart';

class MethodOrderWidget extends StatefulWidget {
  const MethodOrderWidget({super.key});

  static String routeName = 'MethodOrder';
  static String routePath = '/methodOrder';

  @override
  State<MethodOrderWidget> createState() => _MethodOrderWidgetState();
}

class _MethodOrderWidgetState extends State<MethodOrderWidget> {
  late MethodOrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MethodOrderModel());

    _model.taskTextController1 ??= TextEditingController();
    _model.taskFocusNode1 ??= FocusNode();

    _model.taskTextController2 ??= TextEditingController();
    _model.taskFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 12, 8),
              child: FlutterFlowIconButton(
                borderRadius: 12,
                buttonSize: 40,
                icon:
                    Icon(
                  Icons.close_rounded,
                  size: 24,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'h2cbvgye' /* New order method */,
                            ),
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                      .secondaryText,
                                  fontSize: 22,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(12, 24, 12, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, -1),
                                child: Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 770,
                                  ),
                                  decoration: const BoxDecoration(),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: FlutterFlowChoiceChips(
                                  options: [
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                      'laks95yc' /* Local */,
                                    )),
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                      'b4hg2os1' /* Mobile */,
                                    ))
                                  ],
                                  onChanged: (val) => safeSetState(() => _model
                                      .choiceChipsValue1 = val?.firstOrNull),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                        .primaryText,
                                    iconSize: 18,
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                            .primaryBackground,
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                        .secondaryText,
                                    iconSize: 18,
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  chipSpacing: 8,
                                  rowSpacing: 8,
                                  multiselect: false,
                                  alignment: WrapAlignment.center,
                                  controller:
                                      _model.choiceChipsValueController1 ??=
                                          FormFieldController<List<String>>(
                                    [],
                                  ),
                                  wrapped: true,
                                ),
                              ),
                              if (_model.choiceChipsValue1 == 'Local')
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: FlutterFlowChoiceChips(
                                    options: [
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'x12sskfm' /* Pick up */,
                                      )),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'ukuuo97r' /* Indoor */,
                                      ))
                                    ],
                                    onChanged: (val) => safeSetState(() =>
                                        _model.choiceChipsValue2 =
                                            val?.firstOrNull),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                              .secondary,
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                          ),
                                          .primaryText,
                                      iconSize: 18,
                                      elevation: 0,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                              .primaryBackground,
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                          .secondaryText,
                                      iconSize: 18,
                                      elevation: 0,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    chipSpacing: 8,
                                    rowSpacing: 8,
                                    multiselect: false,
                                    alignment: WrapAlignment.center,
                                    controller:
                                        _model.choiceChipsValueController2 ??=
                                            FormFieldController<List<String>>(
                                      [],
                                    ),
                                    wrapped: true,
                                  ),
                                ),
                              if (_model.choiceChipsValue1 == 'Mobile')
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: FlutterFlowChoiceChips(
                                    options: [
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        '1jisxnqm' /* Delivery */,
                                      )),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                        'b1r1l4sp' /* Area */,
                                      ))
                                    ],
                                    onChanged: (val) => safeSetState(() =>
                                        _model.choiceChipsValue3 =
                                            val?.firstOrNull),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                              .secondary,
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                          ),
                                          .primaryText,
                                      iconSize: 18,
                                      elevation: 0,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                              .primaryBackground,
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                          .secondaryText,
                                      iconSize: 18,
                                      elevation: 0,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    chipSpacing: 8,
                                    rowSpacing: 8,
                                    multiselect: false,
                                    alignment: WrapAlignment.center,
                                    controller:
                                        _model.choiceChipsValueController3 ??=
                                            FormFieldController<List<String>>(
                                      [],
                                    ),
                                    wrapped: true,
                                  ),
                                ),
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: TextFormField(
                                  controller: _model.taskTextController1,
                                  focusNode: _model.taskFocusNode1,
                                  autofocus: true,
                                  textCapitalization: TextCapitalization.words,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'smfpapcw' /* Method Name here... */,
                                    ),
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Sora',
                                              .secondaryText,
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                        ),
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                              .error,
                                          fontSize: 12,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                            .alternate,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                            .primary,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    filled: true,
                                        .secondaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16, 20, 16, 20),
                                  ),
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Sora',
                                        fontSize: 18,
                                        letterSpacing: 0.0,
                                      ),
                                  cursorColor:
                                  validator: _model.taskTextController1Validator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'k2fm7n0o' /* Select a place : */,
                                            ),
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (_model.choiceChipsValue1 == 'Local')
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: TextFormField(
                                    controller: _model.taskTextController2,
                                    focusNode: _model.taskFocusNode2,
                                    autofocus: true,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'nrsoolrp' /* Add place details... */,
                                      ),
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Sora',
                                                .secondaryText,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                          ),
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                                .error,
                                            fontSize: 12,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                              .alternate,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                              .primary,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                              .error,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                              .error,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      filled: true,
                                          .secondaryBackground,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 20, 16, 20),
                                    ),
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Sora',
                                          fontSize: 18,
                                          letterSpacing: 0.0,
                                        ),
                                    cursorColor:
                                    validator: _model
                                        .taskTextController2Validator
                                        .asValidator(context),
                                  ),
                                ),
                              Divider(
                                thickness: 1,
                                indent: 24,
                                endIndent: 24,
                                color:
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 12, 0, 12),
                                child: Material(
                                  color: Colors.transparent,
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: const CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      unselectedWidgetColor:
                                              .alternate,
                                    ),
                                    child: CheckboxListTile(
                                      value: _model.checkboxListTileValue ??=
                                          true,
                                      onChanged: (newValue) async {
                                        safeSetState(() => _model
                                            .checkboxListTileValue = newValue!);
                                      },
                                      title: Text(
                                        FFLocalizations.of(context).getText(
                                          '9rahx5w8' /* Terms & Conditions */,
                                        ),
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Sora',
                                              color:
                                                      .secondaryText,
                                              fontSize: 14,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                          .secondaryBackground,
                                      activeColor:
                                      checkColor:
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12, 0, 12, 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 770,
                          ),
                          decoration: const BoxDecoration(),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(8, 12, 0, 0),
                            child: Text(
                              valueOrDefault<String>(
                                _model.taskTextController1.text,
                                'Method name',
                              ),
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Sora',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData(FFLocalizations.of(context).getText(
                                  'kztfr6tv' /* Option 1 */,
                                )),
                                ChipData(FFLocalizations.of(context).getText(
                                  'wfef2681' /* Option 2 */,
                                ))
                              ],
                              onChanged: (val) => safeSetState(
                                  () => _model.choiceChipsValues4 = val),
                              selectedChipStyle: ChipStyle(
                                    .secondaryBackground,
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                                iconSize: 16,
                                elevation: 0,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              unselectedChipStyle: ChipStyle(
                                    .secondaryBackground,
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor:
                                iconSize: 16,
                                elevation: 0,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              chipSpacing: 8,
                              rowSpacing: 8,
                              multiselect: true,
                              initialized: _model.choiceChipsValues4 != null,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController4 ??=
                                  FormFieldController<List<String>>(
                                [],
                              ),
                              wrapped: true,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 0),
                            child: Text(
                              valueOrDefault<String>(
                                _model.taskTextController2.text,
                                'Details',
                              ),
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.explicit,
                                      .secondaryText,
                                  size: 24,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '28xovtww' /* Mar 25 • 3 hr, 32 min */,
                                    ),
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 40,
                                  icon: Icon(
                                    Icons.health_and_safety,
                                        .secondaryText,
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 12, 8, 12),
                                  onPressed: () async {
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    safeSetState(() => _model
                                            .choiceChipsValueController4
                                            ?.value = List.from([
                                          FFLocalizations.of(context).getText(
                                            'kztfr6tv' /* Option 1 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'wfef2681' /* Option 2 */,
                                          )
                                        ]));

                                    await OrderMethodsRecord.collection
                                        .doc()
                                        .set({
                                      ...createOrderMethodsRecordData(
                                        methodPoster: currentUserReference,
                                        methodType: _model.choiceChipsValue1,
                                        methodTag:
                                            _model.taskTextController2.text,
                                        methodName:
                                            _model.taskTextController1.text,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'method_thread':
                                              _model.choiceChipsValues4,
                                        },
                                      ),
                                    });

                                    context.pushNamed(UserpageWidget.routeName);
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'zunbrd0o' /* Add to Order Methods */,
                                  ),
                                  icon: Icon(
                                    Icons.add,
                                        .secondaryBackground,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 24, 0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color:
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 12,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    elevation: 3,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}