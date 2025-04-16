import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'verification_model.dart';
export 'verification_model.dart';

class VerificationWidget extends StatefulWidget {
  const VerificationWidget({super.key});

  static String routeName = 'Verification';
  static String routePath = '/verification';

  @override
  State<VerificationWidget> createState() => _VerificationWidgetState();
}

class _VerificationWidgetState extends State<VerificationWidget> {
  late VerificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificationModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.pinCodeFocusNode ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

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
                icon: Icon(
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 11,
                child: SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                        child: PageView(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        width: double.infinity,
                                        height: 200,
                                        decoration: BoxDecoration(
                                              .alternate,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 4),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(12, 16, 12, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .mail_outline_outlined,
                                                      color:
                                                                  context)
                                                              .secondary,
                                                      size: 32,
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    8, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '39xfv8gr' /* Main contact tags */,
                                                              ),
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    color: const Color(
                                                                        0xFF14181B),
                                                                    fontSize:
                                                                        16,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'wu0rvc5g' /* Secondary text */,
                                                                ),
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Plus Jakarta Sans',
                                                                      color: const Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          12,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 4, 0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            const Color(0xFFE0E3E7),
                                                        borderRadius: 8,
                                                        borderWidth: 2,
                                                        buttonSize: 40,
                                                        icon: const Icon(
                                                          Icons.sync,
                                                          color:
                                                              Color(0xFF57636C),
                                                          size: 20,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                    ),
                                                  ]
                                                      .addToStart(
                                                          const SizedBox(width: 8))
                                                      .addToEnd(
                                                          const SizedBox(width: 8)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 16, 16),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 160,
                                                  decoration: BoxDecoration(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(12),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController1,
                                                            focusNode: _model
                                                                .textFieldFocusNode1,
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelStyle:
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'bvxyhfyy' /* Enter main mail account. */,
                                                              ),
                                                              hintStyle:
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                          context)
                                                                      .alternate,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                          context)
                                                                      .error,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                          context)
                                                                      .error,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              filled: true,
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                            cursorColor:
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .textController1Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController2,
                                                            focusNode: _model
                                                                .textFieldFocusNode2,
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelStyle:
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '7f2kh3ik' /* Enter phone number. */,
                                                              ),
                                                              hintStyle:
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                          context)
                                                                      .alternate,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                          context)
                                                                      .error,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                          context)
                                                                      .error,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              filled: true,
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                            cursorColor:
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .textController2Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                          onPressed: () async {
                                                            await authManager
                                                                .sendEmailVerification();
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'yzti4w19' /* Get codes */,
                                                          ),
                                                          icon: const Icon(
                                                            Icons.sms_outlined,
                                                            size: 15,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16,
                                                                        0,
                                                                        16,
                                                                        0),
                                                            iconAlignment:
                                                                IconAlignment
                                                                    .end,
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                    .of(context)
                                                                .secondary,
                                                            textStyle:
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(height: 8)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(16),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(12),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .key_rounded,
                                                                        context)
                                                                    .secondary,
                                                                size: 32,
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          8,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'acpsgxy7' /* Enter code recieved */,
                                                                        ),
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              fontSize: 16,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Lottie
                                                                      .network(
                                                                    'https://lottie.host/2498d03a-d775-4d85-8b19-bba628542fe7/Tp1aSFKrW9.json',
                                                                    width: 200,
                                                                    height: 200,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    animate:
                                                                        true,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child:
                                                                PinCodeTextField(
                                                              autoDisposeControllers:
                                                                  false,
                                                              appContext:
                                                                  context,
                                                              length: 8,
                                                              textStyle:
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              enableActiveFill:
                                                                  false,
                                                              autoFocus: true,
                                                              focusNode: _model
                                                                  .pinCodeFocusNode,
                                                              enablePinAutofill:
                                                                  false,
                                                              errorTextSpace:
                                                                  16,
                                                              showCursor: false,
                                                              cursorColor:
                                                                          context)
                                                                      .primary,
                                                              obscureText:
                                                                  false,
                                                              hintCharacter:
                                                                  '*',
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              pinTheme:
                                                                  PinTheme(
                                                                fieldHeight: 24,
                                                                fieldWidth: 18,
                                                                borderWidth: 2,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          12),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          12),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          12),
                                                                ),
                                                                shape: PinCodeFieldShape
                                                                    .underline,
                                                                activeColor:
                                                                            context)
                                                                        .primaryText,
                                                                inactiveColor:
                                                                            context)
                                                                        .alternate,
                                                                selectedColor:
                                                                            context)
                                                                        .primary,
                                                              ),
                                                              controller: _model
                                                                  .pinCodeController,
                                                              onChanged: (_) {},
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                              validator: _model
                                                                  .pinCodeControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                            onPressed:
                                                                () async {
                                                              await _model
                                                                  .pageViewController
                                                                  ?.nextPage(
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'vnbwesbi' /* Verify */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          0,
                                                                          16,
                                                                          0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                      .of(context)
                                                                  .secondary,
                                                              textStyle:
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 8)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16, 24, 16, 4),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      decoration: BoxDecoration(
                                            .alternate,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                          context)
                                                      .secondary,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8),
                                                    child: Icon(
                                                      Icons.mail_outline,
                                                      color:
                                                                  context)
                                                              .info,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'ztdch1jj' /* Contact sync */,
                                                            ),
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  fontSize: 18,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      4, 12, 0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'vb9kdi56' /* Enable authentication by synci... */,
                                                            ),
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: 12,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_back,
                                                          context)
                                                      .primaryText,
                                                  size: 24,
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
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        width: double.infinity,
                                        height: 200,
                                        decoration: BoxDecoration(
                                              .alternate,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(12, 16, 12, 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .person_search_outlined,
                                                            context)
                                                        .secondary,
                                                    size: 32,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 0, 8, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'itdwxm77' /* I.D. Submission */,
                                                            ),
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: const Color(
                                                                      0xFF14181B),
                                                                  fontSize: 16,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'esiberkj' /* Document */,
                                                              ),
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    color: const Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        12,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 16, 16),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(12),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              border:
                                                                  Border.all(
                                                                        context)
                                                                    .alternate,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  child: Image
                                                                      .network(
                                                                    _model
                                                                        .uploadedFileUrl1,
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .fitHeight,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          1, 1),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(8),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        if (_model.uploadedFileUrl1 !=
                                                                                '')
                                                                          FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                12,
                                                                            buttonSize:
                                                                                40,
                                                                            fillColor:
                                                                            icon:
                                                                                Icon(
                                                                              Icons.delete_outlined,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              safeSetState(() {
                                                                                _model.isDataUploading1 = false;
                                                                                _model.uploadedLocalFile1 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                _model.uploadedFileUrl1 = '';
                                                                              });
                                                                            },
                                                                          ),
                                                                        if (_model.uploadedFileUrl1 ==
                                                                                '')
                                                                            onPressed:
                                                                                () async {
                                                                              final selectedMedia = await selectMedia(
                                                                                mediaSource: MediaSource.photoGallery,
                                                                                multiImage: false,
                                                                              );
                                                                              if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                safeSetState(() => _model.isDataUploading1 = true);
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
                                                                                  _model.isDataUploading1 = false;
                                                                                }
                                                                                if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                  safeSetState(() {
                                                                                    _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                                                                                    _model.uploadedFileUrl1 = downloadUrls.first;
                                                                                  });
                                                                                } else {
                                                                                  safeSetState(() {});
                                                                                  return;
                                                                                }
                                                                              }
                                                                            },
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              '7cr0nik2' /* Upload */,
                                                                            ),
                                                                            icon:
                                                                                const Icon(
                                                                              Icons.ios_share_rounded,
                                                                              size: 15,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 40,
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                                                              iconAlignment: IconAlignment.end,
                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                    fontFamily: 'Inter',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController3,
                                                            focusNode: _model
                                                                .textFieldFocusNode3,
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelStyle:
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            12,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '81ohf845' /* I.D. number */,
                                                              ),
                                                              hintStyle:
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            12,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                          context)
                                                                      .alternate,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                          context)
                                                                      .error,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                          context)
                                                                      .error,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              filled: true,
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: 12,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                            cursorColor:
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .textController3Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(height: 8)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.all(16),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(12, 8,
                                                                    12, 8),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .portrait_outlined,
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 32,
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '8onato6t' /* Submit selfie */,
                                                                      ),
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Plus Jakarta Sans',
                                                                            color:
                                                                                const Color(0xFF14181B),
                                                                            fontSize:
                                                                                16,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(12),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              width: 48,
                                                              height: 48,
                                                              decoration:
                                                                  BoxDecoration(
                                                                        context)
                                                                    .accent1,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(2),
                                                                child:
                                                                    AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            40),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.profilePicture,
                                                                          ''),
                                                                      width: 60,
                                                                      height:
                                                                          60,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Stack(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0, 0),
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0, 0),
                                                                  child:
                                                                      Container(
                                                                    width: 120,
                                                                    height: 4,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                              context)
                                                                          .alternate,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 44,
                                                                  height: 44,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                            context)
                                                                        .alternate,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Icon(
                                                                    Icons.route,
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 32,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: 48,
                                                              height: 48,
                                                              decoration:
                                                                  BoxDecoration(
                                                                        context)
                                                                    .accent1,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Stack(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0, 0),
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(2),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              40),
                                                                      child: Image
                                                                          .network(
                                                                        _model
                                                                            .uploadedFileUrl2,
                                                                        width:
                                                                            40,
                                                                        height:
                                                                            40,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderRadius:
                                                                          100,
                                                                      buttonSize:
                                                                          40,
                                                                      fillColor:
                                                                              .alternate,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .photo_camera_front_outlined,
                                                                            .secondaryText,
                                                                        size:
                                                                            24,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        final selectedMedia =
                                                                            await selectMedia(
                                                                          multiImage:
                                                                              false,
                                                                        );
                                                                        if (selectedMedia !=
                                                                                null &&
                                                                            selectedMedia.every((m) =>
                                                                                validateFileFormat(m.storagePath, context))) {
                                                                          safeSetState(() =>
                                                                              _model.isDataUploading2 = true);
                                                                          var selectedUploadedFiles =
                                                                              <FFUploadedFile>[];

                                                                          var downloadUrls =
                                                                              <String>[];
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
                                                                            _model.isDataUploading2 =
                                                                                false;
                                                                          }
                                                                          if (selectedUploadedFiles.length == selectedMedia.length &&
                                                                              downloadUrls.length == selectedMedia.length) {
                                                                            safeSetState(() {
                                                                              _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                                                                              _model.uploadedFileUrl2 = downloadUrls.first;
                                                                            });
                                                                          } else {
                                                                            safeSetState(() {});
                                                                            return;
                                                                          }
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 16)),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(12),
                                                          onPressed: () async {
                                                            if (() {
                                                              if (_model.uploadedFileUrl1 !=
                                                                      '') {
                                                                return true;
                                                              } else if (_model.uploadedFileUrl2 !=
                                                                      '') {
                                                                return true;
                                                              } else {
                                                                return false;
                                                              }
                                                            }()) {
                                                              await _model
                                                                  .pageViewController
                                                                  ?.nextPage(
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Please submit the requested data to proceed.',
                                                                    style:
                                                                        TextStyle(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            }
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'iy3hzx83' /* Verify */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16,
                                                                        0,
                                                                        16,
                                                                        0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                    .of(context)
                                                                .secondary,
                                                            textStyle:
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 8)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16, 24, 16, 4),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      decoration: BoxDecoration(
                                            .alternate,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                          context)
                                                      .secondary,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8),
                                                    child: Icon(
                                                      Icons
                                                          .verified_user_rounded,
                                                      color:
                                                                  context)
                                                              .info,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'peu1x8vq' /* User verification */,
                                                            ),
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  fontSize: 18,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      4, 12, 0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'r979cvs0' /* Enable authentication by subit... */,
                                                            ),
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: 12,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
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
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        width: double.infinity,
                                        height: 200,
                                        decoration: BoxDecoration(
                                              .alternate,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(12, 16, 12, 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.map_outlined,
                                                            context)
                                                        .secondary,
                                                    size: 32,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 0, 8, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'c5oin773' /* Location Tags */,
                                                            ),
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: const Color(
                                                                      0xFF14181B),
                                                                  fontSize: 16,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'zlx06ngl' /* Secondary text */,
                                                              ),
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    color: const Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        12,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                                    .addToStart(
                                                        const SizedBox(width: 8))
                                                    .addToEnd(
                                                        const SizedBox(width: 8)),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 16, 16),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12,
                                                                      12,
                                                                      12,
                                                                      8),
                                                          child:
                                                              FlutterFlowChoiceChips(
                                                            options: [
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '65x6enbv' /* Baruta */,
                                                              )),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'ngyyhg78' /* Chacao */,
                                                              )),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '2dyrnkl0' /* El Hatillo */,
                                                              )),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'pagq8stg' /* Libertador */,
                                                              )),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'xale90ax' /* Sucre */,
                                                              ))
                                                            ],
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.choiceChipsValue1 =
                                                                        val?.firstOrNull),
                                                            selectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                          context)
                                                                      .secondary,
                                                              textStyle:
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                            .info,
                                                                        fontSize:
                                                                            12,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              iconColor:
                                                                          context)
                                                                      .info,
                                                              iconSize: 16,
                                                              elevation: 0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            unselectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                          context)
                                                                      .alternate,
                                                              textStyle:
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                      .of(context)
                                                                  .secondaryText,
                                                              iconSize: 16,
                                                              elevation: 0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            chipSpacing: 8,
                                                            rowSpacing: 8,
                                                            multiselect: false,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            controller: _model
                                                                    .choiceChipsValueController1 ??=
                                                                FormFieldController<
                                                                    List<
                                                                        String>>(
                                                              [],
                                                            ),
                                                            wrapped: true,
                                                          ),
                                                        ),
                                                        if (_model
                                                                .choiceChipsValue1 ==
                                                            'Baruta')
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    12),
                                                            child:
                                                                FlutterFlowChoiceChips(
                                                              options: [
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'y7pi43tk' /* Baruta */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '0xozg9hy' /* El Cafetal */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '3lpa0rgw' /* Las Minas */,
                                                                ))
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.choiceChipsValue2 =
                                                                          val?.firstOrNull),
                                                              selectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                            context)
                                                                        .secondary,
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                              context)
                                                                          .info,
                                                                      fontSize:
                                                                          12,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                iconColor:
                                                                            context)
                                                                        .info,
                                                                iconSize: 16,
                                                                elevation: 0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              unselectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                            context)
                                                                        .alternate,
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                        context)
                                                                    .secondaryText,
                                                                iconSize: 16,
                                                                elevation: 0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              chipSpacing: 8,
                                                              rowSpacing: 8,
                                                              multiselect:
                                                                  false,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              controller: _model
                                                                      .choiceChipsValueController2 ??=
                                                                  FormFieldController<
                                                                      List<
                                                                          String>>(
                                                                [],
                                                              ),
                                                              wrapped: true,
                                                            ),
                                                          ),
                                                        if (_model
                                                                .choiceChipsValue1 ==
                                                            'Chacao')
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12,
                                                                        0,
                                                                        12,
                                                                        0),
                                                            child:
                                                                FlutterFlowChoiceChips(
                                                              options: [
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'w34hznip' /* Altamira */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '292k5g0d' /* Bello Campo */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'wlot97hf' /* Campo Alegre */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'zyu0ahkw' /* Chacao */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'rzw1ufe4' /* Chuao */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '6jxinyb1' /* Country Club */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'ul8grgmr' /* El Bosque */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'lox63mg1' /* El Dorado */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '0xmvvp5u' /* Pedregal */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'mdn44iag' /* El Retiro */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '10ba4g90' /* El Rosal */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'cx5ahryd' /* Estado Leal */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'ca3u9fou' /* La Castellana */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '47lkjfl5' /* La Floresta */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '9e889g14' /* Los Palos Grandes */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '5smfkaaz' /* San Marino */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'jry70nh8' /* Chacaito */,
                                                                ))
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.choiceChipsValue3 =
                                                                          val?.firstOrNull),
                                                              selectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                            context)
                                                                        .secondary,
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                              context)
                                                                          .info,
                                                                      fontSize:
                                                                          12,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                iconColor:
                                                                            context)
                                                                        .info,
                                                                iconSize: 16,
                                                                elevation: 0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              unselectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                            context)
                                                                        .alternate,
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                        context)
                                                                    .secondaryText,
                                                                iconSize: 16,
                                                                elevation: 0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              chipSpacing: 8,
                                                              rowSpacing: 8,
                                                              multiselect:
                                                                  false,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              controller: _model
                                                                      .choiceChipsValueController3 ??=
                                                                  FormFieldController<
                                                                      List<
                                                                          String>>(
                                                                [],
                                                              ),
                                                              wrapped: true,
                                                            ),
                                                          ),
                                                        if (_model
                                                                .choiceChipsValue1 ==
                                                            'El Hatillo')
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    12),
                                                            child:
                                                                FlutterFlowChoiceChips(
                                                              options: [
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'keogftap' /* El Hatillo */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'n3id31a1' /* La Union */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'yno0igh3' /* La Lagunita */,
                                                                ))
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.choiceChipsValue4 =
                                                                          val?.firstOrNull),
                                                              selectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                            context)
                                                                        .secondary,
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                              context)
                                                                          .info,
                                                                      fontSize:
                                                                          12,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                iconColor:
                                                                            context)
                                                                        .info,
                                                                iconSize: 16,
                                                                elevation: 0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              unselectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                            context)
                                                                        .alternate,
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                        context)
                                                                    .secondaryText,
                                                                iconSize: 16,
                                                                elevation: 0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              chipSpacing: 8,
                                                              rowSpacing: 8,
                                                              multiselect:
                                                                  false,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              controller: _model
                                                                      .choiceChipsValueController4 ??=
                                                                  FormFieldController<
                                                                      List<
                                                                          String>>(
                                                                [],
                                                              ),
                                                              wrapped: true,
                                                            ),
                                                          ),
                                                        if (_model
                                                                .choiceChipsValue1 ==
                                                            'Libertador')
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    12),
                                                            child:
                                                                FlutterFlowChoiceChips(
                                                              options: [
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  't9ctac3z' /* Altagracia */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'yjzs2n0g' /* Antimano */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '3zjhn5va' /* Caricuao */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '9j8wj5fd' /* Catedral */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'nnhv8ol3' /* Coche */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'ta2cs9c6' /* El Junquito */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'dqxlocri' /* El Paraiso */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '08i1u7z2' /* El Recreo */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'k9j9lxtk' /* El Valle */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '8cnjn9r0' /* La Candelaria */,
                                                                ))
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.choiceChipsValue5 =
                                                                          val?.firstOrNull),
                                                              selectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                            context)
                                                                        .secondary,
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                              context)
                                                                          .info,
                                                                      fontSize:
                                                                          12,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                iconColor:
                                                                            context)
                                                                        .info,
                                                                iconSize: 16,
                                                                elevation: 0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              unselectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                            context)
                                                                        .alternate,
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                        context)
                                                                    .secondaryText,
                                                                iconSize: 16,
                                                                elevation: 0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              chipSpacing: 8,
                                                              rowSpacing: 8,
                                                              multiselect:
                                                                  false,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              controller: _model
                                                                      .choiceChipsValueController5 ??=
                                                                  FormFieldController<
                                                                      List<
                                                                          String>>(
                                                                [],
                                                              ),
                                                              wrapped: true,
                                                            ),
                                                          ),
                                                        if (_model
                                                                .choiceChipsValue1 ==
                                                            'Sucre')
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    12),
                                                            child:
                                                                FlutterFlowChoiceChips(
                                                              options: [
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '8xbvc7p9' /* Sucre */,
                                                                ))
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.choiceChipsValue6 =
                                                                          val?.firstOrNull),
                                                              selectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                            context)
                                                                        .secondary,
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                              context)
                                                                          .info,
                                                                      fontSize:
                                                                          12,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                iconColor:
                                                                            context)
                                                                        .info,
                                                                iconSize: 16,
                                                                elevation: 0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              unselectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                            context)
                                                                        .alternate,
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                        context)
                                                                    .secondaryText,
                                                                iconSize: 16,
                                                                elevation: 0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              chipSpacing: 8,
                                                              rowSpacing: 8,
                                                              multiselect:
                                                                  false,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              controller: _model
                                                                      .choiceChipsValueController6 ??=
                                                                  FormFieldController<
                                                                      List<
                                                                          String>>(
                                                                [],
                                                              ),
                                                              wrapped: true,
                                                            ),
                                                          ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    12),
                                                            child: Container(
                                                              width: 100,
                                                              height: 100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                border:
                                                                    Border.all(
                                                                          context)
                                                                      .alternate,
                                                                  width: 1,
                                                                ),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    child: Image
                                                                        .network(
                                                                      _model
                                                                          .uploadedFileUrl3,
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0,
                                                                            1),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: [
                                                                          if (_model.uploadedFileUrl3 != '')
                                                                            FlutterFlowIconButton(
                                                                              borderRadius: 12,
                                                                              buttonSize: 40,
                                                                              icon: Icon(
                                                                                Icons.delete_outlined,
                                                                              ),
                                                                              onPressed: () async {
                                                                                safeSetState(() {
                                                                                  _model.isDataUploading1 = false;
                                                                                  _model.uploadedLocalFile1 = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                  _model.uploadedFileUrl1 = '';
                                                                                });
                                                                              },
                                                                            ),
                                                                          if (_model.uploadedFileUrl3 == '')
                                                                              onPressed: () async {
                                                                                final selectedMedia = await selectMedia(
                                                                                  mediaSource: MediaSource.photoGallery,
                                                                                  multiImage: false,
                                                                                );
                                                                                if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                  safeSetState(() => _model.isDataUploading3 = true);
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
                                                                                    _model.isDataUploading3 = false;
                                                                                  }
                                                                                  if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                    safeSetState(() {
                                                                                      _model.uploadedLocalFile3 = selectedUploadedFiles.first;
                                                                                      _model.uploadedFileUrl3 = downloadUrls.first;
                                                                                    });
                                                                                  } else {
                                                                                    safeSetState(() {});
                                                                                    return;
                                                                                  }
                                                                                }
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'vg5kkj61' /* Set location image */,
                                                                              ),
                                                                              icon: const Icon(
                                                                                Icons.ios_share_rounded,
                                                                                size: 15,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 40,
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                                                                iconAlignment: IconAlignment.end,
                                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                      fontFamily: 'Inter',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                elevation: 0,
                                                                                borderSide: BorderSide(
                                                                                  width: 1,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.all(4),
                                                            onPressed:
                                                                () async {
                                                              await currentUserReference!
                                                                  .update(
                                                                      createUsersRecordData(
                                                                userVerifiedPending:
                                                                    true,
                                                              ));

                                                              context.pushNamed(
                                                                  UserpageWidget
                                                                      .routeName);
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '93x5e4ov' /* Verify */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          0,
                                                                          16,
                                                                          0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                      .of(context)
                                                                  .secondary,
                                                              textStyle:
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16, 24, 16, 4),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      decoration: BoxDecoration(
                                            .alternate,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                          context)
                                                      .secondary,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8),
                                                    child: Icon(
                                                      Icons.location_on,
                                                      color:
                                                                  context)
                                                              .info,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '3paa0qf2' /* Activity Sync */,
                                                            ),
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Sora',
                                                                  fontSize: 18,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      4, 12, 0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '5pbya5zw' /* Enable activity by fixing loca... */,
                                                            ),
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: 12,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
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
                          ],
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            count: 3,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) async {
                              await _model.pageViewController!.animateToPage(
                                i,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              safeSetState(() {});
                            },
                            effect: smooth_page_indicator.ExpandingDotsEffect(
                              expansionFactor: 2,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 16,
                              dotHeight: 4,
                              activeDotColor:
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
