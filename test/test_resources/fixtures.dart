import 'dart:io';

String fixture(String name) => File('test/test_resources/$name').readAsStringSync();