requires 'TOML::Parser', '0.04';
requires 'parent';

on configure => sub {
    requires 'Module::Build::Tiny', '0.035';
    requires 'perl', '5.008_001';
};

on test => sub {
    requires 'Test::More';
};
