import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/object/object_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'catalogue_model.dart';
export 'catalogue_model.dart';

class CatalogueWidget extends StatefulWidget {
  const CatalogueWidget({super.key});

  @override
  State<CatalogueWidget> createState() => _CatalogueWidgetState();
}

class _CatalogueWidgetState extends State<CatalogueWidget> {
  late CatalogueModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CatalogueModel());

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
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 34,
                                        height: 34,
                                        decoration: BoxDecoration(
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Container(
                                            width: 200,
                                            height: 200,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              'https://picsum.photos/seed/813/600',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(-1, 0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(12, 4, 0, 4),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '67n3uccs' /* Username */,
                                                  ),
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 16,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(-1, 0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 12, 4),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'iy48ih5s' /* 2h */,
                                                  ),
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    const AlignmentDirectional(1, 0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 100,
                                                  buttonSize: 30,
                                                  fillColor:
                                                              context)
                                                          .secondaryBackground,
                                                  icon: Icon(
                                                    Icons.close,
                                                            context)
                                                        .secondaryText,
                                                    size: 14,
                                                  ),
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 8)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'qafpjf5h' /* Catalogue name */,
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
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                              child: Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                        .secondaryBackground,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              '0aco7je1' /* Option 1 */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'amx4paqo' /* Option 2 */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'j5xjl8cj' /* Option 3 */,
                                            )),
                                            ChipData(''),
                                            ChipData(''),
                                            ChipData('')
                                          ],
                                          onChanged: (val) => safeSetState(() =>
                                              _model.choiceChipsValue =
                                                  val?.firstOrNull),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                    .secondary,
                                            textStyle:
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                                  context)
                                                              .info,
                                                      fontSize: 10,
                                                      letterSpacing: 0.0,
                                                    ),
                                            iconColor:
                                                    .info,
                                            iconSize: 10,
                                            elevation: 0,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                    .secondaryBackground,
                                            textStyle:
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 10,
                                                      letterSpacing: 0.0,
                                                    ),
                                            iconColor:
                                                    .secondaryText,
                                            iconSize: 10,
                                            elevation: 0,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          chipSpacing: 8,
                                          rowSpacing: 8,
                                          multiselect: false,
                                          alignment: WrapAlignment.center,
                                          controller: _model
                                                  .choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                          wrapped: true,
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 8)),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: StreamBuilder<List<SubmissionRecord>>(
                                  stream: querySubmissionRecord(
                                    queryBuilder: (submissionRecord) =>
                                        submissionRecord.where(
                                      'poster',
                                      isEqualTo: currentUserReference,
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
                                          staggeredViewSubmissionRecordList
                                              .length,
                                      itemBuilder:
                                          (context, staggeredViewIndex) {
                                        final staggeredViewSubmissionRecord =
                                            staggeredViewSubmissionRecordList[
                                                staggeredViewIndex];
                                        return Visibility(
                                          visible: staggeredViewSubmissionRecord
                                                      .refvalue !=
                                                  null &&
                                              staggeredViewSubmissionRecord
                                                      .refvalue !=
                                                  '',
                                          child: Builder(
                                            builder: (context) =>
                                                FutureBuilder<SubmissionRecord>(
                                              future: SubmissionRecord
                                                  .getDocumentOnce(
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
                                                                  context)
                                                              .primary,
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
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: const AlignmentDirectional(
                                                                  0, 0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: ObjectWidget(
                                                            object:
                                                                objectSubmissionRecord,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Container(
                                                      width: double.infinity,
                                                      constraints:
                                                          const BoxConstraints(
                                                        maxHeight: 320,
                                                      ),
                                                      decoration: BoxDecoration(
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: const [
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
                                                                  builder:
                                                                      (context) {
                                                                    final feedobjectimages = objectSubmissionRecord
                                                                        .imagesextra
                                                                        .map((e) =>
                                                                            e)
                                                                        .toList()
                                                                        .take(3)
                                                                        .toList();

                                                                    return SingleChildScrollView(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: List.generate(
                                                                            feedobjectimages.length,
                                                                            (feedobjectimagesIndex) {
                                                                          final feedobjectimagesItem =
                                                                              feedobjectimages[feedobjectimagesIndex];
                                                                          return Container(
                                                                            width:
                                                                                200,
                                                                            height:
                                                                                200,
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                Visibility(
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
                                                                            1,
                                                                            1),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            70,
                                                                        height:
                                                                            40,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                          borderRadius:
                                                                              BorderRadius.circular(12),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(4),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.toll,
                                                                                size: 16,
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
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
                                    );
                                  },
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 4)),
                        ),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(height: 8)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}