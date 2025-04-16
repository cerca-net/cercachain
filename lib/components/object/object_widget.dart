import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'object_model.dart';
export 'object_model.dart';

class ObjectWidget extends StatefulWidget {
  const ObjectWidget({
    super.key,
    required this.object,
  });

  final SubmissionRecord? object;

  @override
  State<ObjectWidget> createState() => _ObjectWidgetState();
}

class _ObjectWidgetState extends State<ObjectWidget>
    with TickerProviderStateMixin {
  late ObjectModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ObjectModel());

    animationsMap.addAll({
      'toggleIconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: const Offset(0.5, 0.5),
            end: const Offset(1.0, 1.0),
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
        child: Container(
          width: 350,
          height: 650,
          constraints: const BoxConstraints(
            maxWidth: 770,
          ),
          decoration: BoxDecoration(
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
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: StreamBuilder<SubmissionRecord>(
                  stream: _model.objectdata(
                    requestFn: () =>
                        SubmissionRecord.getDocument(widget.object!.reference),
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

                    final columnSubmissionRecord = snapshot.data!;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (columnSubmissionRecord.imagesextra.length !=
                                    null)
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        final objectimages =
                                            columnSubmissionRecord.imagesextra
                                                .map((e) => e)
                                                .toList();

                                        return SizedBox(
                                          width: double.infinity,
                                          height: 500,
                                          child: Stack(
                                            children: [
                                              PageView.builder(
                                                controller: _model
                                                        .oImagesController ??=
                                                    PageController(
                                                        initialPage: max(
                                                            0,
                                                            min(
                                                                0,
                                                                objectimages
                                                                        .length -
                                                                    1))),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: objectimages.length,
                                                itemBuilder: (context,
                                                    objectimagesIndex) {
                                                  final objectimagesItem =
                                                      objectimages[
                                                          objectimagesIndex];
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      objectimagesItem,
                                                      width: 200,
                                                      height: 200,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                },
                                              ),
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(0, 1),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16, 0, 16, 8),
                                                  child: smooth_page_indicator
                                                      .SmoothPageIndicator(
                                                    controller: _model
                                                            .oImagesController ??=
                                                        PageController(
                                                            initialPage: max(
                                                                0,
                                                                min(
                                                                    0,
                                                                    objectimages
                                                                            .length -
                                                                        1))),
                                                    count: objectimages.length,
                                                    axisDirection:
                                                        Axis.horizontal,
                                                    onDotClicked: (i) async {
                                                      await _model
                                                          .oImagesController!
                                                          .animateToPage(
                                                        i,
                                                        duration: const Duration(
                                                            milliseconds: 500),
                                                        curve: Curves.ease,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    effect: smooth_page_indicator
                                                        .ExpandingDotsEffect(
                                                      expansionFactor: 5,
                                                      spacing: 8,
                                                      radius: 8,
                                                      dotWidth: 8,
                                                      dotHeight: 8,
                                                      dotColor:
                                                                  context)
                                                              .accent4,
                                                      activeDotColor:
                                                                  context)
                                                              .secondaryBackground,
                                                      paintStyle:
                                                          PaintingStyle.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                if (columnSubmissionRecord.video != null &&
                                    columnSubmissionRecord.video != '')
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        if (columnSubmissionRecord.video !=
                                                null &&
                                            columnSubmissionRecord.video != '')
                                          Expanded(
                                            child: FlutterFlowMediaDisplay(
                                              path:
                                                  columnSubmissionRecord.video,
                                              imageBuilder: (path) => ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  path,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                              videoPlayerBuilder: (path) =>
                                                  FlutterFlowVideoPlayer(
                                                path: path,
                                                width: 300,
                                                autoPlay: false,
                                                looping: true,
                                                showControls: true,
                                                allowFullScreen: true,
                                                allowPlaybackSpeedMenu: false,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                if (columnSubmissionRecord.audio != null &&
                                    columnSubmissionRecord.audio != '')
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                      .secondaryBackground,
                                            ),
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.network(
                                                    columnSubmissionRecord
                                                        .image,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0, 1),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(24),
                                                    child:
                                                        FlutterFlowAudioPlayer(
                                                      audio: Audio.network(
                                                        columnSubmissionRecord
                                                            .audio,
                                                        metas: Metas(
                                                          title:
                                                              columnSubmissionRecord
                                                                  .header,
                                                        ),
                                                      ),
                                                      titleTextStyle:
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Sora',
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 20,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      playbackDurationTextStyle:
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      fillColor:
                                                          const Color(0x00000000),
                                                      playbackButtonColor:
                                                                  context)
                                                              .alternate,
                                                      activeTrackColor:
                                                                  context)
                                                              .primary,
                                                      inactiveTrackColor:
                                                                  context)
                                                              .alternate,
                                                      elevation: 0,
                                                      playInBackground:
                                                          PlayInBackground
                                                              .enabled,
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
                                if (columnSubmissionRecord.type0choice ==
                                    'Text')
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4, 4, 4, 4),
                                            child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(12),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      columnSubmissionRecord
                                                          .header,
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 18,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      indent: 12,
                                                      endIndent: 12,
                                                      color:
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    Text(
                                                      columnSubmissionRecord
                                                          .body,
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 12,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ]
                                                      .divide(
                                                          const SizedBox(height: 12))
                                                      .addToStart(
                                                          const SizedBox(height: 8)),
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
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: StreamBuilder<List<CreditsRecord>>(
                                  stream: queryCreditsRecord(
                                    queryBuilder: (creditsRecord) =>
                                        creditsRecord.where(
                                      'userRef',
                                      isEqualTo: columnSubmissionRecord.poster,
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<CreditsRecord>
                                        containerCreditsRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final containerCreditsRecord =
                                        containerCreditsRecordList.isNotEmpty
                                            ? containerCreditsRecordList.first
                                            : null;

                                    return Container(
                                      width: double.infinity,
                                      height: 35,
                                      decoration: BoxDecoration(
                                            .alternate,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4, 4, 4, 4),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ToggleIcon(
                                                    onPressed: () async {
                                                      final upvoteElement =
                                                          currentUserReference;
                                                      final upvoteUpdate =
                                                          columnSubmissionRecord
                                                                  .upvote
                                                                  .contains(
                                                                      upvoteElement)
                                                              ? FieldValue
                                                                  .arrayRemove([
                                                                  upvoteElement
                                                                ])
                                                              : FieldValue
                                                                  .arrayUnion([
                                                                  upvoteElement
                                                                ]);
                                                      await columnSubmissionRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'upvote':
                                                                upvoteUpdate,
                                                          },
                                                        ),
                                                      });
                                                      if (columnSubmissionRecord
                                                              .upvote
                                                              .contains(
                                                                  currentUserReference) ==
                                                          true) {
                                                        await columnSubmissionRecord
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'upvote': FieldValue
                                                                  .arrayRemove([
                                                                currentUserReference
                                                              ]),
                                                              'downvote':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                currentUserReference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                      } else {
                                                        await columnSubmissionRecord
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'upvote': FieldValue
                                                                  .arrayUnion([
                                                                currentUserReference
                                                              ]),
                                                              'downvote': FieldValue
                                                                  .arrayRemove([
                                                                currentUserReference
                                                              ]),
                                                            },
                                                          ),
                                                        });

                                                        await containerCreditsRecord!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'participation_i':
                                                                  FieldValue
                                                                      .increment(
                                                                          0.01),
                                                            },
                                                          ),
                                                        });
                                                      }
                                                    },
                                                    value: columnSubmissionRecord
                                                        .upvote
                                                        .contains(
                                                            currentUserReference),
                                                    onIcon: Icon(
                                                      Icons.keyboard_arrow_up,
                                                      color:
                                                                  context)
                                                              .primary,
                                                      size: 14,
                                                    ),
                                                    offIcon: Icon(
                                                      Icons.keyboard_arrow_up,
                                                      color:
                                                                  context)
                                                              .secondaryText,
                                                      size: 14,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          columnSubmissionRecord
                                                              .upvote.length,
                                                          formatType: FormatType
                                                              .compact,
                                                        ),
                                                        '0',
                                                      ),
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 12,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 100,
                                                    child: VerticalDivider(
                                                      thickness: 0.5,
                                                      indent: 8,
                                                      endIndent: 8,
                                                      color:
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 4, 0),
                                                    child: ToggleIcon(
                                                      onPressed: () async {
                                                        final downvoteElement =
                                                            currentUserReference;
                                                        final downvoteUpdate =
                                                            columnSubmissionRecord
                                                                    .downvote
                                                                    .contains(
                                                                        downvoteElement)
                                                                ? FieldValue
                                                                    .arrayRemove([
                                                                    downvoteElement
                                                                  ])
                                                                : FieldValue
                                                                    .arrayUnion([
                                                                    downvoteElement
                                                                  ]);
                                                        await columnSubmissionRecord
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'downvote':
                                                                  downvoteUpdate,
                                                            },
                                                          ),
                                                        });
                                                        if (columnSubmissionRecord
                                                                .downvote
                                                                .contains(
                                                                    currentUserReference) ==
                                                            true) {
                                                          await columnSubmissionRecord
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'downvote':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  currentUserReference
                                                                ]),
                                                                'upvote': FieldValue
                                                                    .arrayUnion([
                                                                  currentUserReference
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        } else {
                                                          await columnSubmissionRecord
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'downvote':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  currentUserReference
                                                                ]),
                                                                'upvote': FieldValue
                                                                    .arrayRemove([
                                                                  currentUserReference
                                                                ]),
                                                              },
                                                            ),
                                                          });

                                                          await containerCreditsRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'participation_i':
                                                                    FieldValue
                                                                        .increment(
                                                                            0.01),
                                                              },
                                                            ),
                                                          });
                                                        }
                                                      },
                                                      value: columnSubmissionRecord
                                                          .downvote
                                                          .contains(
                                                              currentUserReference),
                                                      onIcon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        color:
                                                                    context)
                                                                .primary,
                                                        size: 14,
                                                      ),
                                                      offIcon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        color:
                                                                    context)
                                                                .secondaryText,
                                                        size: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ToggleIcon(
                                                      onPressed: () async {
                                                        final pinsElement =
                                                            currentUserReference;
                                                        final pinsUpdate =
                                                            columnSubmissionRecord
                                                                    .pins
                                                                    .contains(
                                                                        pinsElement)
                                                                ? FieldValue
                                                                    .arrayRemove([
                                                                    pinsElement
                                                                  ])
                                                                : FieldValue
                                                                    .arrayUnion([
                                                                    pinsElement
                                                                  ]);
                                                        await columnSubmissionRecord
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'pins':
                                                                  pinsUpdate,
                                                            },
                                                          ),
                                                        });
                                                        if (columnSubmissionRecord
                                                                .pins
                                                                .contains(
                                                                    currentUserReference) ==
                                                            true) {
                                                          if (animationsMap[
                                                                  'toggleIconOnActionTriggerAnimation'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'toggleIconOnActionTriggerAnimation']!
                                                                .controller
                                                                .reverse();
                                                          }

                                                          await columnSubmissionRecord
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'pins': FieldValue
                                                                    .arrayRemove([
                                                                  currentUserReference
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        } else {
                                                          if (animationsMap[
                                                                  'toggleIconOnActionTriggerAnimation'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'toggleIconOnActionTriggerAnimation']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }

                                                          await columnSubmissionRecord
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'pins': FieldValue
                                                                    .arrayUnion([
                                                                  currentUserReference
                                                                ]),
                                                              },
                                                            ),
                                                          });

                                                          await containerCreditsRecord!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'participation_i':
                                                                    FieldValue
                                                                        .increment(
                                                                            0.01),
                                                              },
                                                            ),
                                                          });
                                                        }
                                                      },
                                                      value: columnSubmissionRecord
                                                          .pins
                                                          .contains(
                                                              currentUserReference),
                                                      onIcon: FaIcon(
                                                        FontAwesomeIcons.mapPin,
                                                        color:
                                                                    context)
                                                                .secondary,
                                                        size: 12,
                                                      ),
                                                      offIcon: FaIcon(
                                                        FontAwesomeIcons.mapPin,
                                                        color:
                                                                    context)
                                                                .secondaryText,
                                                        size: 12,
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'toggleIconOnActionTriggerAnimation']!,
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '2u4nwfp6' /* Pin */,
                                                      ),
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 12,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Builder(
                                              builder: (context) =>
                                                onPressed: () async {
                                                  await Share.share(
                                                    columnSubmissionRecord
                                                        .reference.id,
                                                    sharePositionOrigin:
                                                        getWidgetBoundingBox(
                                                            context),
                                                  );

                                                  await containerCreditsRecord!
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'participation_i':
                                                            FieldValue
                                                                .increment(
                                                                    0.01),
                                                      },
                                                    ),
                                                  });
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'u13iz43r' /* Share */,
                                                ),
                                                icon: const Icon(
                                                  Icons.share,
                                                  size: 10,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16, 0, 16, 0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0, 0, 0, 0),
                                                          context)
                                                      .alternate,
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                                StreamBuilder<List<UsersRecord>>(
                                  stream: _model.objectinformation(
                                    requestFn: () => queryUsersRecord(
                                      singleRecord: true,
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<UsersRecord>
                                        iconButtonUsersRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final iconButtonUsersRecord =
                                        iconButtonUsersRecordList.isNotEmpty
                                            ? iconButtonUsersRecordList.first
                                            : null;

                                    return FlutterFlowIconButton(
                                      borderRadius: 100,
                                      borderWidth: 1,
                                      buttonSize: 35,
                                          .alternate,
                                      icon: Icon(
                                        Icons.arrow_forward,
                                            .secondaryText,
                                        size: 20,
                                      ),
                                      onPressed: () async {
                                        context.goNamed(
                                          PublicpageWidget.routeName,
                                          queryParameters: {
                                            'profileparameter': serializeParam(
                                              columnSubmissionRecord.poster,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                    );
                                  },
                                ),
                            ].divide(const SizedBox(width: 8)),
                          ),
                        ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12, 8, 12, 8),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.goNamed(
                                        PublicpageWidget.routeName,
                                        queryParameters: {
                                          'profileparameter': serializeParam(
                                            columnSubmissionRecord.poster,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                                .secondaryBackground,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Container(
                                            width: 34,
                                            height: 34,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              columnSubmissionRecord
                                                  .profilePictureObjectPost,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: Text(
                                              columnSubmissionRecord.submitter,
                                              style:
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 14,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(1, 0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 0, 0),
                                              child: Text(
                                                dateTimeFormat(
                                                  "relative",
                                                  columnSubmissionRecord.date!,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                style:
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Inter',
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
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(),
                                    child: Visibility(
                                      visible:
                                          columnSubmissionRecord.type0choice !=
                                              'Text',
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              columnSubmissionRecord.header,
                                              style:
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 16,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                            Text(
                                              columnSubmissionRecord.body,
                                              style:
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(height: 12)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                            .secondaryBackground,
                                        width: 1,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                FlutterFlowChoiceChips(
                                                  options:
                                                      columnSubmissionRecord
                                                          .thread
                                                          .unique((e) => e)
                                                          .map((label) =>
                                                              ChipData(label))
                                                          .toList(),
                                                  onChanged: (val) =>
                                                      safeSetState(() => _model
                                                              .choiceChipsValue =
                                                          val?.firstOrNull),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                                context)
                                                            .secondaryBackground,
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 10,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    iconColor:
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
                                                                context)
                                                            .secondaryBackground,
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 10,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    iconColor:
                                                                context)
                                                            .secondaryText,
                                                    iconSize: 16,
                                                    elevation: 0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  chipSpacing: 4,
                                                  rowSpacing: 4,
                                                  multiselect: false,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .choiceChipsValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [],
                                                  ),
                                                  wrapped: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                          if ((columnSubmissionRecord
                                                      .objectRefvalue !=
                                                  null) &&
                                              (columnSubmissionRecord
                                                      .objectRefvalue >
                                                  0.0))
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1, 0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 8, 0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.iteminfo =
                                                            !_model.iteminfo;
                                                        safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        width: 74,
                                                        height: 36,
                                                        decoration:
                                                            BoxDecoration(
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(4),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Icon(
                                                                Icons.toll,
                                                                        context)
                                                                    .secondaryText,
                                                                size: 18,
                                                              ),
                                                              if (!_model
                                                                  .iteminfo)
                                                                Expanded(
                                                                  child: Text(
                                                                    columnSubmissionRecord
                                                                        .objectRefvalue
                                                                        .toString(),
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
                                                                ),
                                                            ].divide(const SizedBox(
                                                                width: 6)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (_model.iteminfo)
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                        PublicpageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'profileparameter':
                                                              serializeParam(
                                                            columnSubmissionRecord
                                                                .poster,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'objectparameter':
                                                              serializeParam(
                                                            columnSubmissionRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'objectrefvalue':
                                                              serializeParam(
                                                            columnSubmissionRecord
                                                                .objectRefvalue,
                                                            ParamType.double,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'ng55bj8r' /* ADD TO BAG */,
                                                    ),
                                                    icon: const Icon(
                                                      Icons.upload_rounded,
                                                      size: 15,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 40,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 0, 16, 0),
                                                      iconAlignment:
                                                          IconAlignment.end,
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
                                                                    'Montserrat',
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 12,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                      elevation: 0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                        ].divide(const SizedBox(height: 8)),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 4)),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 8)),
                    );
                  },
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1, -1),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: FlutterFlowIconButton(
                    borderRadius: 100,
                    buttonSize: 30,
                    icon: Icon(
                      Icons.close,
                      size: 14,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
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
