import '/backend/backend.dart';
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
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'user_object_model.dart';
export 'user_object_model.dart';

class UserObjectWidget extends StatefulWidget {
  const UserObjectWidget({
    super.key,
    required this.object,
  });

  final SubmissionRecord? object;

  @override
  State<UserObjectWidget> createState() => _UserObjectWidgetState();
}

class _UserObjectWidgetState extends State<UserObjectWidget>
    with TickerProviderStateMixin {
  late UserObjectModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserObjectModel());

    animationsMap.addAll({
      'iconOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'textOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'textOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'buttonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
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
                                          CrossAxisAlignment.center,
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
                                                  fit: BoxFit.cover,
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
                                          CrossAxisAlignment.stretch,
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
                                                      MainAxisSize.max,
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
                                child: Container(
                                  width: double.infinity,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color:
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            4, 4, 4, 4),
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: const Color(0x80FFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      formatNumber(
                                                        columnSubmissionRecord
                                                            .upvote.length,
                                                        formatType:
                                                            FormatType.compact,
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
                                                                FontWeight.w300,
                                                          ),
                                                    ),
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
                                            width: 70,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      formatNumber(
                                                        columnSubmissionRecord
                                                            .pins.length,
                                                        formatType:
                                                            FormatType.compact,
                                                      ),
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 12,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'q86mo82g' /* Pins */,
                                                      ),
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 12,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
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
                                          thickness: 0.5,
                                          indent: 8,
                                          endIndent: 8,
                                              .secondaryText,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 8, 0),
                                          child: Container(
                                            width: 70,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      formatNumber(
                                                        columnSubmissionRecord
                                                            .shares.length,
                                                        formatType:
                                                            FormatType.compact,
                                                      ),
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 12,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '7wigayxd' /* Shares */,
                                                      ),
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 12,
                                                            letterSpacing: 0.0,
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
                              ),
                            ].divide(const SizedBox(width: 8)),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(
                            maxHeight: 340,
                          ),
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
                                      4, 0, 4, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.editing) {
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
                                            if (animationsMap[
                                                    'textOnActionTriggerAnimation1'] !=
                                                null) {
                                              animationsMap[
                                                      'textOnActionTriggerAnimation1']!
                                                  .controller
                                                  .reverse();
                                            }
                                            if (animationsMap[
                                                    'textOnActionTriggerAnimation2'] !=
                                                null) {
                                              animationsMap[
                                                      'textOnActionTriggerAnimation2']!
                                                  .controller
                                                  .reverse();
                                            }
                                            if (animationsMap[
                                                    'buttonOnActionTriggerAnimation'] !=
                                                null) {
                                              animationsMap[
                                                      'buttonOnActionTriggerAnimation']!
                                                  .controller
                                                  .reverse();
                                            }
                                            _model.editing = false;
                                          } else {
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
                                              animationsMap[
                                                      'iconOnActionTriggerAnimation2']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            if (animationsMap[
                                                    'textOnActionTriggerAnimation1'] !=
                                                null) {
                                              animationsMap[
                                                      'textOnActionTriggerAnimation1']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            if (animationsMap[
                                                    'textOnActionTriggerAnimation2'] !=
                                                null) {
                                              animationsMap[
                                                      'textOnActionTriggerAnimation2']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            if (animationsMap[
                                                    'buttonOnActionTriggerAnimation'] !=
                                                null) {
                                              animationsMap[
                                                      'buttonOnActionTriggerAnimation']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            _model.editing = true;
                                          }
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                                .secondaryBackground,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(0, 0),
                                                child: Icon(
                                                  Icons.arrow_right_rounded,
                                                          context)
                                                      .secondaryText,
                                                  size: 24,
                                                ).animateOnActionTrigger(
                                                  animationsMap[
                                                      'iconOnActionTriggerAnimation1']!,
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(0, 0),
                                                child: Icon(
                                                  Icons.keyboard_control,
                                                          context)
                                                      .secondaryText,
                                                  size: 24,
                                                ).animateOnActionTrigger(
                                                  animationsMap[
                                                      'iconOnActionTriggerAnimation2']!,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (_model.editing == false)
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 4, 0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'vfpxuj2w' /* Created: */,
                                              ),
                                              style:
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'textOnActionTriggerAnimation1']!,
                                            ),
                                          ),
                                        ),
                                      if (_model.editing == false)
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(-1, 0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 4, 0),
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
                                              ).animateOnActionTrigger(
                                                animationsMap[
                                                    'textOnActionTriggerAnimation2']!,
                                              ),
                                            ),
                                          ),
                                        ),
                                      Align(
                                        alignment: const AlignmentDirectional(1, 0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 0, 0),
                                            onPressed: () async {
                                              await columnSubmissionRecord
                                                  .reference
                                                  .delete();

                                              context.goNamed(
                                                  UserpageWidget.routeName);
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'kpzd6smo' /* Delete object */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 32,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(16, 0, 16, 0),
                                              iconAlignment: IconAlignment.end,
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              color:
                                                      .accent1,
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Inter',
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 14,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              elevation: 0,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'buttonOnActionTriggerAnimation']!,
                                          ),
                                        ),
                                      ),
                                    ],
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
                                            12, 4, 12, 8),
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
                                    child: const Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis