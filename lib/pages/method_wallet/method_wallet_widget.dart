await WalletMethodsRecord.collection
        .doc()
        .set(createWalletMethodsRecordData(
          methodPoster: currentUserReference,
          methodName:
              _model.taskTextController1.text,
          methodType: _model.choiceChipsValue1,
          methodId:
              _model.taskTextController2.text,
          methodAccount:
              _model.taskTextController3.text,
        ));

    context.pushNamed(UserpageWidget.routeName);