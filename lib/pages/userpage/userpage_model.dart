import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/catalogue/catalogue_widget.dart';
import '/components/settings/settings_widget.dart';
import '/components/user_object/user_object_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import 'userpage_model.dart';
export 'userpage_model.dart';

class UserpageWidget extends StatefulWidget {
  const UserpageWidget({super.key});

  static String routeName = 'Userpage';
  static String routePath = '/Userpage';

  @override
  State<UserpageWidget> createState() => _UserpageWidgetState();
}

class _UserpageWidgetState extends State<UserpageWidget>
    with TickerProviderStateMixin {
  late UserpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserpageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 1170,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(currentUserReference!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }

                          final userProfileContainerUsersRecord =
                              snapshot.data!;

                          return Container(
                            width: double.infinity,
                            height: 240,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(12),
                              shape: BoxShape.rectangle,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  child: Opacity(
                                    opacity: userProfileContainerUsersRecord
                                                    .banner !=
                                                null &&
                                            userProfileContainerUsersRecord
                                                    .banner !=
                                                ''
                                        ? 1.0
                                        : 0.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                      child: Image.network(
                                        userProfileContainerUsersRecord.banner,
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              StreamBuilder<UsersRecord>(
                                                stream: UsersRecord.getDocument(
                                                    currentUserReference!),
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

                                                  final containerUsersRecord =
                                                      snapshot.data!;

                                                  return Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Opacity(
                                                      opacity: containerUsersRecord
                                                                      .profilePicture !=
                                                                  null &&
                                                              containerUsersRecord
                                                                      .profilePicture !=
                                                                  ''
                                                          ? 1.0
                                                          : 0.0,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        child: Container(
                                                          width: 100,
                                                          height: 100,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            userProfileContainerUsersRecord
                                                                .profilePicture,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: valueOrDefault(
                                                            currentUserDocument
                                                                ?.name,
                                                            ''),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'x28kyi58' /*   */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text: valueOrDefault(
                                                            currentUserDocument
                                                                ?.surname,
                                                            ''),
                                                        style: TextStyle(),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  valueOrDefault(
                                                      currentUserDocument
                                                          ?.username,
                                                      ''),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: ClipRRect(
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            FlutterFlowChoiceChips(
                                                          options: (currentUserDocument
                                                                      ?.userOccupations
                                                                      ?.toList() ??
                                                                  [])
                                                              .take(3)
                                                              .toList()
                                                              .map((label) =>
                                                                  ChipData(
                                                                      label))
                                                              .toList(),
                                                          onChanged: (((currentUserDocument?.userOccupations
                                                                              ?.toList() ??
                                                                          [])
                                                                      .isNotEmpty) !=
                                                                  null)
                                                              ? null
                                                              : (val) => safeSetState(
                                                                  () => _model
                                                                          .choiceChipsValue1 =
                                                                      val?.firstOrNull),
                                                          selectedChipStyle:
                                                              ChipStyle(
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            iconColor:
                                                                FlutterFlowTheme.of(
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
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          10,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            iconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            iconSize: 16,
                                                            elevation: 0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          chipSpacing: 4,
                                                          rowSpacing: 4,
                                                          multiselect: false,
                                                          alignment:
                                                              WrapAlignment
                                                                  .spaceAround,
                                                          controller: _model
                                                                  .choiceChipsValueController1 ??=
                                                              FormFieldController<
                                                                  List<String>>(
                                                            [],
                                                          ),
                                                          wrapped: true,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 4)),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 1),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 124,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Container(
                                                        width: 100,
                                                        height: 35,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Expanded(
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .tabBarController!
                                                                        .animateTo(
                                                                      2,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              300),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  height: 100,
                                                                  decoration:
                                                                      BoxDecoration(),
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
                                                                            .video_collection,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1,
                                                                            0),
                                                                        child: FutureBuilder<
                                                                            int>(
                                                                          future:
                                                                              _model.itemsCount(
                                                                            requestFn: () =>
                                                                                querySubmissionRecordCount(
                                                                              queryBuilder: (submissionRecord) => submissionRecord
                                                                                  .where(
                                                                                    'poster',
                                                                                    isEqualTo: currentUserReference,
                                                                                  )
                                                                                  .where(
                                                                                    'type_object',
                                                                                    isEqualTo: 'Post',
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            int textCount =
                                                                                snapshot.data!;

                                                                            return Text(
                                                                              valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  textCount,
                                                                                  formatType: FormatType.compact,
                                                                                ),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 16,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 100,
                                                              child:
                                                                  VerticalDivider(
                                                                thickness: 1,
                                                                indent: 8,
                                                                endIndent: 8,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .tabBarController!
                                                                        .animateTo(
                                                                      3,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              300),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  height: 100,
                                                                  decoration:
                                                                      BoxDecoration(),
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
                                                                            .shopping_bag_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                      FutureBuilder<
                                                                          int>(
                                                                        future:
                                                                            _model.itemPosts(
                                                                          requestFn: () =>
                                                                              querySubmissionRecordCount(
                                                                            queryBuilder: (submissionRecord) => submissionRecord
                                                                                .where(
                                                                                  'poster',
                                                                                  isEqualTo: currentUserReference,
                                                                                )
                                                                                .where(
                                                                                  'type_object',
                                                                                  isEqualTo: 'Item',
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50,
                                                                                height: 50,
                                                                                child: CircularProgressIndicator(
                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          int textCount =
                                                                              snapshot.data!;

                                                                          return Text(
                                                                            valueOrDefault<String>(
                                                                              formatNumber(
                                                                                textCount,
                                                                                formatType: FormatType.compact,
                                                                              ),
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 16,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          width: 100,
                                                          height: 35,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context.pushNamed(
                                                                          PinnedUsersWidget
                                                                              .routeName);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          100,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.people,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                          Divider(
                                                                            thickness:
                                                                                2,
                                                                            indent:
                                                                                12,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              formatNumber(
                                                                                userProfileContainerUsersRecord.pinnedUsers.length,
                                                                                formatType: FormatType.compact,
                                                                              ),
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 16,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context.pushNamed(
                                                                          PinnedObjectsWidget
                                                                              .routeName);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          100,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.category_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                          Divider(
                                                                            thickness:
                                                                                2,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          ),
                                                                          FutureBuilder<
                                                                              int>(
                                                                            future:
                                                                                querySubmissionRecordCount(
                                                                              queryBuilder: (submissionRecord) => submissionRecord.where(
                                                                                'pins',
                                                                                arrayContains: currentUserReference,
                                                                              ),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              int textCount = snapshot.data!;

                                                                              return Text(
                                                                                valueOrDefault<String>(
                                                                                  textCount.toString(),
                                                                                  '0',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 16,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context.pushNamed(
                                                                          HashingpageWidget
                                                                              .routeName);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          100,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.link_outlined,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                          Divider(
                                                                            thickness:
                                                                                2,
                                                                            endIndent:
                                                                                12,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'g67c2sxv' /* 0 */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 16,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
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
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 8)),
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
                                  alignment: AlignmentDirectional(1, -1),
                                  child: Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsets.all(12),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 100,
                                        buttonSize: 35,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: Icon(
                                          Icons.settings_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 18,
                                        ),
                                        onPressed: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment:
                                                    AlignmentDirectional(0, 0)
                                                        .resolve(
                                                            Directionality.of(
                                                                context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: SettingsWidget(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(-1, 0),
                              child: FlutterFlowButtonTabBar(
                                useToggleButtonStyle: true,
                                isScrollable: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      letterSpacing: 0.0,
                                    ),
                                unselectedLabelStyle: TextStyle(),
                                labelColor:
                                    FlutterFlowTheme.of(context).primary,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                backgroundColor:
                                    FlutterFlowTheme.of(context).accent1,
                                unselectedBackgroundColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 0,
                                borderRadius: 12,
                                elevation: 0,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                buttonMargin:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                tabs: [
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'imxgzxx9' /* Orders */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'uyq9twej' /* Analytics */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'nuvjz7is' /* Posts */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'vrwv3ph2' /* Items */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      '7c1vetmk' /* Wallet */,
                                    ),
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [
                                    () async {},
                                    () async {},
                                    () async {},
                                    () async {},
                                    () async {}
                                  ][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 4, 0),
                                            child: Container(
                                              width: 100,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child:
                                                        FlutterFlowChoiceChips(
                                                      options: [
                                                        ChipData(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'obmdky6k' /* Inbox */,
                                                            ),
                                                            Icons
                                                                .move_to_inbox),
                                                        ChipData(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'f1esz34w' /* Sent */,
                                                            ),
                                                            Icons
                                                                .outbox_rounded),
                                                        ChipData(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'tmh1sj9i' /* Methods */,
                                                            ),
                                                            Icons.library_books)
                                                      ],
                                                      onChanged: (val) =>
                                                          safeSetState(() => _model
                                                                  .choiceChipsOrdersValue =
                                                              val?.firstOrNull),
                                                      selectedChipStyle:
                                                          ChipStyle(
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        iconSize: 16,
                                                        elevation: 0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      unselectedChipStyle:
                                                          ChipStyle(
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        iconSize: 16,
                                                        elevation: 0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      chipSpacing: 8,
                                                      rowSpacing: 8,
                                                      multiselect: false,
                                                      initialized: _model
                                                              .choiceChipsOrdersValue !=
                                                          null,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      controller: _model
                                                              .choiceChipsOrdersValueController ??=
                                                          FormFieldController<
                                                              List<String>>(
                                                        [
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'isnxbf2n' /* Inbox */,
                                                          )
                                                        ],
                                                      ),
                                                      wrapped: true,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          if (_model.choiceChipsOrdersValue ==
                                              'Inbox')
                                            Padding(
                                              padding: EdgeInsets.all(8),
                                              child: StreamBuilder<
                                                  List<OrderRecord>>(
                                                stream: queryOrderRecord(
                                                  queryBuilder: (orderRecord) =>
                                                      orderRecord
                                                          .where(
                                                            'publicuser_ref',
                                                            isEqualTo:
                                                                currentUserReference,
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<OrderRecord>
                                                      listViewOrderRecordList =
                                                      snapshot.data!;

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewOrderRecordList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 8),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewOrderRecord =
                                                          listViewOrderRecordList[
                                                              listViewIndex];
                                                      return Visibility(
                                                        visible:
                                                            !listViewOrderRecord
                                                                .orderCompleted,
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              OrderpageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'orderparameter':
                                                                    serializeParam(
                                                                  listViewOrderRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'orderparameter':
                                                                    listViewOrderRecord,
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 100,
                                                            height: 120,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(12),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      width: 48,
                                                                      height:
                                                                          48,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(2),
                                                                        child: StreamBuilder<
                                                                            UsersRecord>(
                                                                          stream:
                                                                              UsersRecord.getDocument(listViewOrderRecord.userRef!),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }

                                                                            final circleImageUsersRecord =
                                                                                snapshot.data!;

                                                                            return Container(
                                                                              width: 48,
                                                                              height: 48,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Image.network(
                                                                                circleImageUsersRecord.profilePicture,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              12,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                                                              child: Text(
                                                                                listViewOrderRecord.username,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 16,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            listViewOrderRecord.reference.id,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 12,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                          RichText(
                                                                            textScaler:
                                                                                MediaQuery.of(context).textScaler,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'f4huv1ys' /* Method:  */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 12,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: listViewIndex.toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 12,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(-1, 1),
                                                                              child: RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'yqgfpnuc' /* Items in order:  */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 14,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        listViewOrderRecord.itemsInorder.length.toString(),
                                                                                        '1',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 16,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            -1),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            dateTimeFormat(
                                                                              "relative",
                                                                              listViewOrderRecord.date!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () {
                                                                          print(
                                                                              'Button pressed ...');
                                                                        },
                                                                        text: listViewOrderRecord
                                                                            .orderStats!
                                                                            .name,
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              28,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16,
                                                                              0,
                                                                              16,
                                                                              0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 12,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          elevation:
                                                                              0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].divide(
                                                                    SizedBox(
                                                                        width:
                                                                            8)),
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
                                          if (_model.choiceChipsOrdersValue ==
                                              'Sent')
                                            Padding(
                                              padding: EdgeInsets.all(8),
                                              child: StreamBuilder<
                                                  List<OrderRecord>>(
                                                stream: queryOrderRecord(
                                                  queryBuilder: (orderRecord) =>
                                                      orderRecord
                                                          .where(
                                                            'user_ref',
                                                            isEqualTo:
                                                                currentUserReference,
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<OrderRecord>
                                                      listViewOrderRecordList =
                                                      snapshot.data!;

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewOrderRecordList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 8),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewOrderRecord =
                                                          listViewOrderRecordList[
                                                              listViewIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            OrderpageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'orderparameter':
                                                                  serializeParam(
                                                                listViewOrderRecord,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'orderparameter':
                                                                  listViewOrderRecord,
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          width: 100,
                                                          height: 120,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: 40,
                                                                    height: 40,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              2),
                                                                      child: StreamBuilder<
                                                                          UsersRecord>(
                                                                        stream:
                                                                            UsersRecord.getDocument(listViewOrderRecord.publicuserRef!),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50,
                                                                                height: 50,
                                                                                child: CircularProgressIndicator(
                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }

                                                                          final circleImageUsersRecord =
                                                                              snapshot.data!;

                                                                          return Container(
                                                                            width:
                                                                                40,
                                                                            height:
                                                                                40,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              circleImageUsersRecord.profilePicture,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1, -1),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                                                              child: Text(
                                                                                listViewOrderRecord.publicusername,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 16,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              RichText(
                                                                            textScaler:
                                                                                MediaQuery.of(context).textScaler,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'wdxw6z6m' /* Method:  */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 12,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: listViewIndex.toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 12,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              RichText(
                                                                            textScaler:
                                                                                MediaQuery.of(context).textScaler,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'bspe9z7u' /* Total:  */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: listViewOrderRecord.totalRefValue.toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 16,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              -1),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          dateTimeFormat(
                                                                            "relative",
                                                                            listViewOrderRecord.date!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          listViewOrderRecord
                                                                              .orderStats
                                                                              ?.name,
                                                                          'status',
                                                                        ),
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
                                                              ]
                                                                  .divide(
                                                                      SizedBox(
                                                                          width:
                                                                              8))
                                                                  .addToStart(
                                                                      SizedBox(
                                                                          width:
                                                                              12))
                                                                  .addToEnd(
                                                                      SizedBox(
                                                                          width:
                                                                              12)),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          if (_model.choiceChipsOrdersValue ==
                                              'Methods')
                                            Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Container(
                                                width: 300,
                                                height: 460,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0,
                                                        2,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 8, 12),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(12),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'lymz2vnh' /* P2P Order Method(s) */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            14,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 4)),
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 100,
                                                              buttonSize: 30,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              icon: Icon(
                                                                Icons.add,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 14,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                context.pushNamed(
                                                                    MethodOrderWidget
                                                                        .routeName);
                                                              },
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8)),
                                                        ),
                                                      ),
                                                      StreamBuilder<
                                                          List<
                                                              OrderMethodsRecord>>(
                                                        stream:
                                                            queryOrderMethodsRecord(
                                                          queryBuilder:
                                                              (orderMethodsRecord) =>
                                                                  orderMethodsRecord
                                                                      .where(
                                                            'method_poster',
                                                            isEqualTo:
                                                                currentUserReference,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<OrderMethodsRecord>
                                                              listViewOrderMethodsRecordList =
                                                              snapshot.data!;
                                                          if (listViewOrderMethodsRecordList
                                                              .isEmpty) {
                                                            return Image.asset(
                                                              '',
                                                            );
                                                          }

                                                          return ListView
                                                              .separated(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewOrderMethodsRecordList
                                                                    .length,
                                                            separatorBuilder:
                                                                (_, __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            8),
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewOrderMethodsRecord =
                                                                  listViewOrderMethodsRecordList[
                                                                      listViewIndex];
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          8,
                                                                          8,
                                                                          8),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                child: Text(
                                                                                  listViewOrderMethodsRecord.methodTag,
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                listViewOrderMethodsRecord.methodType,
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                child: RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          '6ixhtfyw' /* # I.D. :  */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: listViewOrderMethodsRecord.reference.id,
                                                                                        style: TextStyle(),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                child: RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          '1iy5supo' /* # Index :  */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: listViewIndex.toString(),
                                                                                        style: TextStyle(),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          letterSpacing: 0.0,
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
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 8)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Container(
                                      width: double.infinity,
                                      height: 400,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 4, 0),
                                        child: StreamBuilder<
                                            List<AnalyticsRecord>>(
                                          stream: queryAnalyticsRecord(
                                            queryBuilder: (analyticsRecord) =>
                                                analyticsRecord.where(
                                              'user_ref',
                                              isEqualTo: currentUserReference,
                                            ),
                                            singleRecord: true,
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AnalyticsRecord>
                                                columnAnalyticsRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final columnAnalyticsRecord =
                                                columnAnalyticsRecordList
                                                        .isNotEmpty
                                                    ? columnAnalyticsRecordList
                                                        .first
                                                    : null;

                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child:
                                                            FlutterFlowChoiceChips(
                                                          options: [
                                                            ChipData(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'ffcxey0n' /* Order */,
                                                                ),
                                                                Icons.post_add),
                                                            ChipData(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '0kvddroj' /* Objects */,
                                                                ),
                                                                Icons
                                                                    .photo_library),
                                                            ChipData(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'uzenmhah' /* User */,
                                                                ),
                                                                Icons.person)
                                                          ],
                                                          onChanged: (val) =>
                                                              safeSetState(() =>
                                                                  _model.choiceChipsAnayticsValue =
                                                                      val?.firstOrNull),
                                                          selectedChipStyle:
                                                              ChipStyle(
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      fontSize:
                                                                          12,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            iconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            iconSize: 14,
                                                            elevation: 0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          unselectedChipStyle:
                                                              ChipStyle(
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            iconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            iconSize: 14,
                                                            elevation: 0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          chipSpacing: 6,
                                                          rowSpacing: 8,
                                                          multiselect: false,
                                                          initialized: _model
                                                                  .choiceChipsAnayticsValue !=
                                                              null,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          controller: _model
                                                                  .choiceChipsAnayticsValueController ??=
                                                              FormFieldController<
                                                                  List<String>>(
                                                            [
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'ebcookjc' /* Objects */,
                                                              )
                                                            ],
                                                          ),
                                                          wrapped: false,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (_model
                                                        .choiceChipsAnayticsValue ==
                                                    'Order')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 8, 0, 0),
                                                    child: Container(
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16,
                                                                            0,
                                                                            16,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          RichText(
                                                                            textScaler:
                                                                                MediaQuery.of(context).textScaler,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'hhee5bpa' /* Completed orders : */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 14,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 14,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          RichText(
                                                                            textScaler:
                                                                                MediaQuery.of(context).textScaler,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: valueOrDefault<String>(
                                                                                    formatNumber(
                                                                                      columnAnalyticsRecord?.orderAccum,
                                                                                      formatType: FormatType.compact,
                                                                                    ),
                                                                                    '0',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 14,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'th5s4iq4' /*  # */,
                                                                                  ),
                                                                                  style: TextStyle(),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 16,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          RichText(
                                                                            textScaler:
                                                                                MediaQuery.of(context).textScaler,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'hwhozquw' /* Average ref. : */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 14,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 14,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          RichText(
                                                                            textScaler:
                                                                                MediaQuery.of(context).textScaler,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: valueOrDefault<String>(
                                                                                    columnAnalyticsRecord?.orderAvgRef.toString(),
                                                                                    '0',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 14,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'dnmhg8ju' /*  T. */,
                                                                                  ),
                                                                                  style: TextStyle(),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 16,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          RichText(
                                                                            textScaler:
                                                                                MediaQuery.of(context).textScaler,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'c6tij4kv' /* Average time : */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 14,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 14,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(1, 0),
                                                                              child: RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        columnAnalyticsRecord?.orderAvgTime.toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 14,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'd76thnm5' /*  min. */,
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        fontSize: 14,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 16,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Icon(
                                                                            Icons.access_alarm,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                        ].divide(SizedBox(width: 8)),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'esjfutcy' /* Bag to order ratio: */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 14,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 16,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                4,
                                                                                0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: valueOrDefault<String>(
                                                                                      columnAnalyticsRecord?.bagOrderRatio.toString(),
                                                                                      '0.00',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 16,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'u1gcrqzf' /*  / 1 */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 16,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '3dqpn6vc' /* Order review: */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 14,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 16,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                4,
                                                                                0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: valueOrDefault<String>(
                                                                                      columnAnalyticsRecord?.orderAvgReview.toString(),
                                                                                      '0.00',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 16,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '79rwpb9j' /*  / 5 */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 16,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
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
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                height: 8))
                                                            .addToStart(
                                                                SizedBox(
                                                                    height: 8))
                                                            .addToEnd(SizedBox(
                                                                height: 8)),
                                                      ),
                                                    ),
                                                  ),
                                                if (_model
                                                        .choiceChipsAnayticsValue ==
                                                    'Order')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 8, 0, 0),
                                                    child: Container(
                                                      width: 100,
                                                      height: 180,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'may6qt2k' /* Accumulated ref: */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 14,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 16,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                4,
                                                                                0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: valueOrDefault<String>(
                                                                                      columnAnalyticsRecord?.orderAccumRef.toString(),
                                                                                      '0.00',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 16,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'w7yaa7ef' /*  T. */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 16,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
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
                                                          Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          8,
                                                                          0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
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
                                                                  child: Stack(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              230,
                                                                          child:
                                                                              FlutterFlowBarChart(
                                                                            barData: [
                                                                              FFBarChartData(
                                                                                yData: List.generate(random_data.randomInteger(0, 10), (index) => random_data.randomInteger(0, 10)),
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                              )
                                                                            ],
                                                                            xLabels:
                                                                                List.generate(random_data.randomInteger(0, 10), (index) => random_data.randomInteger(0, 10)).map((e) => e.toString()).toList(),
                                                                            barWidth:
                                                                                12,
                                                                            barBorderRadius:
                                                                                BorderRadius.circular(4),
                                                                            groupSpace:
                                                                                4,
                                                                            alignment:
                                                                                BarChartAlignment.start,
                                                                            chartStylingInfo:
                                                                                ChartStylingInfo(
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              showGrid: true,
                                                                              showBorder: false,
                                                                            ),
                                                                            axisBounds:
                                                                                AxisBounds(),
                                                                            xAxisLabelInfo:
                                                                                AxisLabelInfo(
                                                                              reservedSize: 28,
                                                                            ),
                                                                            yAxisLabelInfo:
                                                                                AxisLabelInfo(
                                                                              reservedSize: 42,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            1),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8,
                                                                              0,
                                                                              8,
                                                                              8),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                12,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              borderRadius: BorderRadius.circular(4),
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
                                                        ]
                                                            .divide(SizedBox(
                                                                height: 8))
                                                            .addToStart(
                                                                SizedBox(
                                                                    height: 8))
                                                            .addToEnd(SizedBox(
                                                                height: 8)),
                                                      ),
                                                    ),
                                                  ),
                                                if (_model
                                                        .choiceChipsAnayticsValue ==
                                                    'Objects')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 8, 0, 0),
                                                    child: Container(
                                                      width: 100,
                                                      height: 220,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          8,
                                                                          0),
                                                              child: Container(
                                                                width: 100,
                                                                height: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              8,
                                                                              8,
                                                                              12),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            70,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.stretch,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0, 0),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'swwh73oe' /* Vote rate */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.line_axis,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 24,
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              columnAnalyticsRecord?.objectVoterate.toString(),
                                                                                              '0',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0, 0),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'dvp6f0s1' /* Pin index */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.height_outlined,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 24,
                                                                                          ),
                                                                                          FutureBuilder<int>(
                                                                                            future: querySubmissionRecordCount(
                                                                                              queryBuilder: (submissionRecord) => submissionRecord.where(
                                                                                                'pins',
                                                                                                arrayContains: currentUserReference,
                                                                                              ),
                                                                                            ),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: SizedBox(
                                                                                                    width: 50,
                                                                                                    height: 50,
                                                                                                    child: CircularProgressIndicator(
                                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              int textCount = snapshot.data!;

                                                                                              return Text(
                                                                                                valueOrDefault<String>(
                                                                                                  columnAnalyticsRecord?.objectPin.toString(),
                                                                                                  '0',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0, 0),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'hrutzr9j' /* Shares */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.share_sharp,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 20,
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              columnAnalyticsRecord?.objectShare.toString(),
                                                                                              '0',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              4),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children:
                                                                            [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'pcm2o3qc' /* Impressions:   */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: valueOrDefault<String>(
                                                                                      formatNumber(
                                                                                        columnAnalyticsRecord?.objectViewsAccum,
                                                                                        formatType: FormatType.compact,
                                                                                      ),
                                                                                      '0',
                                                                                    ),
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      fontSize: 16,
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                12,
                                                                                0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '0fzxiwqw' /* (   */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'gnfjwfai' /* 14.6 */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'cicxaux3' /*   % ) */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 4)),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              12,
                                                                              4,
                                                                              4),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children:
                                                                            [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '7wpu4vev' /* Reach:   */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: valueOrDefault<String>(
                                                                                      columnAnalyticsRecord?.objectReach.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      fontSize: 16,
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                12,
                                                                                0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'r98tze10' /* (   */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'havut3rl' /* 14.6 */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '5wjcyvnc' /*   % ) */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 4)),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              12,
                                                                              4,
                                                                              4),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children:
                                                                            [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'k0zon12l' /* Interactivity:   */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: valueOrDefault<String>(
                                                                                      columnAnalyticsRecord?.objectReach.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      fontSize: 16,
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                12,
                                                                                0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'kyg0mcpi' /* (   */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '4wrgn0d6' /* 14.6 */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '1tv2yx6k' /*   % ) */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 4)),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                height: 8))
                                                            .addToStart(
                                                                SizedBox(
                                                                    height: 8))
                                                            .addToEnd(SizedBox(
                                                                height: 8)),
                                                      ),
                                                    ),
                                                  ),
                                                if (_model
                                                        .choiceChipsAnayticsValue ==
                                                    'Objects')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 8, 0, 0),
                                                    child: Container(
                                                      width: 100,
                                                      height: 120,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: [
                                                              Expanded(
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
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '0xqapb7s' /* Top performer */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .bolt,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                        size:
                                                                            24,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1,
                                                                              0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                12,
                                                                                0),
                                                                            child:
                                                                                FlutterFlowChoiceChips(
                                                                              options: [
                                                                                ChipData(columnAnalyticsRecord!.topPerformer)
                                                                              ],
                                                                              onChanged: (val) => safeSetState(() => _model.choiceChipsValue2 = val?.firstOrNull),
                                                                              selectedChipStyle: ChipStyle(
                                                                                backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                iconColor: FlutterFlowTheme.of(context).info,
                                                                                iconSize: 16,
                                                                                elevation: 0,
                                                                                borderRadius: BorderRadius.circular(8),
                                                                              ),
                                                                              unselectedChipStyle: ChipStyle(
                                                                                backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                iconColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                iconSize: 16,
                                                                                elevation: 0,
                                                                                borderRadius: BorderRadius.circular(8),
                                                                              ),
                                                                              chipSpacing: 8,
                                                                              rowSpacing: 8,
                                                                              multiselect: false,
                                                                              alignment: WrapAlignment.start,
                                                                              controller: _model.choiceChipsValueController2 ??= FormFieldController<List<String>>(
                                                                                [],
                                                                              ),
                                                                              wrapped: false,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            4)),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
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
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'td5b4780' /* Interaction:   */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 12,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            12,
                                                                            0),
                                                                        child:
                                                                            RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  '3cb5ipdy' /*  */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'z93v6apx' /* 69 */,
                                                                                ),
                                                                                style: TextStyle(),
                                                                              ),
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'j1km0lc3' /*   % */,
                                                                                ),
                                                                                style: TextStyle(),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 12,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            4)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (_model
                                                        .choiceChipsAnayticsValue ==
                                                    'User')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 8, 0, 0),
                                                    child: Container(
                                                      width: 100,
                                                      height: 300,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context.pushNamed(
                                                                    VerificationWidget
                                                                        .routeName);
                                                              },
                                                              child: Container(
                                                                width: 200,
                                                                height: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          8,
                                                                          4),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  '2p6ptbo0' /* User verification status:    */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: () {
                                                                                  if (valueOrDefault<bool>(currentUserDocument?.userVerified, false) == true) {
                                                                                    return 'verified';
                                                                                  } else if (valueOrDefault<bool>(currentUserDocument?.userVerifiedPending, false) == true) {
                                                                                    return 'pending';
                                                                                  } else {
                                                                                    return 'not verified';
                                                                                  }
                                                                                }(),
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  fontSize: 16,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 12,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                      if (valueOrDefault<bool>(
                                                                              currentUserDocument?.userVerified,
                                                                              false) ==
                                                                          true)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              12,
                                                                              0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                Icon(
                                                                              Icons.verified_rounded,
                                                                              color: FlutterFlowTheme.of(context).success,
                                                                              size: 24,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (valueOrDefault<bool>(
                                                                              currentUserDocument?.userVerified,
                                                                              false) ==
                                                                          false)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              12,
                                                                              0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                Icon(
                                                                              Icons.not_interested,
                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                              size: 24,
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
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        8,
                                                                        0),
                                                            child: Container(
                                                              width: 200,
                                                              height: 100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(4),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(4),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                    child: RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          TextSpan(
                                                                                            text: FFLocalizations.of(context).getText(
                                                                                              '1ys6gyt7' /* User impressions:   */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 12,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: valueOrDefault<String>(
                                                                                              columnAnalyticsRecord?.userImpressions.toString(),
                                                                                              '0',
                                                                                            ),
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              fontSize: 16,
                                                                                            ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: FFLocalizations.of(context).getText(
                                                                                              'uueru30u' /*  */,
                                                                                            ),
                                                                                            style: TextStyle(),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 12,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 4)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(4),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                                                                                    child: RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          TextSpan(
                                                                                            text: FFLocalizations.of(context).getText(
                                                                                              'zmfg75ax' /* User pin:  */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 12,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: valueOrDefault<String>(
                                                                                              formatNumber(
                                                                                                columnAnalyticsRecord?.userPin,
                                                                                                formatType: FormatType.compact,
                                                                                              ),
                                                                                              '0',
                                                                                            ),
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              fontSize: 16,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 12,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(4),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                    child: RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          TextSpan(
                                                                                            text: FFLocalizations.of(context).getText(
                                                                                              'r9cppg5y' /* Object activity:   */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 12,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: valueOrDefault<String>(
                                                                                              formatNumber(
                                                                                                columnAnalyticsRecord?.objectViewsAccum,
                                                                                                formatType: FormatType.compact,
                                                                                              ),
                                                                                              '0',
                                                                                            ),
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              fontSize: 16,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 12,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 4)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          CircularPercentIndicator(
                                                                            percent:
                                                                                0.64,
                                                                            radius:
                                                                                27,
                                                                            lineWidth:
                                                                                8,
                                                                            animation:
                                                                                true,
                                                                            animateFromLastPercent:
                                                                                true,
                                                                            progressColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          ),
                                                                          StreamBuilder<
                                                                              List<UserRatingsRecord>>(
                                                                            stream:
                                                                                queryUserRatingsRecord(
                                                                              queryBuilder: (userRatingsRecord) => userRatingsRecord
                                                                                  .where(
                                                                                    'rated_user',
                                                                                    isEqualTo: currentUserReference,
                                                                                  )
                                                                                  .orderBy('date', descending: true),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<UserRatingsRecord> richTextUserRatingsRecordList = snapshot.data!;

                                                                              return RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'rxvx4t4s' /* Avg Rating    */,
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).success,
                                                                                        fontSize: 12,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: formatNumber(
                                                                                        functions.averageRating(richTextUserRatingsRecordList.map((e) => e.value).toList()),
                                                                                        formatType: FormatType.decimal,
                                                                                        decimalType: DecimalType.automatic,
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 12,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(
                                                                      SizedBox(
                                                                          width:
                                                                              4)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          8,
                                                                          0),
                                                              child: Container(
                                                                width: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(-1, 0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'gq9s9t12' /* MARKET INDEX :   */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 12,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                12,
                                                                                0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'ili4vcsr' /* (  */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'ym3fo7xk' /* +  */,
                                                                                    ),
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).success,
                                                                                      fontSize: 16,
                                                                                    ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: valueOrDefault<String>(
                                                                                      columnAnalyticsRecord?.marketIndex.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'scpa7cuh' /*   ) */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(-1, 0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'ca5v0ewa' /* PERFORMANCE :  */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 12,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                12,
                                                                                0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'm6odsaaz' /* (  */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'wf5k2qk2' /* +  */,
                                                                                    ),
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).success,
                                                                                      fontSize: 16,
                                                                                    ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: valueOrDefault<String>(
                                                                                      columnAnalyticsRecord?.performance.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '22l45ua0' /*   % ) */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(-1, 0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          't5rt5r2j' /* AVERAGE HASH  : */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 12,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                12,
                                                                                0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: valueOrDefault<String>(
                                                                                      columnAnalyticsRecord?.userHash.toString(),
                                                                                      '0.000',
                                                                                    ),
                                                                                    style: GoogleFonts.getFont(
                                                                                      'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontSize: 14,
                                                                                    ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'rrl37m0m' /*    H/S */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 12,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]
                                                                        .divide(SizedBox(
                                                                            height:
                                                                                8))
                                                                        .addToStart(SizedBox(
                                                                            height:
                                                                                4))
                                                                        .addToEnd(SizedBox(
                                                                            height:
                                                                                4)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                height: 8))
                                                            .addToStart(
                                                                SizedBox(
                                                                    height: 8))
                                                            .addToEnd(SizedBox(
                                                                height: 8)),
                                                      ),
                                                    ),
                                                  ),
                                              ]
                                                  .addToStart(
                                                      SizedBox(height: 8))
                                                  .addToEnd(
                                                      SizedBox(height: 8)),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 4, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 8),
                                              child: Container(
                                                width: double.infinity,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child:
                                                          FlutterFlowChoiceChips(
                                                        options: [
                                                          ChipData(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'e708w00f' /* Image */,
                                                              ),
                                                              Icons.image),
                                                          ChipData(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'rvozhkq7' /* Video */,
                                                              ),
                                                              Icons
                                                                  .play_circle),
                                                          ChipData(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'um6wh61y' /* Audio */,
                                                              ),
                                                              Icons
                                                                  .audiotrack_rounded),
                                                          ChipData(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '3vgcopam' /* Text */,
                                                              ),
                                                              Icons.text_fields)
                                                        ],
                                                        onChanged: (val) =>
                                                            safeSetState(() =>
                                                                _model.choiceChipsPostsValues =
                                                                    val),
                                                        selectedChipStyle:
                                                            ChipStyle(
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    fontSize:
                                                                        12,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .info,
                                                          iconSize: 16,
                                                          elevation: 0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        unselectedChipStyle:
                                                            ChipStyle(
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                          iconSize: 16,
                                                          elevation: 0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        chipSpacing: 6,
                                                        rowSpacing: 8,
                                                        multiselect: true,
                                                        initialized: _model
                                                                .choiceChipsPostsValues !=
                                                            null,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        controller: _model
                                                                .choiceChipsPostsValueController ??=
                                                            FormFieldController<
                                                                List<String>>(
                                                          [
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'o8yrnf4n' /* Image */,
                                                            )
                                                          ],
                                                        ),
                                                        wrapped: false,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                height: 100,
                                                decoration: BoxDecoration(),
                                                child: PagedMasonryGridView<
                                                    DocumentSnapshot<Object?>?,
                                                    SubmissionRecord>.count(
                                                  pagingController: _model
                                                      .setStaggeredViewController1(
                                                    SubmissionRecord.collection
                                                        .where(
                                                          'poster',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        )
                                                        .where(
                                                          'type_object',
                                                          isEqualTo: 'Post',
                                                        )
                                                        .orderBy('date',
                                                            descending: true),
                                                  ),
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 10,
                                                  mainAxisSpacing: 10,
                                                  builderDelegate:
                                                      PagedChildBuilderDelegate<
                                                          SubmissionRecord>(
                                                    // Customize what your widget looks like when it's loading the first page.
                                                    firstPageProgressIndicatorBuilder:
                                                        (_) => Center(
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
                                                    ),
                                                    // Customize what your widget looks like when it's loading another page.
                                                    newPageProgressIndicatorBuilder:
                                                        (_) => Center(
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
                                                    ),

                                                    itemBuilder: (context, _,
                                                        staggeredViewIndex) {
                                                      final staggeredViewSubmissionRecord =
                                                          _model.staggeredViewPagingController1!
                                                                  .itemList![
                                                              staggeredViewIndex];
                                                      return Visibility(
                                                        visible: staggeredViewSubmissionRecord
                                                                    .refvalue ==
                                                                null ||
                                                            staggeredViewSubmissionRecord
                                                                    .refvalue ==
                                                                '',
                                                        child: Builder(
                                                          builder: (context) =>
                                                              FutureBuilder<
                                                                  SubmissionRecord>(
                                                            future: SubmissionRecord
                                                                .getDocumentOnce(
                                                                    staggeredViewSubmissionRecord
                                                                        .reference),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
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

                                                              final objectSubmissionRecord =
                                                                  snapshot
                                                                      .data!;

                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(dialogContext).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              UserObjectWidget(
                                                                            object:
                                                                                objectSubmissionRecord,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxHeight:
                                                                          320,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              5,
                                                                          color:
                                                                              Color(0x3416202A),
                                                                          offset:
                                                                              Offset(
                                                                            3,
                                                                            3,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .stretch,
                                                                      children: [
                                                                        if ((objectSubmissionRecord.imagesextra.length !=
                                                                                null) &&
                                                                            (objectSubmissionRecord.refvalue == null ||
                                                                                objectSubmissionRecord.refvalue == ''))
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final feedobjectimages = objectSubmissionRecord.imagesextra.map((e) => e).toList().take(3).toList();

                                                                              return SingleChildScrollView(
                                                                                scrollDirection: Axis.horizontal,
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: List.generate(feedobjectimages.length, (feedobjectimagesIndex) {
                                                                                    final feedobjectimagesItem = feedobjectimages[feedobjectimagesIndex];
                                                                                    return Container(
                                                                                      width: 200,
                                                                                      height: 200,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Visibility(
                                                                                        visible: feedobjectimagesItem != null && feedobjectimagesItem != '',
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                          child: Image.network(
                                                                                            feedobjectimagesItem,
                                                                                            width: double.infinity,
                                                                                            height: double.infinity,
                                                                                            fit: BoxFit.fitHeight,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        if (objectSubmissionRecord.video !=
                                                                                null &&
                                                                            objectSubmissionRecord.video !=
                                                                                '')
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                if (objectSubmissionRecord.video != null && objectSubmissionRecord.video != '')
                                                                                  Expanded(
                                                                                    child: FlutterFlowMediaDisplay(
                                                                                      path: objectSubmissionRecord.video,
                                                                                      imageBuilder: (path) => ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                        child: Image.network(
                                                                                          path,
                                                                                          width: double.infinity,
                                                                                          height: double.infinity,
                                                                                          fit: BoxFit.fitHeight,
                                                                                        ),
                                                                                      ),
                                                                                      videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                        path: path,
                                                                                        width: double.infinity,
                                                                                        height: double.infinity,
                                                                                        autoPlay: true,
                                                                                        looping: true,
                                                                                        showControls: false,
                                                                                        allowFullScreen: false,
                                                                                        allowPlaybackSpeedMenu: false,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        if (objectSubmissionRecord.audio !=
                                                                                null &&
                                                                            objectSubmissionRecord.audio !=
                                                                                '')
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: 100,
                                                                                    height: 320,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Stack(
                                                                                      children: [
                                                                                        ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                          child: Image.network(
                                                                                            objectSubmissionRecord.image,
                                                                                            width: 200,
                                                                                            height: 200,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                        FlutterFlowAudioPlayer(
                                                                                          audio: Audio.network(
                                                                                            objectSubmissionRecord.audio,
                                                                                            metas: Metas(
                                                                                              title: objectSubmissionRecord.header,
                                                                                            ),
                                                                                          ),
                                                                                          titleTextStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                fontFamily: 'Sora',
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                fontSize: 20,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          playbackDurationTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          fillColor: Color(0x00000000),
                                                                                          playbackButtonColor: FlutterFlowTheme.of(context).alternate,
                                                                                          activeTrackColor: FlutterFlowTheme.of(context).primary,
                                                                                          inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                          elevation: 0,
                                                                                          playInBackground: PlayInBackground.enabled,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        if ((objectSubmissionRecord.body != null &&
                                                                                objectSubmissionRecord.body != '') &&
                                                                            !(objectSubmissionRecord.imagesextra.isNotEmpty))
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(8),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1, -1),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(8),
                                                                                    child: Text(
                                                                                      objectSubmissionRecord.header,
                                                                                      maxLines: 3,
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Divider(
                                                                                  thickness: 1,
                                                                                  indent: 12,
                                                                                  endIndent: 12,
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1, -1),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
                                                                                    child: Text(
                                                                                      objectSubmissionRecord.body,
                                                                                      maxLines: 4,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            letterSpacing: 0.0,
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
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 4, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 4),
                                              child: Container(
                                                width: double.infinity,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(6, 6, 6, 6),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x00FFFFFF),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child:
                                                                    FlutterFlowChoiceChips(
                                                                  options: [
                                                                    ChipData(FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'i9o8t90g' /* All */,
                                                                    )),
                                                                    ChipData(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          's8rcrry3' /* Popular */,
                                                                        ),
                                                                        Icons
                                                                            .star_rounded),
                                                                    ChipData(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'n9c1xdrq' /* Catalogues */,
                                                                        ),
                                                                        Icons
                                                                            .menu_book)
                                                                  ],
                                                                  onChanged: (val) =>
                                                                      safeSetState(() =>
                                                                          _model.choiceChipsItemsValue =
                                                                              val?.firstOrNull),
                                                                  selectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    iconColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                    iconSize:
                                                                        16,
                                                                    elevation:
                                                                        0,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  unselectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    iconSize:
                                                                        16,
                                                                    elevation:
                                                                        0,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  chipSpacing:
                                                                      6,
                                                                  rowSpacing: 4,
                                                                  multiselect:
                                                                      false,
                                                                  initialized:
                                                                      _model.choiceChipsItemsValue !=
                                                                          null,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .center,
                                                                  controller: _model
                                                                          .choiceChipsItemsValueController ??=
                                                                      FormFieldController<
                                                                          List<
                                                                              String>>(
                                                                    [
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'dr0no1fn' /* Popular */,
                                                                      )
                                                                    ],
                                                                  ),
                                                                  wrapped:
                                                                      false,
                                                                ),
                                                              ),
                                                              if (_model
                                                                      .choiceChipsItemsValue ==
                                                                  'Catalogues')
                                                                FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      100,
                                                                  buttonSize:
                                                                      30,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  icon: Icon(
                                                                    Icons.add,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    size: 14,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    context.pushNamed(
                                                                        NewCatalogueWidget
                                                                            .routeName);
                                                                  },
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
                                            if (_model.choiceChipsItemsValue !=
                                                'Catalogues')
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 12, 8, 0),
                                                  child: StreamBuilder<
                                                      List<SubmissionRecord>>(
                                                    stream:
                                                        querySubmissionRecord(
                                                      queryBuilder:
                                                          (submissionRecord) =>
                                                              submissionRecord
                                                                  .where(
                                                                    'poster',
                                                                    isEqualTo:
                                                                        currentUserReference,
                                                                  )
                                                                  .where(
                                                                    'type_object',
                                                                    isEqualTo:
                                                                        'Item',
                                                                  )
                                                                  .orderBy(
                                                                      'date',
                                                                      descending:
                                                                          true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      List<SubmissionRecord>
                                                          staggeredViewSubmissionRecordList =
                                                          snapshot.data!;

                                                      return MasonryGridView
                                                          .builder(
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
                                                        itemBuilder: (context,
                                                            staggeredViewIndex) {
                                                          final staggeredViewSubmissionRecord =
                                                              staggeredViewSubmissionRecordList[
                                                                  staggeredViewIndex];
                                                          return Builder(
                                                            builder: (context) =>
                                                                StreamBuilder<
                                                                    SubmissionRecord>(
                                                              stream: SubmissionRecord
                                                                  .getDocument(
                                                                      staggeredViewSubmissionRecord
                                                                          .reference),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }

                                                                final objectSubmissionRecord =
                                                                    snapshot
                                                                        .data!;

                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                UserObjectWidget(
                                                                              object: objectSubmissionRecord,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          240,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxHeight:
                                                                            320,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                5,
                                                                            color:
                                                                                Color(0x3416202A),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              3,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          if (true /* Warning: Trying to access variable not yet defined. */)
                                                                            Builder(
                                                                              builder: (context) {
                                                                                final images = staggeredViewSubmissionRecord.imagesextra.map((e) => e).toList();

                                                                                return SingleChildScrollView(
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                    children: List.generate(images.length, (imagesIndex) {
                                                                                      final imagesItem = images[imagesIndex];
                                                                                      return Visibility(
                                                                                        visible: imagesItem != null && imagesItem != '',
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                          child: Image.network(
                                                                                            imagesItem,
                                                                                            width: 200,
                                                                                            height: 100,
                                                                                            fit: BoxFit.cover,
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
                                                                                AlignmentDirectional(1, 1),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(8),
                                                                              child: Container(
                                                                                width: 70,
                                                                                height: 40,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  borderRadius: BorderRadius.circular(12),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(4),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.toll,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 16,
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Text(
                                                                                          staggeredViewSubmissionRecord.refvalue,
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            if (_model.choiceChipsItemsValue ==
                                                'Catalogues')
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    StreamBuilder<
                                                        List<CatalogueRecord>>(
                                                      stream:
                                                          queryCatalogueRecord(
                                                        queryBuilder:
                                                            (catalogueRecord) =>
                                                                catalogueRecord
                                                                    .where(
                                                          'user_ref',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        ),
                                                        limit: 8,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        List<CatalogueRecord>
                                                            listViewCatalogueRecordList =
                                                            snapshot.data!;

                                                        return ListView
                                                            .separated(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                            0,
                                                            4,
                                                            0,
                                                            0,
                                                          ),
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewCatalogueRecordList
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 8),
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewCatalogueRecord =
                                                                listViewCatalogueRecordList[
                                                                    listViewIndex];
                                                            return Builder(
                                                              builder:
                                                                  (context) =>
                                                                      InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(dialogContext).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              CatalogueWidget(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  height: 157,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            12),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .stretch,
                                                                      children:
                                                                          [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                                                              child: Text(
                                                                                listViewCatalogueRecord.catalalogueName,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 18,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'zn5p428u' /* # : */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 14,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              listViewCatalogueRecord.totalItems.toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 16,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(1, 0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(8),
                                                                                  child: Icon(
                                                                                    Icons.edit,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 24,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                width: 1,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(8),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 8)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ].divide(SizedBox(height: 8)),
                                                ),
                                              ),
                                          ].divide(SizedBox(height: 4)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 4, 6),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: [
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'matvykmi' /* Book */,
                                                          ),
                                                          Icons.toc_sharp),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ynwxm69q' /* Methods */,
                                                          ),
                                                          Icons.library_books),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'gunbpyhb' /* Account */,
                                                          ),
                                                          Icons.api_rounded)
                                                    ],
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .choiceChipsWalletValue =
                                                            val?.firstOrNull),
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      iconSize: 16,
                                                      elevation: 0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      iconSize: 16,
                                                      elevation: 0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    chipSpacing: 8,
                                                    rowSpacing: 8,
                                                    multiselect: false,
                                                    initialized: _model
                                                            .choiceChipsWalletValue !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .choiceChipsWalletValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '7803th34' /* Book */,
                                                        )
                                                      ],
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (_model.choiceChipsWalletValue ==
                                              'Book')
                                            Container(
                                              width: 500,
                                              height: 460,
                                              constraints: BoxConstraints(
                                                maxWidth: 570,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 4, 8, 12),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '5en137ce' /* Transaction history */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          20,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'vn7r2tpm' /* A list of historical transacti... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Plus Jakarta Sans',
                                                                      color: Color(
                                                                          0xFF606A85),
                                                                      fontSize:
                                                                          14,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 4)),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: ToggleIcon(
                                                              onPressed:
                                                                  () async {
                                                                safeSetState(() =>
                                                                    _model.trsIsSent =
                                                                        !_model
                                                                            .trsIsSent);
                                                              },
                                                              value: _model
                                                                  .trsIsSent,
                                                              onIcon: Icon(
                                                                Icons
                                                                    .arrow_drop_up_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 26,
                                                              ),
                                                              offIcon: Icon(
                                                                Icons
                                                                    .arrow_drop_down,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                                size: 26,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(
                                                            SizedBox(width: 8)),
                                                      ),
                                                    ),
                                                    if (_model.trsIsSent ==
                                                        true)
                                                      StreamBuilder<
                                                          List<
                                                              TransactionsRecord>>(
                                                        stream:
                                                            queryTransactionsRecord(
                                                          queryBuilder: (transactionsRecord) =>
                                                              transactionsRecord
                                                                  .where(
                                                                    'user_madeby',
                                                                    isEqualTo:
                                                                        currentUserReference,
                                                                  )
                                                                  .orderBy(
                                                                      'date',
                                                                      descending:
                                                                          true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<TransactionsRecord>
                                                              listViewTransactionsRecordList =
                                                              snapshot.data!;

                                                          return ListView
                                                              .separated(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                              0,
                                                              12,
                                                              0,
                                                              12,
                                                            ),
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewTransactionsRecordList
                                                                    .length,
                                                            separatorBuilder:
                                                                (_, __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            8),
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewTransactionsRecord =
                                                                  listViewTransactionsRecordList[
                                                                      listViewIndex];
                                                              return Container(
                                                                width: 100,
                                                                height: 80,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          0,
                                                                      color: Color(
                                                                          0xFFE5E7EB),
                                                                      offset:
                                                                          Offset(
                                                                        0,
                                                                        1,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width: 60,
                                                                      height:
                                                                          100,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12),
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_drop_up,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(4),
                                                                        child: StreamBuilder<
                                                                            UsersRecord>(
                                                                          stream:
                                                                              UsersRecord.getDocument(currentUserReference!),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }

                                                                            final columnUsersRecord =
                                                                                snapshot.data!;

                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'bdfckyy1' /* Reciever:  */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 12,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: listViewTransactionsRecord.userOut,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 10,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 10,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(1, 0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                          child: Text(
                                                                                            dateTimeFormat(
                                                                                              "relative",
                                                                                              listViewTransactionsRecord.date!,
                                                                                              locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'glhf9f71' /* Sender:  */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 12,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: listViewTransactionsRecord.userIn,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 10,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 10,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'czwg08jc' /* ORDER I.D.  # */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 12,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: valueOrDefault<String>(
                                                                                                listViewTransactionsRecord.orderRef?.id,
                                                                                                'XXXXXX',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 10,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 10,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                        child: RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'rzrzheb1' /* REF :  */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: valueOrDefault<String>(
                                                                                                  listViewTransactionsRecord.totalRefValueTransaction.toString(),
                                                                                                  '0',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              )
                                                                                            ],
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
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
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    if (_model.trsIsSent ==
                                                        false)
                                                      StreamBuilder<
                                                          List<
                                                              TransactionsRecord>>(
                                                        stream:
                                                            queryTransactionsRecord(
                                                          queryBuilder: (transactionsRecord) =>
                                                              transactionsRecord
                                                                  .where(
                                                                    'user_madeto',
                                                                    isEqualTo:
                                                                        currentUserReference,
                                                                  )
                                                                  .orderBy(
                                                                      'date',
                                                                      descending:
                                                                          true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<TransactionsRecord>
                                                              listViewTransactionsRecordList =
                                                              snapshot.data!;

                                                          return ListView
                                                              .separated(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                              0,
                                                              12,
                                                              0,
                                                              12,
                                                            ),
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewTransactionsRecordList
                                                                    .length,
                                                            separatorBuilder:
                                                                (_, __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            8),
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewTransactionsRecord =
                                                                  listViewTransactionsRecordList[
                                                                      listViewIndex];
                                                              return Container(
                                                                width: 100,
                                                                height: 80,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          0,
                                                                      color: Color(
                                                                          0xFFE5E7EB),
                                                                      offset:
                                                                          Offset(
                                                                        0,
                                                                        1,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width: 60,
                                                                      height:
                                                                          100,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12),
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_drop_down,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .success,
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(4),
                                                                        child: StreamBuilder<
                                                                            UsersRecord>(
                                                                          stream:
                                                                              UsersRecord.getDocument(currentUserReference!),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }

                                                                            final columnUsersRecord =
                                                                                snapshot.data!;

                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                '8o1mx6c6' /* Reciever:  */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 12,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: listViewTransactionsRecord.userOut,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 10,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 10,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'ufvv30se' /* Sender:  */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 12,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: listViewTransactionsRecord.userIn,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 10,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 10,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'lmanv682' /* ORDER I.D.  # */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 12,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: valueOrDefault<String>(
                                                                                                listViewTransactionsRecord.orderRef?.id,
                                                                                                'XXXXXX',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 10,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 10,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'icfn8zgw' /* REF :  */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: valueOrDefault<String>(
                                                                                                listViewTransactionsRecord.totalRefValueTransaction.toString(),
                                                                                                '0',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(1, 0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                          child: Text(
                                                                                            dateTimeFormat(
                                                                                              "relative",
                                                                                              listViewTransactionsRecord.date!,
                                                                                              locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
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
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          if (_model.choiceChipsWalletValue ==
                                              'Methods')
                                            Container(
                                              width: 300,
                                              height: 460,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0,
                                                      2,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 8, 12),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(12),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'y15ubtt5' /* P2P Transaction Method(s) */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          14,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 4)),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 100,
                                                            buttonSize: 30,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            icon: Icon(
                                                              Icons.add,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 14,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                  MethodWalletWidget
                                                                      .routeName);
                                                            },
                                                          ),
                                                        ].divide(
                                                            SizedBox(width: 8)),
                                                      ),
                                                    ),
                                                    StreamBuilder<
                                                        List<
                                                            WalletMethodsRecord>>(
                                                      stream:
                                                          queryWalletMethodsRecord(
                                                        queryBuilder:
                                                            (walletMethodsRecord) =>
                                                                walletMethodsRecord
                                                                    .where(
                                                          'method_poster',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        List<WalletMethodsRecord>
                                                            listViewWalletMethodsRecordList =
                                                            snapshot.data!;
                                                        if (listViewWalletMethodsRecordList
                                                            .isEmpty) {
                                                          return Image.asset(
                                                            '',
                                                          );
                                                        }

                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewWalletMethodsRecordList
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 8),
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewWalletMethodsRecord =
                                                                listViewWalletMethodsRecordList[
                                                                    listViewIndex];
                                                            return Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16,
                                                                            8,
                                                                            8,
                                                                            8),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                              child: Text(
                                                                                listViewWalletMethodsRecord.methodName,
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              listViewWalletMethodsRecord.methodType,
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                              child: RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '3i3onmpd' /* # I.D. :  */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: listViewWalletMethodsRecord.methodId,
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                              child: RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'gn9oxkhn' /* # Account :  */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: listViewWalletMethodsRecord.methodAccount,
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
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
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ].divide(SizedBox(height: 8)),
                                                ),
                                              ),
                                            ),
                                          if (_model.choiceChipsWalletValue ==
                                              'Account')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Container(
                                                width: 100,
                                                height: 600,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      child: StreamBuilder<
                                                          List<CreditsRecord>>(
                                                        stream:
                                                            queryCreditsRecord(
                                                          queryBuilder:
                                                              (creditsRecord) =>
                                                                  creditsRecord
                                                                      .where(
                                                            'userRef',
                                                            isEqualTo:
                                                                currentUserReference,
                                                          ),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<CreditsRecord>
                                                              creditCardCreditsRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final creditCardCreditsRecord =
                                                              creditCardCreditsRecordList
                                                                      .isNotEmpty
                                                                  ? creditCardCreditsRecordList
                                                                      .first
                                                                  : null;

                                                          return Container(
                                                            width: 370,
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 6,
                                                                  color: Color(
                                                                      0x4B1A1F24),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    2,
                                                                  ),
                                                                )
                                                              ],
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText
                                                                ],
                                                                stops: [0, 1],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        0.94,
                                                                        -1),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        -0.94,
                                                                        1),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              12),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      if (FFAppState()
                                                                              .isWalletConnected ==
                                                                          false)
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            FFAppState().isWalletConnected =
                                                                                true;
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'q0vr7c4a' /* Connect Wallet */,
                                                                          ),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.account_balance_wallet,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                15,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                36,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16,
                                                                                0,
                                                                                16,
                                                                                0),
                                                                            iconAlignment:
                                                                                IconAlignment.end,
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 12,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            elevation:
                                                                                0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                        ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              40,
                                                                          height:
                                                                              40,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                180,
                                                                            height:
                                                                                34,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(12),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                width: 1,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Visibility(
                                                                              visible: FFAppState().isWalletConnected == true,
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    FFAppState().walletAddress,
                                                                                    '**** 4477',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Roboto Mono',
                                                                                        color: Colors.white,
                                                                                        fontSize: 14,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (FFAppState()
                                                                              .isWalletConnected ==
                                                                          true)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              8,
                                                                              8,
                                                                              8),
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8,
                                                                            buttonSize:
                                                                                40,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.logout_rounded,
                                                                              color: Colors.white,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              FFAppState().isWalletConnected = false;
                                                                            },
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              16),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '374b7k11' /* SEND */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  fontSize: 10,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8,
                                                                            buttonSize:
                                                                                40,
                                                                            fillColor:
                                                                                Color(0x49F83B46),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.upload_rounded,
                                                                              color: Colors.white,
                                                                              size: 24,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              print('IconButton pressed ...');
                                                                            },
                                                                          ),
                                                                        ].divide(SizedBox(height: 8)),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '231pdd7e' /* RECIEVE */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  fontSize: 10,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8,
                                                                            buttonSize:
                                                                                40,
                                                                            fillColor:
                                                                                Color(0x49F83B46),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.qr_code_sharp,
                                                                              color: Colors.white,
                                                                              size: 24,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              print('IconButton pressed ...');
                                                                            },
                                                                          ),
                                                                        ].divide(SizedBox(height: 8)),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'uqrzw76w' /* HISTORY */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  fontSize: 10,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                          FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8,
                                                                            buttonSize:
                                                                                40,
                                                                            fillColor:
                                                                                Color(0x49F83B46),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.history_rounded,
                                                                              color: Colors.white,
                                                                              size: 24,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              print('IconButton pressed ...');
                                                                            },
                                                                          ),
                                                                        ].divide(SizedBox(height: 8)),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 4,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '4plssfel' /* Tcoin balance */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Plus Jakarta Sans',
                                                                                          color: Colors.white,
                                                                                          fontSize: 14,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                    child: Text(
                                                                                      formatNumber(
                                                                                        functions.generatedcredits(creditCardCreditsRecord?.generationI, creditCardCreditsRecord?.participationI, creditCardCreditsRecord?.transitionI),
                                                                                        formatType: FormatType.decimal,
                                                                                        decimalType: DecimalType.automatic,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: Colors.white,
                                                                                            fontSize: 32,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            12)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        if (!_model
                                                            .webViewOpen) {
                                                          return Visibility(
                                                            visible: !_model
                                                                .webViewOpen,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      CreditsRecord>>(
                                                                stream:
                                                                    queryCreditsRecord(
                                                                  queryBuilder:
                                                                      (creditsRecord) =>
                                                                          creditsRecord
                                                                              .where(
                                                                    'userRef',
                                                                    isEqualTo:
                                                                        currentUserReference,
                                                                  ),
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<CreditsRecord>
                                                                      creditCard1CreditsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final creditCard1CreditsRecord = creditCard1CreditsRecordList
                                                                          .isNotEmpty
                                                                      ? creditCard1CreditsRecordList
                                                                          .first
                                                                      : null;

                                                                  return Container(
                                                                    width: 370,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              6,
                                                                          color:
                                                                              Color(0x4B1A1F24),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      gradient:
                                                                          LinearGradient(
                                                                        colors: [
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText
                                                                        ],
                                                                        stops: [
                                                                          0,
                                                                          1
                                                                        ],
                                                                        begin: AlignmentDirectional(
                                                                            0.94,
                                                                            -1),
                                                                        end: AlignmentDirectional(
                                                                            -0.94,
                                                                            1),
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              16),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                4),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'h109n1ac' /* Generated D.U. */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Roboto Mono',
                                                                                        color: Colors.white,
                                                                                        fontSize: 14,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                                Icon(
                                                                                  Icons.info_outlined,
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  size: 16,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Divider(
                                                                            thickness:
                                                                                1,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                4,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'c4yw2f3u' /* Available : */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Roboto Mono',
                                                                                          color: Colors.white,
                                                                                          fontSize: 14,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1, 0),
                                                                                    child: Text(
                                                                                      formatNumber(
                                                                                        functions.generatedcredits(creditCard1CreditsRecord?.generationI, creditCard1CreditsRecord?.participationI, creditCard1CreditsRecord?.transitionI),
                                                                                        formatType: FormatType.compact,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Roboto Mono',
                                                                                            color: Colors.white,
                                                                                            fontSize: 14,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  decoration: BoxDecoration(),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                4,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '41f05aue' /* Available : */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Roboto Mono',
                                                                                          color: Colors.white,
                                                                                          fontSize: 14,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1, 0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                      child: Text(
                                                                                        formatNumber(
                                                                                          functions.generatedcredits(creditCard1CreditsRecord?.generationI, creditCard1CreditsRecord?.participationI, creditCard1CreditsRecord?.transitionI),
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.automatic,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Roboto Mono',
                                                                                              color: Colors.white,
                                                                                              fontSize: 14,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    _model.webViewOpen = true;
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    '4y2ugccp' /* Mint */,
                                                                                  ),
                                                                                  icon: Icon(
                                                                                    Icons.generating_tokens_outlined,
                                                                                    size: 20,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: 40,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                                                                    iconAlignment: IconAlignment.end,
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                                    color: Color(0x49F83B46),
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: Colors.white,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    elevation: 0,
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  decoration: BoxDecoration(),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        } else {
                                                          return Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4),
                                                            child: Container(
                                                              width: 370,
                                                              height: 200,
                                                              decoration:
                                                                  BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        6,
                                                                    color: Color(
                                                                        0x4B1A1F24),
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      2,
                                                                    ),
                                                                  )
                                                                ],
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText
                                                                  ],
                                                                  stops: [0, 1],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          0.94,
                                                                          -1),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          -0.94,
                                                                          1),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [],
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ]
                                            .addToStart(SizedBox(height: 8))
                                            .addToEnd(SizedBox(height: 8)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(SizedBox(height: 8)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
