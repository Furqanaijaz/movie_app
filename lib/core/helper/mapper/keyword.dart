import 'package:flutter/widgets.dart';
import 'package:netfilx/core/entity/keyword_entity.dart';
import 'package:netfilx/core/model/keyword.dart';

class KeywordMapper {
  static KeywordEntity toEntity(KeywordModel KeywordModel) {
    return KeywordEntity(name: KeywordModel.name, id: KeywordModel.id);
  }
}
