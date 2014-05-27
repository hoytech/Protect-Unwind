use ExtUtils::MakeMaker;

my %args = (
  NAME => 'Protect::Unwind',
  VERSION_FROM => 'lib/Protect/Unwind.pm',
  LIBS => [''],
  INC => '-I lib/',
  PREREQ_PM => {
    'Guard' => 0,
  },
  LICENSE => 'perl',
  dist => {
    PREOP => 'pod2text $(VERSION_FROM) > $(DISTVNAME)/README',
  },
);

my $eummv = eval ($ExtUtils::MakeMaker::VERSION);
if ($eummv >= 6.45) {
    $args{META_MERGE} = {
        resources => {
            repository => 'git://github.com/hoytech/Protect-Unwind.git',
            bugtracker => 'https://github.com/hoytech/Protect-Unwind/issues',
        },
    };
}

WriteMakefile(%args);
