import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(
    path:
        'secret.env') //give full path here with name like secret.env instead of only extension
abstract class Env {
  @EnviedField(varName: 'apiKey', obfuscate: true)
  static String apiKey = _Env.apiKey;
  @EnviedField(varName: 'appId', obfuscate: true)
  static String appId = _Env.appId;
  @EnviedField(varName: 'appKey', obfuscate: true)
  static String appKey = _Env.appKey;
}
