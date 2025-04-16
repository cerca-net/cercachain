// Suggested code may be subject to a license. Learn more: ~LicenseLog:3014120471.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4039426956.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1944740961.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3576326316.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2976589871.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3893169432.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2663157647.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2727177128.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1200457463.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3908858395.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1859643267.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4096616164.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1297800623.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:305292630.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:293771933.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4177930229.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2507382011.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:247903941.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3908085478.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1067077043.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1293835572.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:603645090.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2430712316.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2359112831.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2497611025.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2879045991.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1351435999.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3969890863.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3049256979.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3597511454.
dart
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'pinned_users_model.dart';
export 'pinned_users_model.dart';

class PinnedUsersWidget extends StatefulWidget {
  const PinnedUsersWidget({super.key});

  static String routeName = 'PinnedUsers';
  static String routePath = '/pinspageUsers';

  @override
  State<PinnedUsersWidget> createState() => _PinnedUsersWidgetState();
}

class _PinnedUsersWidgetState extends State<PinnedUsersWidget> {
  late PinnedUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PinnedUsersModel());

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
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 7,
                        color: Color(0x2F1D2429),
                        offset: Offset(
                          0.0,
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
                                    'pg44gxt0' /* Users */,
                                  ),
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Sora',
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: FlutterFlowChoiceChips(
                                  options: [
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                      '8b8ed1cb' /* Pinned */,
                                    )),
                                    ChipData(
                                        FFLocalizations.of(context).getText(
                                          'nuvyfpvo' /* Messages */,
                                        ),
                                        Icons.message)
                                  ],
                                  onChanged: (val) => safeSetState(() => _model
                                      .choiceChipsValue = val?.firstOrNull),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color:
                                          letterSpacing: 0.0,
                                        ),
                                    iconColor:
                                    iconSize: 16,
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                            .secondaryBackground,
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                        .secondaryText,
                                    iconSize: 16,
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  chipSpacing: 8,
                                  rowSpacing: 8,
                                  multiselect: false,
                                  alignment: WrapAlignment.start,
                                  controller:
                                      _model.choiceChipsValueController ??=
                                          FormFieldController<List<String>>(
                                    [],
                                  ),
                                  wrapped: true,
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
                                          '7n0mr3w0' /* Search pinned users */,
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
                                          borderSide: BorderSide(
                                            color: Color(0x0000000class PinnedUsersWidget {
  static String routeName = 'PinnedUsers';
  static String routePath = '/pinspageUsers';
}