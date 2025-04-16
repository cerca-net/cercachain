import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart' hide GestureBinding;
// import '/index.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/citylansscape2.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Placeholder for user data loading
            if (widget.publicuser == null)
              const Center(child: Text('User not specified'))
            else
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
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
                                                          // Placeholder image, replace with actual data later
                                                          'https://via.placeholder.com/100',
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (context, error, stackTrace) =>
                                                            const Icon(Icons.person, size: 50),

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
                                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                                    child: Text(
                                                      'Username Placeholder', style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color, fontSize: 20, letterSpacing: 0.0, fontWeight: FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0, 0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: const TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'User Name',
                                                            style: TextStyle(fontFamily: 'Readex Pro', color: Color(0xFF57636C), letterSpacing: 0.0,),
                                                          ),
                                                          TextSpan(
                                                            text:  ' Lastname',
                                                            style: TextStyle(fontFamily: 'Readex Pro', color: Color(0xFF57636C), letterSpacing: 0.0,), // Assuming surname style should be the same
                                                          )
                                                        ],
                                                        style: TextStyle(fontFamily: 'Readex Pro', color: Color(0xFF57636C), letterSpacing: 0.0,),
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
                                  const Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(24, 0, 0, 8),
                                        child: Text('Submit Rating',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            )
                                            // Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            //       fontFamily: 'Inter',
                                            //       color: Theme.of(context)
                                            //           .textTheme
                                            //           .bodyMedium
                                            //           ?.color,
                                            //       fontSize: 16,
                                            //       fontWeight: FontWeight.w500,
                                            //     ),
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
                                          color: Theme.of(context)
                                              .colorScheme.surfaceContainerHighest,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Align(
                                          alignment: const AlignmentDirectional(0, 0),
                                          child: RatingBar.builder(
                                            onRatingUpdate: (newValue) =>
                                                setState(() => _model
                                                    .ratingBarValue = newValue),
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.circle,
                                              color: Theme.of(context)
                                                      .colorScheme.secondary,
                                            ),
                                              direction: Axis.horizontal,
                                              initialRating:
                                                  _model.ratingBarValue ??= 0,
                                              unratedColor: Theme.of(context).disabledColor,
                                              itemCount: 10,
                                              itemPadding: const EdgeInsets.all(4),
                                            glowColor: Theme.of(context)
                                                    .colorScheme.secondary,
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
                                          color: Theme.of(context).colorScheme.surfaceContainerHighest,
                                          borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: SizedBox(
                                          width: 200,
                                            cursorColor: Theme.of(context).primaryColor,
                                              autofocus: false,
                                          child: TextFormField(
                                              controller: _model.textController,
                                              focusNode: _model.textFieldFocusNode,
                                              decoration: const InputDecoration(hintText: 'Leave a comment.'),
                                              cursorColor: Theme.of(context).primaryColor,
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
                                                borderSide: const BorderSide(
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
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
                                            unselectedWidgetColor: Theme.of(context).unselectedWidgetColor,
                                        ),
                                        child: CheckboxListTile(
                                          value:
                                              _model
                                                  .checkboxListTileValue ??= false,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.checkboxListTileValue =
                                                    newValue!);
                                          },
                                            title: const Text(
                                                'I agree to the Terms & Conditions',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                )
                                                // Theme.of(context).textTheme.titleLarge?.copyWith(
                                                //       fontFamily: 'Sora',
                                                //       fontSize: 16,
                                                //     ),
                                          ),
                                          tileColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                                          activeColor: Theme.of(context).primaryColor,
                                          checkColor: Theme.of(context).colorScheme.secondary,
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
                                    // Placeholder for submit button - needs logic for data submission
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (_model.checkboxListTileValue ==
                                            true)
                                          IconButton(
                                            icon: const Icon(Icons.send_rounded),
                                            onPressed: () async {
                                              // TODO: Implement rating submission logic here

                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'SUCCESS',
                                                    style: TextStyle(color: Theme.of(context).primaryColor,),
                                                    ),
                                                    duration: const Duration(seconds: 2),
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
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}