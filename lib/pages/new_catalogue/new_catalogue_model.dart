import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'new_catalogue_model.dart';
export 'new_catalogue_model.dart';

class NewCatalogueWidget extends StatefulWidget {
  const NewCatalogueWidget({super.key});

  static String routeName = 'NewCatalogue';
  static String routePath = '/newCatalogue';

  @override
  State<NewCatalogueWidget> createState() => _NewCatalogueWidgetState();
}

class _NewCatalogueWidgetState extends State<NewCatalogueWidget> {
  late NewCatalogueModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewCatalogueModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 12, 8),
              child: FlutterFlowIconButton(
                borderRadius: 12,
                buttonSize: 40,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                      child: PageView(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'tt5rlnz3' /* New Catalogue */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 20,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 8, 8),
                                    child: TextFormField(
                                      controller: _model.taskTextController1,
                                      focusNode: _model.taskFocusNode1,
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          '3k85oz1k' /* Search terms */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Sora',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                            ),
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16, 20, 16, 20),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Sora',
                                            fontSize: 12,
                                            letterSpacing: 0.0,
                                          ),
                                      cursorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Field is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    indent: 12,
                                    endIndent: 12,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'kvbue6ir' /* Select items to include */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 12, 0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'xldej51d' /* 2 */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'nbwgtnjm' /*  /6 */,
                                                  ),
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 12, 8, 0),
                                      child:
                                          StreamBuilder<List<SubmissionRecord>>(
                                        stream: querySubmissionRecord(
                                          queryBuilder: (submissionRecord) =>
                                              submissionRecord
                                                  .where(
                                                    'poster',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  )
                                                  .where(
                                                    'type_object',
                                                    isEqualTo: 'Item',
                                                  )
                                                  .orderBy('date',
                                                      descending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
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
                                          List<SubmissionRecord>
                                              staggeredViewSubmissionRecordList =
                                              snapshot.data!;

                                          return MasonryGridView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                            ),
                                            crossAxisSpacing: 12,
                                            mainAxisSpacing: 8,
                                            itemCount:
                                                staggeredViewSubmissionRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, staggeredViewIndex) {
                                              final staggeredViewSubmissionRecord =
                                                  staggeredViewSubmissionRecordList[
                                                      staggeredViewIndex];
                                              return StreamBuilder<
                                                  SubmissionRecord>(
                                                stream: SubmissionRecord
                                                    .getDocument(
                                                        staggeredViewSubmissionRecord
                                                            .reference),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
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

                                                  final objectSubmissionRecord =
                                                      snapshot.data!;

                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Container(
                                                      width: 100,
                                                      height: 240,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxHeight: 320,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 5,
                                                            color: Color(
                                                                0x3416202A),
                                                            offset: Offset(
                                                              0.0,
                                                              3,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          if (true /* Warning: Trying to access variable not yet defined. */)
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                final images =
                                                                    staggeredViewSubmissionRecord
                                                                        .imagesextra
                                                                        .map((e) =>
                                                                            e)
                                                                        .toList();

                                                                return SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .stretch,
                                                                    children: List.generate(
                                                                        images
                                                                            .length,
                                                                        (imagesIndex) {
                                                                      final imagesItem =
                                                                          images[
                                                                              imagesIndex];
                                                                      return Visibility(
                                                                        visible: imagesItem !=
                                                                                null &&
                                                                            imagesItem !=
                                                                                '',
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                          child:
                                                                              Image.network(
                                                                            imagesItem,
                                                                            width:
                                                                                200,
                                                                            height:
                                                                                100,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1, 1),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              child: Container(
                                                                width: 70,
                                                                height: 40,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              4),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .toll,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            16,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          staggeredViewSubmissionRecord
                                                                              .refvalue,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1, -1),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4),
                                                              child: Theme(
                                                                data: ThemeData(
                                                                  checkboxTheme:
                                                                      CheckboxThemeData(
                                                                    visualDensity:
                                                                        VisualDensity
                                                                            .standard,
                                                                    materialTapTargetSize:
                                                                        MaterialTapTargetSize
                                                                            .padded,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                  ),
                                                                  unselectedWidgetColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                ),
                                                                child: Checkbox(
                                                                  value: _model
                                                                          .checkboxValueMap[
                                                                      staggeredViewSubmissionRecord] ??= false,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.checkboxValueMap[staggeredViewSubmissionRecord] =
                                                                            newValue!);
                                                                    if (newValue!) {
                                                                      _model.addToItemlist(
                                                                          objectSubmissionRecord
                                                                              .reference);
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  side:
                                                                      BorderSide(
                                                                    width: 2,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  checkColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1, 0),
                                    child: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 100,
                                        buttonSize: 46,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: Icon(
                                          Icons.navigate_next_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                        onPressed: () async {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(12),
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
                                          's6387byi' /* Catalogue title... */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Sora',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 18,
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontSize: 12,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16, 20, 16, 20),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Sora',
                                            fontSize: 18,
                                            letterSpacing: 0.0,
                                          ),
                                      cursorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Field is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 12, 8, 0),
                                      child:
                                          StreamBuilder<List<SubmissionRecord>>(
                                        stream: querySubmissionRecord(
                                          queryBuilder: (submissionRecord) =>
                                              submissionRecord
                                                  .where(
                                                    'poster',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  )
                                                  .where(
                                                    'type_object',
                                                    isEqualTo: 'Item',
                                                  )
                                                  .orderBy('date',
                                                      descending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
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
                                          List<SubmissionRecord>
                                              listViewSubmissionRecordList =
                                              snapshot.data!;

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewSubmissionRecordList
                                                    .length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 8),
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewSubmissionRecord =
                                                  listViewSubmissionRecordList[
                                                      listViewIndex];
                                              return StreamBuilder<
                                                  SubmissionRecord>(
                                                stream: SubmissionRecord
                                                    .getDocument(
                                                        listViewSubmissionRecord
                                                            .reference),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
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

                                                  final objectSubmissionRecord =
                                                      snapshot.data!;

                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Container(
                                                      width: 100,
                                                      height: 100,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxHeight: 320,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 5,
                                                            color: Color(
                                                                0x3416202A),
                                                            offset: Offset(
                                                              0.0,
                                                              3,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          if (true /* Warning: Trying to access variable not yet defined. */)
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                final images =
                                                                    listViewSubmissionRecord
                                                                        .imagesextra
                                                                        .map((e) =>
                                                                            e)
                                                                        .toList();

                                                                return SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .stretch,
                                                                    children: List.generate(
                                                                        images
                                                                            .length,
                                                                        (imagesIndex) {
                                                                      final imagesItem =
                                                                          images[
                                                                              imagesIndex];
                                                                      return Visibility(
                                                                        visible: imagesItem !=
                                                                                null &&
                                                                            imagesItem !=
                                                                                '',
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(12),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                            child:
                                                                                Image.network(
                                                                              imagesItem,
                                                                              width: 100,
                                                                              height: 100,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1, 1),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              child: Container(
                                                                width: 70,
                                                                height: 40,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              4),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .toll,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            16,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listViewSubmissionRecord
                                                                              .refvalue,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1, -1),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(12),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '5m3j3ego' /* Hello World */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 12),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }

                                        await CatalogueRecord.collection
                                            .doc()
                                            .set(createCatalogueRecordData(
                                              userRef: currentUserReference,
                                              catalalogueName: _model
                                                  .taskTextController2.text,
                                              items: _model.itemlist,
                                            ));

                                        context.goNamed(
                                          UserpageWidget.routeName,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .bottomToTop,
                                            ),
                                          },
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'bi5xuenz' /* Add catalogue */,
                                      ),
                                      icon: Icon(
                                        Icons.add,
                                        color: