import 'package:bedrive/i18n/localization_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailChipInput extends HookConsumerWidget {
  final List<String> chips;
  final ValueChanged<List<String>> onChange;

  const EmailChipInput(
      {required this.chips, required this.onChange, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController? textEditingController;
    FocusNode? focusNode;
    final localizer = ref.watch(localizationProvider);
    final contactEmails = useState<List<String>>([]);
    final emailIsInvalid = useState(false);

    useEffect(() {
      FlutterContacts.requestPermission(readonly: true).then((havePermission) {
        if (havePermission) {
          FlutterContacts.getContacts(withProperties: true).then((contacts) {
            contactEmails.value = contacts
                .map((c) => c.emails.map((e) => e.address))
                .expand((i) => i)
                .toList();
          });
        }
      });
      return null;
    }, []);

    addChip(String email) {
      if (email != '' && !chips.contains(email)) {
        if (!EmailValidator.validate(email)) {
          emailIsInvalid.value = true;
          focusNode?.requestFocus();
          return;
        }
        onChange([...chips, email]);
      }
      textEditingController?.clear();
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Autocomplete<String>(
        fieldViewBuilder: (
          BuildContext bc,
          TextEditingController ctrl,
          FocusNode fn,
          _,
        ) {
          textEditingController = ctrl;
          focusNode = fn;
          return TextField(
            focusNode: fn,
            controller: ctrl,
            textInputAction: TextInputAction.done,
            onChanged: (value) {
              emailIsInvalid.value = false;
            },
            decoration: InputDecoration(
              errorText: emailIsInvalid.value
                  ? localizer.translate('Invalid email address')
                  : null,
              hintText: localizer.translate('Enter email addresses'),
            ),
            onSubmitted: addChip,
          );
        },
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return contactEmails.value.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: addChip,
      ),
      const SizedBox(height: 10),
      Wrap(
        spacing: 8,
        runSpacing: 0,
        children: chips.map((chip) {
          return InputChip(
            avatar: CircleAvatar(
              child: Text(chip[0].toUpperCase()),
            ),
            label: Text(chip),
            onDeleted: () {
              onChange(chips.where((c) => c != chip).toList());
            },
          );
        }).toList(),
      ),
    ]);
  }
}
