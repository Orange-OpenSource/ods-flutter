enum ChipsEnum { none, avatar, icon }

extension CustomElementExtension on ChipsEnum {
  String get stringValue {
    switch (this) {
      case ChipsEnum.none:
        return "None";
      case ChipsEnum.avatar:
        return "Avatar";
      case ChipsEnum.icon:
        return "Icon";
      default:
        return "";
    }
  }
}
