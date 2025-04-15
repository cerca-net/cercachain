import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/object/object_widget.dart';
import '/components/user_object/user_object_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

import 'feedpage_model.dart';
export 'feedpage_model.dart';

class FeedpageWidget extends StatefulWidget {
  const FeedpageWidget({super.key});

  static String routeName = 'Feedpage';
  static String routePath = '/feedpage';

  @override
  State<FeedpageWidget> createState() => _FeedpageWidgetState();
}

class _FeedpageWidgetState extends State<FeedpageWidget>
    with TickerProviderStateMixin {
  late FeedpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedpageModel());

    _model.wordSearcherTextController ??= TextEditingController();
    _model.wordSearcherFocusNode ??= FocusNode();

    animationsMap.addAll({
      'iconOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(30.0, -30.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'iconOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (FFAppState().showfullfeed == true)
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: PagedMasonryGridView<
                              DocumentSnapshot<Object?>?,
                              SubmissionRecord>.count(
                            pagingController: _model.setStaggeredViewController(
                              SubmissionRecord.collection
                                  .whereArrayContainsAny(
                                      'thread',
                                      _model.choiceChipsValues != ''
                                          ? _model.choiceChipsValues
                                          : null)
                                  .orderBy('date', descending: true),
                            ),
                            crossAxisCount: () {
                              if (MediaQuery.sizeOf(context).width < 430.0) {
                                return 2;
                              } else if (MediaQuery.sizeOf(context).width <=
                                  1024.0) {
                                return 3;
                              } else {
                                return 2;
                              }
                            }(),
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            builderDelegate:
                                PagedChildBuilderDelegate<SubmissionRecord>(
                              // Customize what your widget looks like when it's loading the first page.
                              firstPageProgressIndicatorBuilder: (_) => Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              ),
                              // Customize what your widget looks like when it's loading another page.
                              newPageProgressIndicatorBuilder: (_) => Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              ),

                              itemBuilder: (context, _, staggeredViewIndex) {
                                final staggeredViewSubmissionRecord = _model
                                    .staggeredViewPagingController!
                                    .itemList![staggeredViewIndex];
                                return FutureBuilder<SubmissionRecord>(
                                  future: SubmissionRecord.getDocumentOnce(
                                      staggeredViewSubmissionRecord.reference),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
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
                                        snapshot.data!;

                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        width: double.infinity,
                                        constraints: BoxConstraints(
                                          maxHeight: 320,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 5,
                                              color: Color(0x3416202A),
                                              offset: Offset(
                                                0.0,
                                                3,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: StreamBuilder<
                                            List<AnalyticsRecord>>(
                                          stream: queryAnalyticsRecord(
                                            queryBuilder: (analyticsRecord) =>
                                                analyticsRecord.where(
                                              'user_ref',
                                              isEqualTo:
                                                  objectSubmissionRecord.poster,
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 8, 12, 8),
                                                  child: FutureBuilder<
                                                      SubmissionRecord>(
                                                    future: SubmissionRecord
                                                        .getDocumentOnce(
                                                            objectSubmissionRecord
                                                                .reference),
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

                                                      final oSubmitterSubmissionRecord =
                                                          snapshot.data!;

                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 30,
                                                            height: 30,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              oSubmitterSubmissionRecord
                                                                  .profilePictureObjectPost,
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                staggeredViewSubmissionRecord
                                                                    .submitter,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
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
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                "relative",
                                                                staggeredViewSubmissionRecord
                                                                    .date!,
                                                                locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageShortCode ??
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        10,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (objectSubmissionRecord
                                                              .poster !=
                                                          currentUserReference) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0, 0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          dialogContext)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child:
                                                                    ObjectWidget(
                                                                  object:
                                                                      objectSubmissionRecord,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );

                                                        await columnAnalyticsRecord!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'object_views_accum':
                                                                  FieldValue
                                                                      .increment(
                                                                          1),
                                                            },
                                                          ),
                                                        });
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0, 0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          dialogContext)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
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
                                                      }
                                                    },
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 1),
                                                            children: [
                                                              if (staggeredViewSubmissionRecord
                                                                      .imagesextra
                                                                      .length !=
                                                                  null)
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final feedobjectimages = staggeredViewSubmissionRecord
                                                                        .imagesextra
                                                                        .map((e) =>
                                                                            e)
                                                                        .toList()
                                                                        .take(1)
                                                                        .toList();

                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: List.generate(
                                                                          feedobjectimages
                                                                              .length,
                                                                          (feedobjectimagesIndex) {
                                                                        final feedobjectimagesItem =
                                                                            feedobjectimages[feedobjectimagesIndex];
                                                                        return Expanded(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                200,
                                                                            height:
                                                                                200,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Visibility(
                                                                              visible: feedobjectimagesItem != null && feedobjectimagesItem != '',
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8),
                                                                                child: Image.network(
                                                                                  feedobjectimagesItem,
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                ),
                                                              if ((objectSubmissionRecord
                                                                          .objectRefvalue !=
                                                                      null) &&
                                                                  (objectSubmissionRecord
                                                                          .objectRefvalue >
                                                                      0.0))
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1,
                                                                              1),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              70,
                                                                          height:
                                                                              40,
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
                                                                                EdgeInsets.all(4),
                                                                            child:
                                                                                Row(
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
                                                                                    staggeredViewSubmissionRecord.objectRefvalue.toString(),
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
                                                            ],
                                                          ),
                                                          if (staggeredViewSubmissionRecord
                                                                      .video !=
                                                                  null &&
                                                              staggeredViewSubmissionRecord
                                                                      .video !=
                                                                  '')
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  if (staggeredViewSubmissionRecord
                                                                              .video !=
                                                                          null &&
                                                                      staggeredViewSubmissionRecord
                                                                              .video !=
                                                                          '')
                                                                    Expanded(
                                                                      child:
                                                                          FlutterFlowMediaDisplay(
                                                                        path: staggeredViewSubmissionRecord
                                                                            .video,
                                                                        imageBuilder:
                                                                            (path) =>
                                                                                ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                          child:
                                                                              Image.network(
                                                                            path,
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            fit:
                                                                                BoxFit.fitWidth,
                                                                          ),
                                                                        ),
                                                                        videoPlayerBuilder:
                                                                            (path) =>
                                                                                FlutterFlowVideoPlayer(
                                                                          path:
                                                                              path,
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              double.infinity,
                                                                          autoPlay:
                                                                              true,
                                                                          looping:
                                                                              false,
                                                                          showControls:
                                                                              false,
                                                                          allowFullScreen:
                                                                              false,
                                                                          allowPlaybackSpeedMenu:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (staggeredViewSubmissionRecord
                                                                      .audio !=
                                                                  null &&
                                                              staggeredViewSubmissionRecord
                                                                      .audio !=
                                                                  '')
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Flexible(
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: 140,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                          child:
                                                                              Image.network(
                                                                            objectSubmissionRecord.image,
                                                                            width:
                                                                                200,
                                                                            height:
                                                                                200,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              FlutterFlowAudioPlayer(
                                                                            audio:
                                                                                Audio.network(
                                                                              staggeredViewSubmissionRecord.audio,
                                                                              metas: Metas(
                                                                                title: staggeredViewSubmissionRecord.header,
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
                                                                            fillColor:
                                                                                Color(0x00000000),
                                                                            playbackButtonColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            activeTrackColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            inactiveTrackColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            elevation:
                                                                                0,
                                                                            playInBackground:
                                                                                PlayInBackground.enabled,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          if ((staggeredViewSubmissionRecord
                                                                          .body !=
                                                                      null &&
                                                                  staggeredViewSubmissionRecord
                                                                          .body !=
                                                                      '') &&
                                                              !(staggeredViewSubmissionRecord
                                                                  .imagesextra
                                                                  .isNotEmpty))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1,
                                                                            -1),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8),
                                                                      child:
                                                                          Text(
                                                                        staggeredViewSubmissionRecord
                                                                            .header,
                                                                        maxLines:
                                                                            3,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        1,
                                                                    indent: 12,
                                                                    endIndent:
                                                                        12,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1,
                                                                            -1),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              0,
                                                                              8,
                                                                              8),
                                                                      child:
                                                                          Text(
                                                                        staggeredViewSubmissionRecord
                                                                            .body,
                                                                        maxLines:
                                                                            4,
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
                                                                ],
                                                              ),
                                                            ),
                                                        ],
                                                      ),
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
                      ),
                    ),
                  if (FFAppState().showfullfeed == false)
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Builder(
                            builder: (context) {
                              final searchedobjets =
                                  _model.simpleSearchResults.toList();

                              return MasonryGridView.builder(
                                gridDelegate:
                                    SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                itemCount: searchedobjets.length,
                                itemBuilder: (context, searchedobjetsIndex) {
                                  final searchedobjetsItem =
                                      searchedobjets[searchedobjetsIndex];
                                  return Builder(
                                    builder: (context) =>
                                        FutureBuilder<SubmissionRecord>(
                                      future: SubmissionRecord.getDocumentOnce(
                                          searchedobjetsItem.reference),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
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
                                            snapshot.data!;

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
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(0, 0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: ObjectWidget(
                                                      object:
                                                          objectSubmissionRecord,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Container(
                                              width: double.infinity,
                                              constraints: BoxConstraints(
                                                maxHeight: 320,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 5,
                                                    color: Color(0x3416202A),
                                                    offset: Offset(
                                                      0.0,
                                                      3,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 8, 12, 8),
                                                    child: FutureBuilder<
                                                        SubmissionRecord>(
                                                      future: SubmissionRecord
                                                          .getDocumentOnce(
                                                              objectSubmissionRecord
                                                                  .reference),
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

                                                        final oSubmitterSubmissionRecord =
                                                            snapshot.data!;

                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: 30,
                                                              height: 30,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                oSubmitterSubmissionRecord
                                                                    .profilePictureObjectPost,
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  oSubmitterSubmissionRecord
                                                                      .submitter,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            12,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                dateTimeFormat(
                                                                  "relative",
                                                                  oSubmitterSubmissionRecord
                                                                      .date!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize:
                                                                          10,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 1),
                                                    children: [
                                                      if (objectSubmissionRecord
                                                              .imagesextra
                                                              .length !=
                                                          null)
                                                        Builder(
                                                          builder: (context) {
                                                            final imagesextra =
                                                                objectSubmissionRecord
                                                                    .imagesextra
                                                                    .map((e) =>
                                                                        e)
                                                                    .toList()
                                                                    .take(3)
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
                                                                        .start,
                                                                children: List.generate(
                                                                    imagesextra
                                                                        .length,
                                                                    (imagesextraIndex) {
                                                                  final imagesextraItem =
                                                                      imagesextra[
                                                                          imagesextraIndex];
                                                                  return Container(
                                                                    width: 200,
                                                                    height: 200,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Visibility(
                                                                      visible: imagesextraItem !=
                                                                              null &&
                                                                          imagesextraItem !=
                                                                              '',
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                        child: Image
                                                                            .network(
                                                                          imagesextraItem,
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              double.infinity,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      if ((objectSubmissionRecord
                                                                  .objectRefvalue !=
                                                              null) &&
                                                          (objectSubmissionRecord
                                                                  .objectRefvalue >
                                                              0.0))
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1, 1),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                child:
                                                                    Container(
                                                                  width: 70,
                                                                  height: 40,
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
                                                                        EdgeInsets
                                                                            .all(4),
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              16,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            objectSubmissionRecord.refvalue,
                                                                            textAlign:
                                                                                TextAlign.center,
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
                                                    ],
                                                  ),
                                                  if (objectSubmissionRecord
                                                              .video !=
                                                          null &&
                                                      objectSubmissionRecord
                                                              .video !=
                                                          '')
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          if (objectSubmissionRecord
                                                                      .video !=
                                                                  null &&
                                                              objectSubmissionRecord
                                                                      .video !=
                                                                  '')
                                                            Expanded(
                                                              child:
                                                                  FlutterFlowMediaDisplay(
                                                                path:
                                                                    objectSubmissionRecord
                                                                        .video,
                                                                imageBuilder:
                                                                    (path) =>
                                                                        ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  child: Image
                                                                      .network(
                                                                    path,
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                videoPlayerBuilder:
                                                                    (path) =>
                                                                        FlutterFlowVideoPlayer(
                                                                  path: path,
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  autoPlay:
                                                                      true,
                                                                  looping:
                                                                      false,
                                                                  showControls:
                                                                      false,
                                                                  allowFullScreen:
                                                                      false,
                                                                  allowPlaybackSpeedMenu:
                                                                      false,
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (objectSubmissionRecord
                                                              .audio !=
                                                          null &&
                                                      objectSubmissionRecord
                                                              .audio !=
                                                          '')
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Container(
                                                          width: 100,
                                                          height: 140,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child: Image
                                                                    .network(
                                                                  objectSubmissionRecord
                                                                      .image,
                                                                  width: 200,
                                                                  height: 200,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              FlutterFlowAudioPlayer(
                                                                audio: Audio
                                                                    .network(
                                                                  objectSubmissionRecord
                                                                      .audio,
                                                                  metas: Metas(
                                                                    title: objectSubmissionRecord
                                                                        .header,
                                                                  ),
                                                                ),
                                                                titleTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Sora',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          fontSize:
                                                                              20,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                playbackDurationTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                fillColor: Color(
                                                                    0x00000000),
                                                                playbackButtonColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                activeTrackColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                inactiveTrackColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                elevation: 0,
                                                                playInBackground:
                                                                    PlayInBackground
                                                                        .enabled,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  if ((objectSubmissionRecord
                                                                  .body !=
                                                              null &&
                                                          objectSubmissionRecord
                                                                  .body !=
                                                              '') &&
                                                      !(objectSubmissionRecord
                                                          .imagesextra
                                                          .isNotEmpty))
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, -1),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              child: Text(
                                                                objectSubmissionRecord
                                                                    .header,
                                                                maxLines: 3,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Divider(
                                                            thickness: 1,
                                                            indent: 12,
                                                            endIndent: 12,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, -1),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          8,
                                                                          8),
                                                              child: Text(
                                                                objectSubmissionRecord
                                                                    .body,
                                                                maxLines: 4,
                                                                style: FlutterFlowTheme.of(
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
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState().isCategoriesExpanded) {
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
                              animationsMap['iconOnActionTriggerAnimation1']!
                                  .controller
                                  .reverse();
                            }
                            if (animationsMap[
                                    'iconOnActionTriggerAnimation2'] !=
                                null) {
                              animationsMap['iconOnActionTriggerAnimation2']!
                                  .controller
                                  .reverse();
                            }
                            FFAppState().isCategoriesExpanded = false;
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
                              animationsMap['iconOnActionTriggerAnimation1']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            if (animationsMap[
                                    'iconOnActionTriggerAnimation2'] !=
                                null) {
                              animationsMap['iconOnActionTriggerAnimation2']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            FFAppState().isCategoriesExpanded = true;
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: 60,
                            height: 34,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
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
                              borderRadius: BorderRadius.circular(8),
                              shape: BoxShape.rectangle,
                            ),
                            child: Stack(
                              alignment: AlignmentDirectional(0, 0),
                              children: [
                                Icon(
                                  Icons.filter_alt,
                                  color: Colors.white,
                                  size: 24,
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'iconOnActionTriggerAnimation1']!,
                                ),
                                Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'iconOnActionTriggerAnimation2']!,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 200,
                        constraints: BoxConstraints(
                          maxHeight: 460,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
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
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  FlutterFlowChoiceChips(
                                    options: [
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                            '18f80jiq' /* Post */,
                                          ),
                                          Icons.video_collection),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                            'ighi3yyj' /* Item */,
                                          ),
                                          Icons.shopping_bag_rounded),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                            'qcfd3902' /* Users */,
                                          ),
                                          Icons.people),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                            'qll7j0w6' /* Image */,
                                          ),
                                          Icons.image_rounded),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                            'nf7vus5v' /* Video */,
                                          ),
                                          Icons.video_collection),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                            'ixs63p7v' /* Audio */,
                                          ),
                                          Icons.graphic_eq),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                            'c6gh8s5a' /* Text */,
                                          ),
                                          Icons.text_fields),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                            'tw138i86' /* Product */,
                                          ),
                                          Icons
                                              .indeterminate_check_box_rounded),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                            'hr2wsnpt' /* Service */,
                                          ),
                                          Icons.account_box_rounded),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                            'qky01nka' /* Event */,
                                          ),
                                          Icons.date_range),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                            '01osuru4' /* Place */,
                                          ),
                                          Icons.store),
                                      ChipData(
                                          FFLocalizations.of(context).getText(
                                            'yjjqv62d' /* People */,
                                          ),
                                          Icons.person)
                                    ],
                                    onChanged: (val) => safeSetState(
                                        () => _model.choiceChipsValues = val),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                          ),
                                      iconColor:
                                          FlutterFlowTheme.of(context).info,
                                      iconSize: 16,
                                      elevation: 0,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                      iconColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      iconSize: 16,
                                      elevation: 0,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    chipSpacing: 8,
                                    rowSpacing: 8,
                                    multiselect: true,
                                    initialized:
                                        _model.choiceChipsValues != null,
                                    alignment: WrapAlignment.center,
                                    controller:
                                        _model.choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                      [],
                                    ),
                                    wrapped: true,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 8, 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 8, 0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 100,
                                                buttonSize: 40,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 16,
                                                ),
                                                onPressed: () async {
                                                  safeSetState(() => _model
                                                      .choiceChipsValueController
                                                      ?.value = []);
                                                  safeSetState(() {
                                                    _model
                                                        .wordSearcherTextController
                                                        ?.clear();
                                                  });
                                                  FFAppState().showfullfeed =
                                                      true;
                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                width: 200,
                                                child: TextFormField(
                                                  controller: _model
                                                      .wordSearcherTextController,
                                                  focusNode: _model
                                                      .wordSearcherFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'cnzvxg2r' /* TextField */,
                                                    ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  validator: _model
                                                      .wordSearcherTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 0, 0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 100,
                                                buttonSize: 40,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                icon: Icon(
                                                  Icons.search,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 24,
                                                ),
                                                onPressed: () async {
                                                  safeSetState(() => _model
                                                      .choiceChipsValueController
                                                      ?.value = []);
                                                  await querySubmissionRecordOnce()
                                                      .then(
                                                        (records) => _model
                                                                .simpleSearchResults =
                                                            TextSearch(
                                                          records
                                                              .map(
                                                                (record) =>
                                                                    TextSearchItem
                                                                        .fromTerms(
                                                                            record,
                                                                            [
                                                                      record
                                                                          .header!,
                                                                      record
                                                                          .submitter!,
                                                                      record
                                                                          .type1choice!,
                                                                      record
                                                                          .type2choice!,
                                                                      record
                                                                          .type0choice!
                                                                    ]),
                                                              )
                                                              .toList(),
                                                        )
                                                                .search(_model
                                                                    .wordSearcherTextController
                                                                    .text)
                                                                .map((r) =>
                                                                    r.object)
                                                                .toList(),
                                                      )
                                                      .onError((_, __) => _model
                                                              .simpleSearchResults =
                                                          [])
                                                      .whenComplete(() =>
                                                          safeSetState(() {}));

                                                  FFAppState().showfullfeed =
                                                      false;
                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 16)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation']!,
                    ),
                  ]
                      .divide(SizedBox(height: 8))
                      .addToStart(SizedBox(height: 24)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

