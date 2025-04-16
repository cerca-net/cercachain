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
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'userrating_model.dart';
export 'userrating_model.dart';

class UserratingWidget extends StatefulWidget {
  const UserratingWidget({
    super.key,
    this.publicuser,
    this.userismaker,
  });

  /// user to be review
  final DocumentReference? publicuser;

  final bool? userismaker;

  static String routeName = 'userrating';
  static String routePath = '/userrating';

  @override
  State<UserratingWidget> createState() => _UserratingWidgetState();
}

class _UserratingWidgetState extends State<UserratingWidget> {
  late UserratingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserratingModel());

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
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/citylansscape2.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: StreamBuilder<UsersRecord>(
                stream: UsersRecord.getDocument(widget.publicuser!),
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

                  final columnUsersRecord = snapshot.data!;

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: SafeArea(
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color(0xDFFFFFFF),
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
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Stack(
                                        alignment: const AlignmentDirectional(0, 1),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Stack(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0, 0),
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0, 0),
                                                      child: Lottie.asset(
                                                        'assets/jsons/waiting.json',
                                                        width: 260,
                                                        height: 260,
                                                        fit: BoxFit.contain,
                                                        animate: true,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0, 0),
                                                      child: Container(
                                                        width: 100,
                                                        height: 100,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          columnUsersRecord
                                                              .profilePicture,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0, 0),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8),
                                                    child: Text(
                                                      columnUsersRecord
                                                          .username,
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 18,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0, 0),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8),
                                                    child: RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                columnUsersRecord
                                                                    .name,
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
                                                                columnUsersRecord
                                                                    .surname,
                                                            style: const TextStyle(),
                                                          )
                                                        ],
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
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: const AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24, 0, 0, 8),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'qum9uttj' /* Submit Rating */,
                                          ),
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                        .secondaryText,
                                                fontSize: 16,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 12, 0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 40,
                                        decoration: BoxDecoration(
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Align(
                                          alignment: const AlignmentDirectional(0, 0),
                                          child: RatingBar.builder(
                                            onRatingUpdate: (newValue) =>
                                                safeSetState(() => _model
                                                    .ratingBarValue = newValue),
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.circle,
                                              color:
                                                      .secondary,
                                            ),
                                            direction: Axis.horizontal,
                                            initialRating:
                                                _model.ratingBarValue ??= 0,
                                            unratedColor:
                                                    .accent1,
                                            itemCount: 10,
                                            itemPadding: const EdgeInsets.all(4),
                                            itemSize: 20,
                                            glowColor:
                                                    .secondary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: SizedBox(
                                          width: 200,
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '1ne00zdy' /* Leave a comment. */,
                                              ),
                                              hintStyle:
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
                                                          context)
                                                      .error,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                          context)
                                                      .error,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                            cursorColor:
                                                    .primaryText,
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 12, 8),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: const CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                          ),
                                          unselectedWidgetColor:
                                                  .alternate,
                                        ),
                                        child: CheckboxListTile(
                                          value: _model
                                              .checkboxListTileValue ??= false,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.checkboxListTileValue =
                                                    newValue!);
                                          },
                                          title: Text(
                                            FFLocalizations.of(context).getText(
                                              'kmmj28py' /* Terms & Conditions */,
                                            ),
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Sora',
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 16,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          tileColor:
                                                  .secondaryBackground,
                                          activeColor:
                                                  .primary,
                                          checkColor:
                                          dense: true,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 12, 0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: StreamBuilder<List<CreditsRecord>>(
                                      stream: queryCreditsRecord(
                                        queryBuilder: (creditsRecord) =>
                                            creditsRecord.where(
                                          'userRef',
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
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<CreditsRecord>
                                            rowCreditsRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final rowCreditsRecord =
                                            rowCreditsRecordList.isNotEmpty
                                                ? rowCreditsRecordList.first
                                                : null;

                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            if (_model.checkboxListTileValue ==
                                                true)
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(0, 0),
                                                child: FlutterFlowIconButton(
                                                  borderRadius: 100,
                                                  buttonSize: 46,
                                                  fillColor:
                                                              context)
                                                          .secondary,
                                                  icon: Icon(
                                                    Icons.send_rounded,
                                                            context)
                                                        .secondaryBackground,
                                                    size: 24,
                                                  ),
                                                  onPressed: () async {
                                                    await RatingsRecord
                                                            .createDoc(
                                                                columnUsersRecord
                                                                    .reference)
                                                        .set(
                                                            createRatingsRecordData(
                                                      userRef:
                                                          currentUserReference,
                                                      value: _model
                                                          .ratingBarValue
                                                          ?.round(),
                                                      date: getCurrentTimestamp,
                                                    ));

                                                    await UserRatingsRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            createUserRatingsRecordData(
                                                          ratedUser: widget
                                                              .publicuser,
                                                          date:
                                                              getCurrentTimestamp,
                                                          value: _model
                                                              .ratingBarValue
                                                              ?.round(),
                                                        ));

                                                    await rowCreditsRecord!
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'transition_i':
                                                              FieldValue
                                                                  .increment(
                                                                      2.0),
                                                        },
                                                      ),
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'SUCCESS',
                                                          style: TextStyle(
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );

                                                    context.pushNamed(
                                                        FeedpageWidget
                                                            .routeName);
                                                  },
                                                ),
                                              ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
