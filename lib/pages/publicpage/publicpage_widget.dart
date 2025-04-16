import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/catalogue/catalogue_widget.dart';
import '/components/object/object_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import 'publicpage_model.dart';
export 'publicpage_model.dart';

class PublicpageWidget extends StatefulWidget {
  const PublicpageWidget({
    super.key,
    required this.profileparameter,
    this.objectparameter,
    this.objectrefvalue,
  });

  final DocumentReference? profileparameter;
  final DocumentReference? objectparameter;
  final double? objectrefvalue;

  static String routeName = 'Publicpage';
  static String routePath = '/Publicpage';

  @override
  State<PublicpageWidget> createState() => _PublicpageWidgetState();
}

class _PublicpageWidgetState extends State<PublicpageWidget>
    with TickerProviderStateMixin {
  late PublicpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasIconTriggered2 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PublicpageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {});
      _model.addToBagitems(widget.objectparameter!);
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 2,
    )..addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(100.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 1.0),
            end: const Offset(0.0, 1.0),
          ),
        ],
      ),
      'iconOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 1.0),
            end: const Offset(0.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.profileparameter!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                  ),
                ),
              ),
            ),
          );
        }

        final publicpageUsersRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            body: Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: 1170,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: StreamBuilder<List<AnalyticsRecord>>(
                      stream: queryAnalyticsRecord(
                        queryBuilder: (analyticsRecord) =>
                            analyticsRecord.where(
                          'user_ref',
                          isEqualTo: publicpageUsersRecord.reference,
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
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                ),
                              ),
                            ),
                          );
                        }
                        List<AnalyticsRecord> stackAnalyticsRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final stackAnalyticsRecord =
                            stackAnalyticsRecordList.isNotEmpty
                                ? stackAnalyticsRecordList.first
                                : null;

                        return Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 240,
                                  decoration: BoxDecoration(
                                    color:
                                    borderRadius: BorderRadius.circular(12),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Stack(
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color:
                                                      .secondaryBackground,
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                              child: Image.network(
                                                publicpageUsersRecord.banner,
                                                width: 200,
                                                height: 200,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                padding: const EdgeInsets.all(4),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    StreamBuilder<UsersRecord>(
                                                      stream: UsersRecord
                                                          .getDocument(
                                                              currentUserReference!),
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
                                                          decoration:
                                                              BoxDecoration(
                                                                    .of(context)
                                                                .alternate,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              width: 1,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    4),
                                                            child: Container(
                                                              width: 100,
                                                              height: 100,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                publicpageUsersRecord
                                                                    .profilePicture,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0, 1),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  publicpageUsersRecord
                                                                      .name,
                                                                      .of(context)
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
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'd9hwpxrz' /*   */,
                                                              ),
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  publicpageUsersRecord
                                                                      .surname,
                                                              style:
                                                                  const TextStyle(),
                                                            )
                                                          ],
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0, -1),
                                                      child: Text(
                                                        publicpageUsersRecord
                                                            .username,
                                                        style:
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
                                                    Flexible(
                                                      child: ClipRRect(
                                                        child: Container(
                                                          decoration:
                                                              const BoxDecoration(),
                                                        ),
                                                      ),
                                                    ),
                                                    if (publicpageUsersRecord
                                                            .userVerified ==
                                                        true)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    12, 0),
                                                        child: Container(
                                                          width: 120,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'am409q5i' /* Verified */,
                                                                ),
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .verified_rounded,
                                                                        context)
                                                                    .secondary,
                                                                size: 24,
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 8)),
                                                          ),
                                                        ),
                                                      ),
                                                  ]
                                                      .divide(
                                                          const SizedBox(height: 4))
                                                      .addToStart(
                                                          const SizedBox(height: 8)),
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
                                                  Container(
                                                    width: 100,
                                                    height: 120,
                                                    decoration: const BoxDecoration(),
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
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Expanded(
                                                                child: InkWell(
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
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .tabBarController!
                                                                          .animateTo(
                                                                        2,
                                                                        duration:
                                                                            const Duration(milliseconds: 300),
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
                                                                        const BoxDecoration(),
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
                                                                          color:
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1,
                                                                              0),
                                                                          child:
                                                                              FutureBuilder<int>(
                                                                            future:
                                                                                _model.postsCount(
                                                                              requestFn: () => querySubmissionRecordCount(
                                                                                queryBuilder: (submissionRecord) => submissionRecord
                                                                                    .where(
                                                                                      'poster',
                                                                                      isEqualTo: publicpageUsersRecord.reference,
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
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              int textCount = snapshot.data!;

                                                                              return Text(
                                                                                formatNumber(
                                                                                  textCount,
                                                                                  formatType: FormatType.compact,
                                                                                ),
                                                                                      fontFamily: 'Inter',
                                                                                      fontSize: 16,
                                                                                      letterSpacing: 0.0,
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
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: InkWell(
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
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .tabBarController!
                                                                          .animateTo(
                                                                        3,
                                                                        duration:
                                                                            const Duration(milliseconds: 300),
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
                                                                        const BoxDecoration(),
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
                                                                          color:
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        FutureBuilder<
                                                                            int>(
                                                                          future:
                                                                              _model.itemsCount(
                                                                            requestFn: () =>
                                                                                querySubmissionRecordCount(
                                                                              queryBuilder: (submissionRecord) => submissionRecord
                                                                                  .where(
                                                                                    'poster',
                                                                                    isEqualTo: publicpageUsersRecord.reference,
                                                                                  )
                                                                                  .where(
                                                                                    'type_object',
                                                                                    isEqualTo: 'Item',
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
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            int textCount =
                                                                                snapshot.data!;

                                                                            return Text(
                                                                              formatNumber(
                                                                                textCount,
                                                                                formatType: FormatType.compact,
                                                                              ),
                                                                                    fontFamily: 'Inter',
                                                                                    fontSize: 16,
                                                                                    letterSpacing: 0.0,
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
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  Text(
                                                                    publicpageUsersRecord
                                                                        .bio,
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
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
                                                        ),
                                                      ].divide(
                                                          const SizedBox(height: 8)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(-1, -1),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 100,
                                            buttonSize: 35,
                                            fillColor:
                                                    .secondaryBackground,
                                            icon: Icon(
                                              Icons.chevron_left_sharp,
                                              color:
                                                      .secondaryText,
                                              size: 18,
                                            ),
                                            onPressed: () async {
                                              context.safePop();
                                                  false;
                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          Align(
                                            alignment: const Alignment(-1, 0),
                                            child: FlutterFlowButtonTabBar(
                                              useToggleButtonStyle: true,
                                              isScrollable: true,
                                              labelStyle:
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                      ),
                                              unselectedLabelStyle: const TextStyle(),
                                              labelColor:
                                                      .primary,
                                              unselectedLabelColor:
                                                      .secondaryText,
                                              backgroundColor:
                                                      .accent1,
                                              unselectedBackgroundColor:
                                                      .alternate,
                                              borderWidth: 0,
                                              borderRadius: 12,
                                              elevation: 0,
                                              labelPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 0),
                                              buttonMargin:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                              tabs: [
                                                Tab(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'ekd3suu5' /* Activity */,
                                                  ),
                                                ),
                                                Tab(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'f3fd1gxk' /* Posts */,
                                                  ),
                                                ),
                                                Tab(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '0pttijto' /* Items */,
                                                  ),
                                                ),
                                              ],
                                              controller:
                                                  _model.tabBarController,
                                              onTap: (i) async {
                                                [
                                                  () async {},
                                                  () async {},
                                                  () async {}
                                                ][i]();
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              controller:
                                                  _model.tabBarController,
                                              children: [
                                                KeepAliveWidgetWrapper(
                                                  builder: (context) =>
                                                      Container(
                                                    width: double.infinity,
                                                    height: 400,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 4, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Container(
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4),
                                                              child: Column(
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
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -1,
                                                                            1),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              24,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'rrvc7b9p' /* Activities & Interests : */,
                                                                        ),
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            12,
                                                                            0),
                                                                    child:
                                                                        FlutterFlowChoiceChips(
                                                                      options: publicpageUsersRecord
                                                                          .userInterests
                                                                          .take(
                                                                              3)
                                                                          .toList()
                                                                          .map((label) =>
                                                                              ChipData(label))
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.choiceChipsValue1 = val?.firstOrNull),
                                                                      selectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        iconColor:
                                                                        iconSize:
                                                                            16,
                                                                        elevation:
                                                                            0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                      unselectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 10,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        iconColor:
                                                                        iconSize:
                                                                            16,
                                                                        elevation:
                                                                            0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                      chipSpacing:
                                                                          4,
                                                                      rowSpacing:
                                                                          4,
                                                                      multiselect:
                                                                          false,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .spaceAround,
                                                                      controller: _model
                                                                              .choiceChipsValueController1 ??=
                                                                          FormFieldController<
                                                                              List<String>>(
                                                                        [],
                                                                      ),
                                                                      wrapped:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            12,
                                                                            0),
                                                                    child:
                                                                        FlutterFlowChoiceChips(
                                                                      options: publicpageUsersRecord
                                                                          .userOccupations
                                                                          .take(
                                                                              3)
                                                                          .toList()
                                                                          .map((label) =>
                                                                              ChipData(label))
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.choiceChipsValue2 = val?.firstOrNull),
                                                                      selectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        iconColor:
                                                                        iconSize:
                                                                            16,
                                                                        elevation:
                                                                            0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                      unselectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 10,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        iconColor:
                                                                        iconSize:
                                                                            16,
                                                                        elevation:
                                                                            0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                      chipSpacing:
                                                                          4,
                                                                      rowSpacing:
                                                                          4,
                                                                      multiselect:
                                                                          false,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .spaceAround,
                                                                      controller: _model
                                                                              .choiceChipsValueController2 ??=
                                                                          FormFieldController<
                                                                              List<String>>(
                                                                        [],
                                                                      ),
                                                                      wrapped:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ]
                                                                    .divide(const SizedBox(
                                                                        height:
                                                                            8))
                                                                    .addToStart(
                                                                        const SizedBox(
                                                                            height:
                                                                                8))
                                                                    .addToEnd(
                                                                        const SizedBox(
                                                                            height:
                                                                                8)),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              width: 100,
                                                              height: 200,
                                                              decoration:
                                                                  BoxDecoration(
                                                                        context)
                                                                    .alternate,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            12),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .stretch,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            160,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                          borderRadius:
                                                                              BorderRadius.circular(12),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8),
                                                                                child: Container(
                                                                                  width: 100,
                                                                                  height: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(12),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.all(8),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'ieiybayx' /* Places : */,
                                                                                          ),
                                                                                                fontFamily: 'Montserrat',
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                                                                                        child: FlutterFlowChoiceChips(
                                                                                          options: publicpageUsersRecord.userPlaces.take(3).toList().map((label) => ChipData(label)).toList(),
                                                                                          onChanged: (val) => safeSetState(() => _model.choiceChipsValue3 = val?.firstOrNull),
                                                                                          selectedChipStyle: ChipStyle(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontSize: 10,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            iconSize: 16,
                                                                                            elevation: 0,
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                          ),
                                                                                          unselectedChipStyle: ChipStyle(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontSize: 10,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            iconSize: 16,
                                                                                            elevation: 0,
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                          ),
                                                                                          chipSpacing: 4,
                                                                                          rowSpacing: 4,
                                                                                          multiselect: false,
                                                                                          alignment: WrapAlignment.center,
                                                                                          controller: _model.choiceChipsValueController3 ??= FormFieldController<List<String>>(
                                                                                            [],
                                                                                          ),
                                                                                          wrapped: true,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 100,
                                                                              child: VerticalDivider(
                                                                                thickness: 2,
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Align(
                                                                                        alignment: const AlignmentDirectional(1, 0),
                                                                                        child: RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'p1qie27l' /* USER PIN :  */,
                                                                                                ),
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      fontSize: 12,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: valueOrDefault<String>(
                                                                                                  formatNumber(
                                                                                                    publicpageUsersRecord.userPins.length,
                                                                                                    formatType: FormatType.compact,
                                                                                                  ),
                                                                                                  '0',
                                                                                                ),
                                                                                                style: TextStyle(
                                                                                                  fontSize: 16,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  fontSize: 12,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Align(
                                                                                        alignment: const AlignmentDirectional(1, 0),
                                                                                        child: RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'ewrxuzmi' /* OBJECT PIN :  */,
                                                                                                ),
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      fontSize: 12,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'fbyjwip0' /* 212 */,
                                                                                                ),
                                                                                                style: TextStyle(
                                                                                                  fontSize: 16,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  fontSize: 12,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Align(
                                                                                        alignment: const AlignmentDirectional(1, 0),
                                                                                        child: RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'j6onlmua' /* VOTE RATE :  */,
                                                                                                ),
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      fontSize: 12,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'avby2qrn' /* 213 */,
                                                                                                ),
                                                                                                style: TextStyle(
                                                                                                  fontSize: 16,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  fontSize: 12,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Align(
                                                                                        alignment: const AlignmentDirectional(1, 0),
                                                                                        child: RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  '6u4ml2fe' /* ORDER RATE :  */,
                                                                                                ),
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      fontSize: 12,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'gz1x8wb4' /* 213 */,
                                                                                                ),
                                                                                                style: TextStyle(
                                                                                                  fontSize: 16,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  fontSize: 12,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                '8jz7qus4' /*  # ORDERS :  */,
                                                                                              ),
                                                                                                    fontFamily: 'Montserrat',
                                                                                                    fontSize: 12,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'yl1fcbft' /* 212 */,
                                                                                              ),
                                                                                              style: TextStyle(
                                                                                                fontSize: 16,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                                fontFamily: 'Montserrat',
                                                                                                fontSize: 12,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(const SizedBox(height: 8)).addToStart(const SizedBox(height: 4)).addToEnd(const SizedBox(height: 4)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].addToStart(const SizedBox(width: 8)).addToEnd(const SizedBox(width: 8)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            160,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                          borderRadius:
                                                                              BorderRadius.circular(12),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.stretch,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(12),
                                                                                  child: Image.asset(
                                                                                    'assets/images/istockphoto-1174960560-612x612.jpg',
                                                                                    width: 200,
                                                                                    height: 200,
                                                                                    fit: BoxFit.none,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(const SizedBox(height: 8)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(
                                                                      const SizedBox(
                                                                          height:
                                                                              8)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]
                                                            .divide(const SizedBox(
                                                                height: 8))
                                                            .addToStart(
                                                                const SizedBox(
                                                                    height: 8))
                                                            .addToEnd(const SizedBox(
                                                                height: 8)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                KeepAliveWidgetWrapper(
                                                  builder: (context) =>
                                                      Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 4, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        8,
                                                                        0,
                                                                        8),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 50,
                                                              decoration:
                                                                  BoxDecoration(
                                                                        context)
                                                                    .alternate,
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
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        FlutterFlowChoiceChips(
                                                                      options: [
                                                                        ChipData(
                                                                            FFLocalizations.of(context).getText(
                                                                              'wk8go3z8' /* Image */,
                                                                            ),
                                                                            Icons.image),
                                                                        ChipData(
                                                                            FFLocalizations.of(context).getText(
                                                                              '3xfhvvjj' /* Video */,
                                                                            ),
                                                                            Icons.play_circle),
                                                                        ChipData(
                                                                            FFLocalizations.of(context).getText(
                                                                              'hy0alzf3' /* Audio */,
                                                                            ),
                                                                            Icons.audiotrack_rounded),
                                                                        ChipData(
                                                                            FFLocalizations.of(context).getText(
                                                                              '3h6upgka' /* Text */,
                                                                            ),
                                                                            Icons.text_fields)
                                                                      ],
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.choiceChipsPostsValues = val),
                                                                      selectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 12,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        iconColor:
                                                                        iconSize:
                                                                            16,
                                                                        elevation:
                                                                            0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                      unselectedChipStyle:
                                                                          ChipStyle(
                                                                        backgroundColor:
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        iconColor:
                                                                        iconSize:
                                                                            16,
                                                                        elevation:
                                                                            0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                      chipSpacing:
                                                                          6,
                                                                      rowSpacing:
                                                                          8,
                                                                      multiselect:
                                                                          true,
                                                                      initialized:
                                                                          _model.choiceChipsPostsValues !=
                                                                              null,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      controller: _model
                                                                              .choiceChipsPostsValueController ??=
                                                                          FormFieldController<
                                                                              List<String>>(
                                                                        [
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'i32agl68' /* Image */,
                                                                          )
                                                                        ],
                                                                      ),
                                                                      wrapped:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 100,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: PagedMasonryGridView<
                                                                  DocumentSnapshot<
                                                                      Object?>?,
                                                                  SubmissionRecord>.count(
                                                                pagingController:
                                                                    _model
                                                                        .setStaggeredViewController1(
                                                                  SubmissionRecord
                                                                      .collection
                                                                      .where(
                                                                        'poster',
                                                                        isEqualTo:
                                                                            publicpageUsersRecord.reference,
                                                                      )
                                                                      .where(
                                                                        'type_object',
                                                                        isEqualTo:
                                                                            'Post',
                                                                      )
                                                                      .orderBy(
                                                                          'date',
                                                                          descending:
                                                                              true),
                                                                ),
                                                                physics:
                                                                    const NeverScrollableScrollPhysics(),
                                                                crossAxisCount:
                                                                    2,
                                                                crossAxisSpacing:
                                                                    10,
                                                                mainAxisSpacing:
                                                                    10,
                                                                builderDelegate:
                                                                    PagedChildBuilderDelegate<
                                                                        SubmissionRecord>(
                                                                  // Customize what your widget looks like when it's loading the first page.
                                                                  firstPageProgressIndicatorBuilder:
                                                                      (_) =>
                                                                          Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  // Customize what your widget looks like when it's loading another page.
                                                                  newPageProgressIndicatorBuilder:
                                                                      (_) =>
                                                                          Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),

                                                                  itemBuilder:
                                                                      (context,
                                                                          _,
                                                                          staggeredViewIndex) {
                                                                    final staggeredViewSubmissionRecord = _model
                                                                        .staggeredViewPagingController1!
                                                                        .itemList![staggeredViewIndex];
                                                                    return Builder(
                                                                      builder: (context) =>
                                                                          FutureBuilder<
                                                                              SubmissionRecord>(
                                                                        future:
                                                                            SubmissionRecord.getDocumentOnce(staggeredViewSubmissionRecord.reference),
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
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }

                                                                          final objectSubmissionRecord =
                                                                              snapshot.data!;

                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (dialogContext) {
                                                                                  return Dialog(
                                                                                    elevation: 0,
                                                                                    insetPadding: EdgeInsets.zero,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    alignment: const AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                    child: GestureDetector(
                                                                                      onTap: () {
                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                      },
                                                                                      child: ObjectWidget(
                                                                                        object: objectSubmissionRecord,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                constraints: const BoxConstraints(
                                                                                  maxHeight: 320,
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  boxShadow: const [
                                                                                    BoxShadow(
                                                                                      blurRadius: 5,
                                                                                      color: Color(0x3416202A),
                                                                                      offset: Offset(
                                                                                        0.0,
                                                                                        3,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                  children: [
                                                                                    if ((objectSubmissionRecord.imagesextra.length != null) && (objectSubmissionRecord.refvalue == null || objectSubmissionRecord.refvalue == ''))
                                                                                      Builder(
                                                                                        builder: (context) {
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
                                                                                                  decoration: const BoxDecoration(),
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
                                                                                    if (objectSubmissionRecord.video != null && objectSubmissionRecord.video != '')
                                                                                      Expanded(
                                                                                        child: Row(
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
                                                                                    if (objectSubmissionRecord.audio != null && objectSubmissionRecord.audio != '')
                                                                                      Expanded(
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                width: 100,
                                                                                                height: 320,
                                                                                                decoration: BoxDecoration(
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
                                                                                                            fontFamily: 'Sora',
                                                                                                            fontSize: 20,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                            fontFamily: 'Inter',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                      fillColor: const Color(0x00000000),
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
                                                                                    if ((objectSubmissionRecord.body != null && objectSubmissionRecord.body != '') && !(objectSubmissionRecord.imagesextra.isNotEmpty))
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.all(8),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: const AlignmentDirectional(-1, -1),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsets.all(8),
                                                                                                child: Text(
                                                                                                  objectSubmissionRecord.header,
                                                                                                  maxLines: 3,
                                                                                                        fontFamily: 'Inter',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Divider(
                                                                                              thickness: 1,
                                                                                              indent: 12,
                                                                                              endIndent: 12,
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: const AlignmentDirectional(-1, -1),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
                                                                                                child: Text(
                                                                                                  objectSubmissionRecord.body,
                                                                                                  maxLines: 4,
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
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
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
                                                  builder: (context) =>
                                                      Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 4, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        8,
                                                                        0,
                                                                        4),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 50,
                                                              decoration:
                                                                  BoxDecoration(
                                                                        context)
                                                                    .alternate,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6,
                                                                            6,
                                                                            6,
                                                                            6),
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
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            100,
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          color:
                                                                              Color(0x00FFFFFF),
                                                                        ),
                                                                        alignment: const AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(0, 0),
                                                                              child: FlutterFlowChoiceChips(
                                                                                options: [
                                                                                  ChipData(FFLocalizations.of(context).getText(
                                                                                    'v1k7vb29' /* All */,
                                                                                  )),
                                                                                  ChipData(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'ww6dzqw4' /* Popular */,
                                                                                      ),
                                                                                      Icons.star_rounded),
                                                                                  ChipData(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'jot3aa1n' /* Catalogues */,
                                                                                      ),
                                                                                      Icons.menu_book)
                                                                                ],
                                                                                onChanged: (val) => safeSetState(() => _model.choiceChipsItemsValue = val?.firstOrNull),
                                                                                selectedChipStyle: ChipStyle(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  iconSize: 16,
                                                                                  elevation: 0,
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                                unselectedChipStyle: ChipStyle(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  iconSize: 16,
                                                                                  elevation: 0,
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                                chipSpacing: 6,
                                                                                rowSpacing: 4,
                                                                                multiselect: false,
                                                                                initialized: _model.choiceChipsItemsValue != null,
                                                                                alignment: WrapAlignment.center,
                                                                                controller: _model.choiceChipsItemsValueController ??= FormFieldController<List<String>>(
                                                                                  [
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'wok3m9lz' /* All */,
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
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          if (_model
                                                                  .choiceChipsItemsValue !=
                                                              'Catalogues')
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            12,
                                                                            8,
                                                                            0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        SubmissionRecord>>(
                                                                  stream:
                                                                      querySubmissionRecord(
                                                                    queryBuilder: (submissionRecord) => submissionRecord
                                                                        .where(
                                                                          'poster',
                                                                          isEqualTo:
                                                                              publicpageUsersRecord.reference,
                                                                        )
                                                                        .where(
                                                                          'type_object',
                                                                          isEqualTo:
                                                                              'Item',
                                                                        )
                                                                        .orderBy('date', descending: true),
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
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<SubmissionRecord>
                                                                        staggeredViewSubmissionRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return MasonryGridView
                                                                        .builder(
                                                                      physics:
                                                                          const NeverScrollableScrollPhysics(),
                                                                      gridDelegate:
                                                                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            2,
                                                                      ),
                                                                      crossAxisSpacing:
                                                                          12,
                                                                      mainAxisSpacing:
                                                                          8,
                                                                      itemCount:
                                                                          staggeredViewSubmissionRecordList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              staggeredViewIndex) {
                                                                        final staggeredViewSubmissionRecord =
                                                                            staggeredViewSubmissionRecordList[staggeredViewIndex];
                                                                        return Builder(
                                                                          builder: (context) =>
                                                                              StreamBuilder<SubmissionRecord>(
                                                                            stream:
                                                                                SubmissionRecord.getDocument(staggeredViewSubmissionRecord.reference),
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
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }

                                                                              final objectSubmissionRecord = snapshot.data!;

                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (dialogContext) {
                                                                                      return Dialog(
                                                                                        elevation: 0,
                                                                                        insetPadding: EdgeInsets.zero,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        alignment: const AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                        child: GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(dialogContext).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: ObjectWidget(
                                                                                            object: objectSubmissionRecord,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                  child: Container(
                                                                                    width: 100,
                                                                                    height: 240,
                                                                                    constraints: const BoxConstraints(
                                                                                      maxHeight: 320,
                                                                                    ),
                                                                                    decoration: BoxDecoration(
                                                                                      boxShadow: const [
                                                                                        BoxShadow(
                                                                                          blurRadius: 5,
                                                                                          color: Color(0x3416202A),
                                                                                          offset: Offset(
                                                                                            0.0,
                                                                                            3,
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                    ),
                                                                                    child: Stack(
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
                                                                                          alignment: const AlignmentDirectional(1, 1),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsets.all(8),
                                                                                            child: Container(
                                                                                              height: 40,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(12),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsets.all(4),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                                                                                      child: Icon(
                                                                                                        Icons.toll,
                                                                                                        size: 16,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      child: Text(
                                                                                                        staggeredViewSubmissionRecord.refvalue,
                                                                                                        textAlign: TextAlign.center,
                                                                                                              fontFamily: 'Inter',
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                                                                                      child: FlutterFlowIconButton(
                                                                                                        borderRadius: 12,
                                                                                                        buttonSize: 30,
                                                                                                        icon: Icon(
                                                                                                          Icons.add,
                                                                                                          size: 14,
                                                                                                        ),
                                                                                                        onPressed: () async {
                                                                                                          _model.addToBagitems(objectSubmissionRecord.reference);
                                                                                                          _model.addToRefvaluesinbagitems(objectSubmissionRecord.objectRefvalue);
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(const SizedBox(width: 8)),
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
                                                          if (_model
                                                                  .choiceChipsItemsValue ==
                                                              'Catalogues')
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  StreamBuilder<
                                                                      List<
                                                                          CatalogueRecord>>(
                                                                    stream:
                                                                        queryCatalogueRecord(
                                                                      queryBuilder:
                                                                          (catalogueRecord) =>
                                                                              catalogueRecord.where(
                                                                        'user_ref',
                                                                        isEqualTo:
                                                                            currentUserReference,
                                                                      ),
                                                                      limit: 8,
                                                                    ),
                                                                    builder:
                                                                        (context,
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
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<CatalogueRecord>
                                                                          listViewCatalogueRecordList =
                                                                          snapshot
                                                                              .data!;

                                                                      return ListView
                                                                          .separated(
                                                                        padding:
                                                                            const EdgeInsets.fromLTRB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0,
                                                                        ),
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            listViewCatalogueRecordList.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                const SizedBox(height: 8),
                                                                        itemBuilder:
                                                                            (context,
                                                                                listViewIndex) {
                                                                          final listViewCatalogueRecord =
                                                                              listViewCatalogueRecordList[listViewIndex];
                                                                          return Builder(
                                                                            builder: (context) =>
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (dialogContext) {
                                                                                    return Dialog(
                                                                                      elevation: 0,
                                                                                      insetPadding: EdgeInsets.zero,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      alignment: const AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
                                                                                      child: GestureDetector(
                                                                                        onTap: () {
                                                                                          FocusScope.of(dialogContext).unfocus();
                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                        },
                                                                                        child: CatalogueWidget(),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                width: 100,
                                                                                height: 157,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(12),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(12),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                                                                            child: Text(
                                                                                              listViewCatalogueRecord.catalalogueName,
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 18,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'a7rmp25t' /* # : */,
                                                                                              ),
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 14,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            listViewCatalogueRecord.totalItems.toString(),
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontSize: 16,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Align(
                                                                                              alignment: const AlignmentDirectional(1, 0),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsets.all(8),
                                                                                                child: Icon(
                                                                                                  Icons.edit,
                                                                                                  size: 24,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          width: 100,
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                            border: Border.all(
                                                                                              width: 1,
                                                                                            ),
                                                                                          ),
                                                                                          child: const Padding(
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
                                                                                    ].divide(const SizedBox(height: 8)),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ].divide(
                                                                    const SizedBox(
                                                                        height:
                                                                            8)),
                                                              ),
                                                            ),
                                                        ].divide(const SizedBox(
                                                            height: 4)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(1, -1),
                                        child: Container(
                                          width: 120,
                                          height: 46,
                                          decoration: BoxDecoration(
                                                .alternate,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color:
                                                      .alternate,
                                              width: 1,
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  if (_model.isPinned) {
                                                      onPressed: () async {
                                                        await publicpageUsersRecord
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'pinned_users':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                currentUserReference
                                                              ]),
                                                            },
                                                          ),
                                                        });

                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'user_pins':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                publicpageUsersRecord
                                                                    .reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        _model.isPinned = false;
                                                        safeSetState(() {});
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'rxs718xt' /* pin */,
                                                      ),
                                                      icon: FaIcon(
                                                        FontAwesomeIcons.mapPin,
                                                        color:
                                                                    context)
                                                                .secondaryText,
                                                        size: 14,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(16, 0,
                                                                    16, 0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 0),
                                                                .of(context)
                                                            .secondaryBackground,
                                                        textStyle:
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                    );
                                                  } else {
                                                      onPressed: () async {
                                                        await publicpageUsersRecord
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'pinned_users':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                currentUserReference
                                                              ]),
                                                            },
                                                          ),
                                                        });

                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'user_pins':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                publicpageUsersRecord
                                                                    .reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        _model.isPinned = true;
                                                        safeSetState(() {});
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'd6n66dbo' /* unpin */,
                                                      ),
                                                      icon: FaIcon(
                                                        FontAwesomeIcons.mapPin,
                                                        color:
                                                                    context)
                                                                .secondary,
                                                        size: 14,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(16, 0,
                                                                    16, 0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 0),
                                                        color:
                                                                    context)
                                                                .alternate,
                                                        textStyle:
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(const SizedBox(height: 8)),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0, 1),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 24),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 8, 0),
                                      child: Container(
                                        width: 100,
                                        height: 560,
                                        decoration: BoxDecoration(
                                              .alternate,
                                          boxShadow: const [
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
                                        child: Form(
                                          key: _model.formKey,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: SizedBox(
                                              width: double.infinity,
                                              height: 500,
                                              child: PageView(
                                                controller: _model
                                                        .bagPageViewController ??=
                                                    PageController(
                                                        initialPage: 0),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0,
                                                                    8, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'qn31det6' /* Your bag */,
                                                                ),
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          20,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight.w500,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
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
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                SingleChildScrollView(
                                                                  child:
                                                                      Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(12),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final bag = _model.bagitems.unique((e) => e).toList();

                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: bag.length,
                                                                              itemBuilder: (context, bagIndex) {
                                                                                final bagItem = bag[bagIndex];
                                                                                return Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(12),
                                                                                      border: Border.all(
                                                                                        width: 1,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.all(8),
                                                                                      child: StreamBuilder<SubmissionRecord>(
                                                                                        stream: SubmissionRecord.getDocument(bagItem),
                                                                                        builder: (context, snapshot) {
                                                                                          // Customize what your widget looks like when it's loading.
                                                                                          if (!snapshot.hasData) {
                                                                                            return Center(
                                                                                              child: SizedBox(
                                                                                                width: 50,
                                                                                                height: 50,
                                                                                                child: CircularProgressIndicator(
                                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }

                                                                                          final rowSubmissionRecord = snapshot.data!;

                                                                                          return Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                                  child: RichText(
                                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                                    text: TextSpan(
                                                                                                      children: [
                                                                                                        TextSpan(
                                                                                                          text: valueOrDefault<String>(
                                                                                                            _model.bagitems.length.toString(),
                                                                                                            '1',
                                                                                                          ),
                                                                                                                fontFamily: 'Inter',
                                                                                                                fontSize: 16,
                                                                                                                letterSpacing: 8,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                        TextSpan(
                                                                                                          text: rowSubmissionRecord.header,
                                                                                                          style: const TextStyle(),
                                                                                                        )
                                                                                                      ],
                                                                                                            fontFamily: 'Inter',
                                                                                                            fontSize: 16,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                    ),
                                                                                                    textAlign: TextAlign.start,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                                child: Text(
                                                                                                  rowSubmissionRecord.objectRefvalue.toString(),
                                                                                                        fontFamily: 'Inter',
                                                                                                        fontSize: 16,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '6hukamju' /* T. */,
                                                                                                  ),
                                                                                                        fontFamily: 'Inter',
                                                                                                        fontSize: 16,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              FlutterFlowIconButton(
                                                                                                borderRadius: 100,
                                                                                                buttonSize: 30,
                                                                                                icon: Icon(
                                                                                                  Icons.close,
                                                                                                  size: 14,
                                                                                                ),
                                                                                                onPressed: () async {
                                                                                                  _model.removeFromBagitems(bagItem);
                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
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
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(8,
                                                                    0, 8, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                onPressed:
                                                                    () async {
                                                                  await _model
                                                                      .bagPageViewController
                                                                      ?.nextPage(
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            300),
                                                                    curve: Curves
                                                                        .ease,
                                                                  );
                                                                },
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'w2nk774u' /* Order */,
                                                                ),
                                                                icon: const Icon(
                                                                  Icons
                                                                      .login_sharp,
                                                                  size: 20,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          0,
                                                                          16,
                                                                          0),
                                                                  iconAlignment:
                                                                      IconAlignment
                                                                          .end,
                                                                  iconPadding:
                                                                      const EdgeInsetsDirectional.fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                          context)
                                                                      .secondaryBackground,
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color:
                                                                        fontSize:
                                                                            14,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(8),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8)),
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(const SizedBox(
                                                            height: 8))
                                                        .addToEnd(const SizedBox(
                                                            height: 8)),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  8),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                                      context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            8,
                                                                            8,
                                                                            0),
                                                                    child:
                                                                        Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize.max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              32,
                                                                          height:
                                                                              32,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color: Color(0xADFF6A73),
                                                                            shape: BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Icon(
                                                                            Icons.description_rounded,
                                                                            size: 20,
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                            child: Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'n04chxo4' /* Order description */,
                                                                              ),
                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                    color: const Color(0xFF15161E),
                                                                                    fontSize: 14,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(12),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final bag =
                                                                              _model.bagitems.unique((e) => e).toList();

                                                                          return ListView.separated(
                                                                            padding: EdgeInsets.zero,
                                                                            shrinkWrap: true,
                                                                            scrollDirection: Axis.vertical,
                                                                            itemCount: bag.length,
                                                                            separatorBuilder: (_, __) => const SizedBox(height: 4),
                                                                            itemBuilder: (context, bagIndex) {
                                                                              final bagItem = bag[bagIndex];
                                                                              return Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(12),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(8),
                                                                                  child: StreamBuilder<SubmissionRecord>(
                                                                                    stream: SubmissionRecord.getDocument(bagItem),
                                                                                    builder: (context, snapshot) {
                                                                                      // Customize what your widget looks like when it's loading.
                                                                                      if (!snapshot.hasData) {
                                                                                        return Center(
                                                                                          child: SizedBox(
                                                                                            width: 50,
                                                                                            height: 50,
                                                                                            child: CircularProgressIndicator(
                                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }

                                                                                      final rowSubmissionRecord = snapshot.data!;

                                                                                      return Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                              child: RichText(
                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                text: TextSpan(
                                                                                                  children: [
                                                                                                    TextSpan(
                                                                                                      text: bagIndex == bagIndex
                                                                                                          ? valueOrDefault<String>(
                                                                                                              _model.bagitems.length.toString(),
                                                                                                              '1',
                                                                                                            )
                                                                                                          : '1',
                                                                                                            fontFamily: 'Inter',
                                                                                                            fontSize: 16,
                                                                                                            letterSpacing: 8,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: rowSubmissionRecord.header,
                                                                                                      style: const TextStyle(),
                                                                                                    )
                                                                                                  ],
                                                                                                        fontFamily: 'Inter',
                                                                                                        fontSize: 16,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                                textAlign: TextAlign.start,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                            child: Text(
                                                                                              rowSubmissionRecord.objectRefvalue.toString(),
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 16,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'q5u81hxr' /* T. */,
                                                                                              ),
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 16,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
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
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            12,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                        borderRadius:
                                                                            BorderRadius.circular(12),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'b42n7wje' /* Total : */,
                                                                                  ),
                                                                                        fontFamily: 'Inter',
                                                                                        fontSize: 16,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                child: Text(
                                                                                  functions.sumofBagitemsListRefvalues(_model.refvaluesinbagitems.sortedList(keyOf: (e) => e.toString(), desc: false).toList()).toString(),
                                                                                        fontFamily: 'Inter',
                                                                                        fontSize: 16,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'fqagdjt7' /* T. */,
                                                                                ),
                                                                                      fontFamily: 'Inter',
                                                                                      fontSize: 16,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            8,
                                                                            12,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                        borderRadius:
                                                                            BorderRadius.circular(12),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            8),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'i4u5yua3' /* Comment */,
                                                                                ),
                                                                                      fontFamily: 'Montserrat',
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                                                              child: Icon(
                                                                                Icons.edit,
                                                                                size: 18,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            12),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                        borderRadius:
                                                                            BorderRadius.circular(12),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.stretch,
                                                                          children:
                                                                              [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 4, 0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'rbv2478s' /* Select order method : */,
                                                                                ),
                                                                                      fontFamily: 'Montserrat',
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8),
                                                                              child: StreamBuilder<List<OrderMethodsRecord>>(
                                                                                stream: queryOrderMethodsRecord(
                                                                                  queryBuilder: (orderMethodsRecord) => orderMethodsRecord.where(
                                                                                    'method_poster',
                                                                                    isEqualTo: publicpageUsersRecord.reference,
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
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  List<OrderMethodsRecord> choiceChipsORDERMETHODSOrderMethodsRecordList = snapshot.data!;

                                                                                  return FlutterFlowChoiceChips(
                                                                                    options: choiceChipsORDERMETHODSOrderMethodsRecordList.map((e) => e.methodType).toList().sortedList(keyOf: (e) => e, desc: true).map((label) => ChipData(label)).toList(),
                                                                                    onChanged: (val) => safeSetState(() => _model.choiceChipsORDERMETHODSValue = val?.firstOrNull),
                                                                                    selectedChipStyle: ChipStyle(
                                                                                            fontFamily: 'Inter',
                                                                                            fontSize: 12,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      iconSize: 16,
                                                                                      elevation: 0,
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                    ),
                                                                                    unselectedChipStyle: ChipStyle(
                                                                                            fontFamily: 'Inter',
                                                                                            fontSize: 12,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      iconSize: 16,
                                                                                      elevation: 0,
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                    ),
                                                                                    chipSpacing: 8,
                                                                                    rowSpacing: 8,
                                                                                    multiselect: false,
                                                                                    alignment: WrapAlignment.center,
                                                                                    controller: _model.choiceChipsORDERMETHODSValueController ??= FormFieldController<List<String>>(
                                                                                      [],
                                                                                    ),
                                                                                    wrapped: false,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 4, 0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'zxia3f0n' /* Select wallet method : */,
                                                                                ),
                                                                                      fontFamily: 'Montserrat',
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8),
                                                                              child: StreamBuilder<List<WalletMethodsRecord>>(
                                                                                stream: queryWalletMethodsRecord(
                                                                                  queryBuilder: (walletMethodsRecord) => walletMethodsRecord.where(
                                                                                    'method_poster',
                                                                                    isEqualTo: publicpageUsersRecord.reference,
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
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  List<WalletMethodsRecord> choiceChipsWALLETMETHODSWalletMethodsRecordList = snapshot.data!;

                                                                                  return FlutterFlowChoiceChips(
                                                                                    options: choiceChipsWALLETMETHODSWalletMethodsRecordList.map((e) => e.methodType).toList().sortedList(keyOf: (e) => e, desc: true).map((label) => ChipData(label)).toList(),
                                                                                    onChanged: (val) => safeSetState(() => _model.choiceChipsWALLETMETHODSValue = val?.firstOrNull),
                                                                                    selectedChipStyle: ChipStyle(
                                                                                            fontFamily: 'Inter',
                                                                                            fontSize: 12,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      iconSize: 16,
                                                                                      elevation: 0,
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                    ),
                                                                                    unselectedChipStyle: ChipStyle(
                                                                                            fontFamily: 'Inter',
                                                                                            fontSize: 12,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      iconSize: 16,
                                                                                      elevation: 0,
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                    ),
                                                                                    chipSpacing: 8,
                                                                                    rowSpacing: 8,
                                                                                    multiselect: false,
                                                                                    alignment: WrapAlignment.center,
                                                                                    controller: _model.choiceChipsWALLETMETHODSValueController ??= FormFieldController<List<String>>(
                                                                                      [],
                                                                                    ),
                                                                                    wrapped: false,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ].divide(const SizedBox(height: 8)).addToStart(const SizedBox(height: 8)).addToEnd(const SizedBox(height: 8)),
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
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(8,
                                                                    0, 8, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child:
                                                                onPressed:
                                                                    () async {
                                                                  _model.bagitems =
                                                                      [];
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'vd8j3btf' /* Cancel */,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          0,
                                                                          16,
                                                                          0),
                                                                  iconPadding:
                                                                      const EdgeInsetsDirectional.fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                          context)
                                                                      .secondaryBackground,
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color:
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(8),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child:
                                                                onPressed:
                                                                    () async {
                                                                  await OrderRecord
                                                                      .collection
                                                                      .doc()
                                                                      .set({
                                                                    ...createOrderRecordData(
                                                                      userRef:
                                                                          currentUserReference,
                                                                      date:
                                                                          getCurrentTimestamp,
                                                                      orderStats:
                                                                          OrderStatuses.Pending,
                                                                      publicuserRef:
                                                                          publicpageUsersRecord.reference,
                                                                      refValue:
                                                                          widget.objectrefvalue,
                                                                      username: valueOrDefault(
                                                                          currentUserDocument?.username,
                                                                          ''),
                                                                      publicusername:
                                                                          publicpageUsersRecord.username,
                                                                      totalRefValue:
                                                                          widget.objectrefvalue,
                                                                    ),
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'items_inorder': _model
                                                                            .bagitems
                                                                            .unique((e) => e),
                                                                      },
                                                                    ),
                                                                  });
                                                                  unawaited(
                                                                    () async {
                                                                      await currentUserDocument!
                                                                          .analyticsRef!
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'order_accum': FieldValue.increment(1),
                                                                            'orderAvgReference': FieldValue.arrayUnion([
                                                                              functions.sumofBagitemsListRefvalues(_model.refvaluesinbagitems.toList())
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                    }(),
                                                                  );

                                                                  await stackAnalyticsRecord!
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'order_accum':
                                                                            FieldValue.increment(1),
                                                                        'orderAvgReference':
                                                                            FieldValue.arrayUnion([
                                                                          functions.sumofBagitemsListRefvalues(_model.refvaluesinbagitems.toList())
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });

                                                                  context
                                                                      .pushNamed(
                                                                    UserpageWidget
                                                                        .routeName,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      kTransitionInfoKey:
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.rightToLeft,
                                                                        duration:
                                                                            const Duration(milliseconds: 450),
                                                                      ),
                                                                    },
                                                                  );
                                                                },
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'ofwx8axq' /* Generate */,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          0,
                                                                          16,
                                                                          0),
                                                                  iconPadding:
                                                                      const EdgeInsetsDirectional.fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                          context)
                                                                      .secondaryBackground,
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color:
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(8),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8)),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        const SizedBox(height: 8)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ).animateOnActionTrigger(
                                        animationsMap[
                                            'containerOnActionTriggerAnimation']!,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 12, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          badges.Badge(
                                            badgeContent: Text(
                                              valueOrDefault<String>(
                                                _model.bagitems.length
                                                    .toString(),
                                                '0',
                                              ),
                                              style:
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            showBadge: true,
                                            shape: badges.BadgeShape.circle,
                                            badgeColor:
                                                    .primary,
                                            elevation: 4,
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(8, 8, 8, 8),
                                            position:
                                                badges.BadgePosition.topEnd(),
                                            animationType: badges
                                                .BadgeAnimationType.scale,
                                            toAnimate: true,
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                  if (animationsMap[
                                                          'containerOnActionTriggerAnimation'] !=
                                                      null) {
                                                    animationsMap[
                                                            'containerOnActionTriggerAnimation']!
                                                        .controller
                                                        .reverse();
                                                  }
                                                  if (animationsMap[
                                                          'iconOnActionTriggerAnimation1'] !=
                                                      null) {
                                                    animationsMap[
                                                            'iconOnActionTriggerAnimation1']!
                                                        .controller
                                                        .reverse();
                                                  }
                                                  if (animationsMap[
                                                          'iconOnActionTriggerAnimation2'] !=
                                                      null) {
                                                    animationsMap[
                                                            'iconOnActionTriggerAnimation2']!
                                                        .controller
                                                        .reverse();
                                                  }
                                                      false;
                                                } else {
                                                  if (animationsMap[
                                                          'containerOnActionTriggerAnimation'] !=
                                                      null) {
                                                    animationsMap[
                                                            'containerOnActionTriggerAnimation']!
                                                        .controller
                                                        .forward(from: 0.0);
                                                  }
                                                  if (animationsMap[
                                                          'iconOnActionTriggerAnimation1'] !=
                                                      null) {
                                                    animationsMap[
                                                            'iconOnActionTriggerAnimation1']!
                                                        .controller
                                                        .forward(from: 0.0);
                                                  }
                                                  if (animationsMap[
                                                          'iconOnActionTriggerAnimation2'] !=
                                                      null) {
                                                    safeSetState(() =>
                                                        hasIconTriggered2 =
                                                            true);
                                                    SchedulerBinding.instance
                                                        .addPostFrameCallback(
                                                            (_) async => animationsMap[
                                                                    'iconOnActionTriggerAnimation2']!
                                                                .controller
                                                                .forward(
                                                                    from:
                                                                        0.0));
                                                  }
                                                      true;
                                                }
                                              },
                                              child: Container(
                                                width: 52,
                                                height: 52,
                                                decoration: BoxDecoration(
                                                          context)
                                                      .secondary,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(4),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0, 0),
                                                        child: Icon(
                                                          Icons
                                                              .shopping_bag_outlined,
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          size: 26,
                                                        ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'iconOnActionTriggerAnimation1']!,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0, 0),
                                                        child: Icon(
                                                          Icons.close_sharp,
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          size: 26,
                                                        ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'iconOnActionTriggerAnimation2']!,
                                                            hasBeenTriggered:
                                                                hasIconTriggered2),
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
                                  ].divide(const SizedBox(height: 12)),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
