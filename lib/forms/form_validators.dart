import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../i18n/localization_provider.dart';

typedef ValidatorFn<T> = String? Function(T? value, Localizer localizer);

class FormValidators {
  static FormFieldValidator<T> compose<T>(
      Localizer localizer, List<ValidatorFn<T>> validators) {
    return (valueCandidate) {
      for (var validator in validators) {
        final validatorResult = validator.call(valueCandidate, localizer);
        if (validatorResult != null) {
          return validatorResult;
        }
      }
      return null;
    };
  }

  static ValidatorFn<T> required<T>({
    String? errorText,
  }) {
    return (T? valueCandidate, localizer) {
      if (valueCandidate == null ||
          (valueCandidate.toString().trim().isEmpty)) {
        return errorText ?? localizer.translate('Please fill in this field.');
      }
      return null;
    };
  }

  static ValidatorFn<T> max<T>(
    num max, {
    bool inclusive = true,
    String? errorText,
  }) {
    return (T? valueCandidate, localizer) {
      if (valueCandidate != null) {
        assert(valueCandidate is num || valueCandidate is String);
        final number = valueCandidate is num
            ? valueCandidate
            : num.tryParse(valueCandidate.toString());

        if (number != null && (inclusive ? number > max : number >= max)) {
          if (errorText != null) {
            return localizer.translate(errorText, {'max': max});
          } else if (inclusive) {
            return localizer.translate(
              'Value must be less than or equal to :max.',
              {'max': max},
            );
          } else {
            return localizer.translate(
              'Value must be less than :max.',
              {'max': max},
            );
          }
        }
      }
      return null;
    };
  }

  static ValidatorFn<String> minLength(
    int minLength, {
    bool allowEmpty = false,
    String? errorText,
  }) {
    assert(minLength > 0);
    return (String? valueCandidate, localizer) {
      final valueLength = valueCandidate == null ? 0 : valueCandidate.length;
      if (valueLength < minLength && (!allowEmpty || valueLength > 0)) {
        return localizer.translate(
          errorText ??
              'Please lengthen this text to :min characters or more. You are currently using :current characters.',
          {'min': minLength, 'current': valueLength},
        );
      }
      return null;
    };
  }

  static ValidatorFn<String> maxLength(
    int maxLength, {
    String? errorText,
  }) {
    assert(maxLength > 0);
    return (String? valueCandidate, localizer) {
      final valueLength = valueCandidate == null ? 0 : valueCandidate.length;
      if (valueLength > maxLength) {
        return localizer.translate(
          errorText ??
              'Please shorten this text to :max characters or less. You are currently using :current characters.',
          {'max': maxLength, 'current': valueLength},
        );
      }
      return null;
    };
  }

  static ValidatorFn<String> email({
    String? errorText,
  }) {
    return (String? valueCandidate, localizer) {
      return (valueCandidate?.isNotEmpty ?? false) &&
              !EmailValidator.validate(valueCandidate!)
          ? localizer
              .translate(errorText ?? 'Please enter a valid email address.')
          : null;
    };
  }

  static ValidatorFn<String> backendError(
    dynamic backendErrors,
    String key, {
    String? errorText,
  }) {
    return (_, localizer) {
      final backendErrorMessage = backendErrors?[key];
      return backendErrorMessage != null
          ? localizer.translate(errorText ?? backendErrorMessage)
          : null;
    };
  }
}
