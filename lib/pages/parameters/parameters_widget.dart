import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'parameters_model.dart';
export 'parameters_model.dart';

class ParametersWidget extends StatefulWidget {
  const ParametersWidget({super.key});

  static String routeName = 'Parameters';
  static String routePath = '/parameters';

  @override
  State<ParametersWidget> createState() => _ParametersWidgetState();
}

class _ParametersWidgetState extends State<ParametersWidget> {
  late ParametersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParametersModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: Material(
              color: Colors.transparent,
              child: SwitchListTile.adaptive(
                value: _model.switchListTileValue1 ??= true,
                onChanged: (newValue) async {
                  safeSetState(() => _model.switchListTileValue1 = newValue);
                },
                title: Text(
                  FFLocalizations.of(context).getText(
                    'u110qpli' /* Object Notifications */,
                  ),
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        lineHeight: 2,
                      ),
                ),
                subtitle: Text(
                  FFLocalizations.of(context).getText(
                    'igkyw93p' /* Receive Push notifications fro... */,
                  ),
                        fontFamily: 'Inter',
                        color: const Color(0xFF8B97A2),
                        letterSpacing: 0.0,
                      ),
                ),
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding: const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: SwitchListTile.adaptive(
              value: _model.switchListTileValue2 ??= true,
              onChanged: (newValue) async {
                safeSetState(() => _model.switchListTileValue2 = newValue);
              },
              title: Text(
                FFLocalizations.of(context).getText(
                  'mdkbf5i3' /* Order Notifications */,
                ),
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      lineHeight: 2,
                    ),
              ),
              subtitle: Text(
                FFLocalizations.of(context).getText(
                  'cxxpnl3g' /* Receive email notifications fr... */,
                ),
                      fontFamily: 'Inter',
                      color: const Color(0xFF8B97A2),
                      letterSpacing: 0.0,
                    ),
              ),
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: SwitchListTile.adaptive(
              value: _model.switchListTileValue3 ??= true,
              onChanged: (newValue) async {
                safeSetState(() => _model.switchListTileValue3 = newValue);
              },
              title: Text(
                FFLocalizations.of(context).getText(
                  '8sot5dum' /* Order Location  */,
                ),
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      lineHeight: 2,
                    ),
              ),
              subtitle: Text(
                FFLocalizations.of(context).getText(
                  'oueeplo5' /* Allow Tom to track your instan... */,
                ),
                      fontFamily: 'Inter',
                      color: const Color(0xFF8B97A2),
                      letterSpacing: 0.0,
                    ),
              ),
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
            ),
          ),
        ],
      ),
    );
  }
}