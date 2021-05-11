class FurtherDetailsOptions {
  int id;
  String description;

  FurtherDetailsOptions(
    this.id,
    this.description,
  );

  static final furtherDetailType0 = FurtherDetailsOptions(0, 'I am not sure.');

  static final furtherDetailType1 =
      FurtherDetailsOptions(1, 'The bird had nesting material in its beak.');
  static final furtherDetailType2 =
      FurtherDetailsOptions(2, 'The bird had food in its beak.');
  static final furtherDetailType3 = FurtherDetailsOptions(
      3, 'The bird had something in its beak, not sure what it was.');
  static final furtherDetailType4 =
      FurtherDetailsOptions(4, 'The bird leaving the nest was a fledgling.');
  static final furtherDetailType5 =
      FurtherDetailsOptions(5, 'The bird had an empty beak.');
  static final List<FurtherDetailsOptions> furtherDetailsOptionsList = [
    furtherDetailType1,
    furtherDetailType2,
    furtherDetailType3,
    furtherDetailType4,
    furtherDetailType5,
    furtherDetailType0,
  ];
}
