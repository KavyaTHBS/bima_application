import 'dart:html';

import 'package:bima_application/core/platform/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionCheck extends Mock {

}
void main(){
  NetworkInfoImpl? networkInfoImpl;
  MockDataConnectionCheck? mockDataConnectionCheck;

  setUp((){
    mockDataConnectionCheck = MockDataConnectionCheck();
  ///  networkInfoImpl = NetworkInfoImpl(mockDataConnectionCheck!!);

  });
  group('isConnected',(){
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
        () async{
        //arrange
          final connectionFailure = Future.value(true);
       //   when(mockDataConnectionCheck?.hasConnection).thenAnswer((_) => connectionFailure);


        //  final result = networkInfoImpl?.isConnected;
          ////verify(mockDataConnectionCheck?.hasConnection);
        //  expect(result,connectionFailure);
        }
    );
  });
}