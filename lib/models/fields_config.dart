part of 'app_config.dart';

class FieldConfig {
  final List<SingleFormField> formFieldList;

  FieldConfig(this.formFieldList);
}

abstract class SingleFormField {
  final String id;
  final String title;
  final bool shouldRequireValidation;
  final String type;
  SingleFormField({
    @required this.type,
    @required this.id,
    @required this.title,
    @required this.shouldRequireValidation,
  });
}

class ShortTextField extends SingleFormField {
  ShortTextField(dynamic)
      : super(
          id: dynamic['id'],
          title: dynamic['title'],
          shouldRequireValidation: dynamic['validations']['required'],
          type: 'short_text',
        );
}

class DropdownField extends SingleFormField {
  final List<String> choices;
  DropdownField(dynamic, this.choices)
      : super(
          id: dynamic['id'],
          title: dynamic['title'],
          shouldRequireValidation: dynamic['validations']['required'],
          type: 'dropdown',
        );
}

class NumberField extends SingleFormField {
  NumberField(dynamic)
      : super(
          id: dynamic['id'],
          title: dynamic['title'],
          shouldRequireValidation: dynamic['validations']['required'],
          type: 'number',
        );
}

class EmailField extends SingleFormField {
  EmailField(dynamic)
      : super(
          id: dynamic['id'],
          title: dynamic['title'],
          shouldRequireValidation: dynamic['validations']['required'],
          type: 'email',
        );
}

class PhoneNumberField extends SingleFormField {
  PhoneNumberField(dynamic)
      : super(
          id: dynamic['id'],
          title: dynamic['title'],
          shouldRequireValidation: dynamic['validations']['required'],
          type: 'phone_number',
        );
}

class RatingField extends SingleFormField {
  final int steps;
  RatingField(dynamic, this.steps)
      : super(
          id: dynamic['id'],
          title: dynamic['title'],
          shouldRequireValidation: dynamic['validations']['required'],
          type: 'phone_number',
        );
}

class DateField extends SingleFormField {
  final String structure;
  DateField(dynamic, this.structure)
      : super(
          id: dynamic['id'],
          title: dynamic['title'],
          shouldRequireValidation: dynamic['validations']['required'],
          type: 'phone_number',
        );
}

class YesNoField extends SingleFormField {
  YesNoField(dynamic)
      : super(
          id: dynamic['id'],
          title: dynamic['title'],
          shouldRequireValidation: dynamic['validations']['required'],
          type: 'phone_number',
        );
}

List<SingleFormField> configParser(fieldsDynamic) {
  return (fieldsDynamic as List).map((dynamic) {
    switch (dynamic["type"]) {
      case "short_text":
        return ShortTextField(dynamic);
      case "dropdown":
        return DropdownField(
            dynamic,
            (dynamic["properties"]["choices"] as List)
                .map((e) => e["label"].toString())
                .toList());
      case "number":
        return NumberField(dynamic);
      case "email":
        return EmailField(dynamic);
      case "phone_number":
        return PhoneNumberField(dynamic);
      case "rating":
        return RatingField(dynamic, dynamic["properties"]["steps"]);
      case "date":
        return DateField(dynamic, dynamic["properties"]["structure"]);
      case "yes_no":
        return YesNoField(dynamic);
    }
  }).toList();
}
