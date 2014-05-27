use ExtUtils::MakeMaker;

WriteMakefile(
  NAME => 'Protect::Unwind',
  VERSION_FROM => 'lib/Protect/Unwind.pm',
  LIBS => [''],
  INC => '-I lib/',
  PREREQ_PM => {
    'Guard' => 0,
  },
  dist => {
    PREOP => 'pod2text $(VERSION_FROM) > $(DISTVNAME)/README',
  },
);
