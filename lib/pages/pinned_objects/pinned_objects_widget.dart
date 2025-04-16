import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/object/object_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'pinned_objects_model.dart';
export 'pinned_objects_model.dart';

class PinnedObjectsWidget extends StatefulWidget {
  const PinnedObjectsWidget({super.key});

  static String routeName = 'PinnedObjects';
  static String routePath = '/pinnedObjects';

  @override
  State<PinnedObjectsWidget> createState() => _PinnedObjectsWidgetState();
}

class _PinnedObjectsWidgetState extends State<PinnedObjectsWidget> {
  late PinnedObjectsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PinnedObjectsModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 7,
                        color: Color(0x33000000),
                        offset: Offset(
                          0,
                          3,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'bew8sle5' /* Objects */,
                                  ),
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Sora',
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: 200,
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'c1hc8t4b' /* Search pinned objects */,
                                        ),
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                                .error,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                                .error,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                            .secondaryBackground,
                                      ),
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                          .primaryText,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              valueOrDefault<String>(
                                                formatNumber(
                                                  (currentUserDocument
                                                              ?.pinnedObjects
                                                              ?.toList() ??
                                                          [])
                                                      .length,
                                                  formatType:
                                                      FormatType.compact,
                                                ),
                                                '0',
                                              ),
                                              style:
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.category_rounded,
                                                .secondaryText,
                                            size: 20,
                                          ),
                                        ].divide(const SizedBox(width: 8)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: StreamBuilder<List<SubmissionRecord>>(
                              stream: querySubmissionRecord(
                                queryBuilder: (submissionRecord) =>
                                    submissionRecord.where(
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<SubmissionRecord>
                                    staggeredViewSubmissionRecordList =
                                    snapshot.data!;

                                return MasonryGridView.builder(
                                  gridDelegate:
                                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  itemCount:
                                      staggeredViewSubmissionRecordList.length,
                                  itemBuilder: (context, staggeredViewIndex) {
                                    final staggeredViewSubmissionRecord =
                                        staggeredViewSubmissionRecordList[
                                            staggeredViewIndex];
                                    return Builder(
                                      builder: (context) =>
                                          FutureBuilder<SubmissionRecord>(
                                        future:
                                            SubmissionRecord.getDocumentOnce(
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
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0, 0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
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
                                                constraints: const BoxConstraints(
                                                  maxHeight: 320,
                                                ),
                                                decoration: BoxDecoration(
                                                          context)
                                                      .secondaryBackground,
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
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 8, 12, 8),
                                                      child: FutureBuilder<
                                                          SubmissionRecord>(
                                                        future: SubmissionRecord
                                                            .getDocumentOnce(
                                                                objectSubmissionRecord
                                                                    .reference),
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
                                                                MainAxisSize
                                                                    .min,
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
                                                                    const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  oSubmitterSubmissionRecord
                                                                      .profilePictureObjectPost,
                                                                  fit: BoxFit
                                                                      .fitWidth,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    oSubmitterSubmissionRecord
                                                                        .submitter,
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
                                                                    const EdgeInsetsDirectional
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
                                                                    locale: FFLocalizations.of(context)
                                                                            .languageShortCode ??
                                                                        FFLocalizations.of(context)
                                                                            .languageCode,
                                                                  ),
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
                                                          const AlignmentDirectional(
                                                              0, 1),
                                                      children: [
                                                        if (objectSubmissionRecord
                                                                .imagesextra
                                                                .length !=
                                                            null)
                                                          Builder(
                                                            builder: (context) {
                                                              final feedobjectimages =
                                                                  objectSubmissionRecord
                                                                      .imagesextra
                                                                      .map(
                                                                          (e) =>
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
                                                                      feedobjectimages
                                                                          .length,
                                                                      (feedobjectimagesIndex) {
                                                                    final feedobjectimagesItem =
                                                                        feedobjectimages[
                                                                            feedobjectimagesIndex];
                                                                    return Container(
                                                                      width:
                                                                          200,
                                                                      height:
                                                                          200,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Visibility(
                                                                        visible: feedobjectimagesItem !=
                                                                                null &&
                                                                            feedobjectimagesItem !=
                                                                                '',
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                          child:
                                                                              Image.network(
                                                                            feedobjectimagesItem,
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        if (objectSubmissionRecord
                                                                    .refvalue !=
                                                                null &&
                                                            objectSubmissionRecord
                                                                    .refvalue !=
                                                                '')
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
                                                                    const AlignmentDirectional(
                                                                        1, 1),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  child:
                                                                      Container(
                                                                    width: 70,
                                                                    height: 40,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                              context)
                                                                          .alternate,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              4),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.toll,
                                                                            color:
                                                                            size:
                                                                                16,
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              objectSubmissionRecord.refvalue,
                                                                              textAlign: TextAlign.center,
                                                                                    fontFamily: 'Inter',
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
                                                                            .circular(8),
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
                                                          Flexible(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 140,
                                                              decoration:
                                                                  BoxDecoration(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    child: Image
                                                                        .network(
                                                                      objectSubmissionRecord
                                                                          .image,
                                                                      width:
                                                                          200,
                                                                      height:
                                                                          200,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        FlutterFlowAudioPlayer(
                                                                      audio: Audio
                                                                          .network(
                                                                        objectSubmissionRecord
                                                                            .audio,
                                                                        metas:
                                                                            Metas(
                                                                          title:
                                                                              objectSubmissionRecord.header,
                                                                        ),
                                                                      ),
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Sora',
                                                                            color:
                                                                            fontSize:
                                                                                20,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      fillColor:
                                                                          const Color(
                                                                              0x00000000),
                                                                      playbackButtonColor:
                                                                              .alternate,
                                                                      activeTrackColor:
                                                                              .primary,
                                                                      inactiveTrackColor:
                                                                              .alternate,
                                                                      elevation:
                                                                          0,
                                                                      playInBackground:
                                                                          PlayInBackground
                                                                              .enabled,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
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
                                                        (objectSubmissionRecord
                                                                .imagesextra
                                                                .length ==
                                                            null))
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(8),
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
                                                                  const AlignmentDirectional(
                                                                      -1, -1),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(8),
                                                                child: Text(
                                                                  objectSubmissionRecord
                                                                      .header,
                                                                  maxLines: 3,
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
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
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1, -1),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            8),
                                                                child: Text(
                                                                  objectSubmissionRecord
                                                                      .body,
                                                                  maxLines: 4,
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}