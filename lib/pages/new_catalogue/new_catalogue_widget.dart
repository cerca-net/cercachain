Expanded(
  child = Padding(
    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
      onPressed: () async {
        if (_model.formKey.currentState == null ||
            !_model.formKey.currentState!.validate()) {
          return;
        }

        if (_model.itemlist == null || _model.itemlist!.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Please select at least one item to add to the catalogue.',
              ),
            ),
          );
          return;
        }

        await CatalogoRecord.collection.doc().set({
          ...createCatalogoRecordData(
            catalogoPoster: currentUserReference,
            catalogoName: _model.taskTextController1.text,
            catalogoDescription: _model.taskTextController2.text,
          ),
          'items': _model.itemlist,
        });

        context.pushNamed(UserpageWidget.routeName);
      },
      text: FFLocalizations.of(context).getText(
        'hssbhi8t' /* Add catalogue */,
      ),
      icon: Icon(
        Icons.add,
        size: 15,
      ),
      options: FFButtonOptions(
        height: 40,
        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontSize: 14,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
        elevation: 3,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
),