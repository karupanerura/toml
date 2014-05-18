[![Build Status](https://travis-ci.org/karupanerura/toml.png?branch=master)](https://travis-ci.org/karupanerura/toml)
# NAME

TOML - Parser for Tom's Obvious, Minimal Language.

# SYNOPSIS

    use TOML qw(from_toml to_toml);

    # Parsing toml
    my $toml = slurp("~/.foo.toml");
    my $data = from_toml($toml);

    # With error checking
    my ($data, $err) = from_toml($toml);
    unless ($data) {
        die "Error parsing toml: $err";
    }

    # Creating toml
    my $toml = to_toml($data); 

# DESCRIPTION

`TOML` implements a parser for Tom's Obvious, Minimal Language, as
defined at [https://github.com/mojombo/toml](https://github.com/mojombo/toml). `TOML` exports two
subroutines, `from_toml` and `to_toml`,

# FAQ

- How change how to deserialize?

    You can change `$TOML::PARSER` for change how to deserialize.

    example:

        use TOML;
        use TOML::Parser;

        local $TOML::PARSER = TOML::Parser->new(
            inflate_boolean => sub { $_[0] eq 'true' ? \1 : \0 },
        );

        my $data = TOML::from_toml('foo = true');

# FUNCTIONS

- from\_toml

    `from_toml` transforms a string containing toml to a perl data
    structure or vice versa. This data structure complies with the tests
    provided at [https://github.com/mojombo/toml/tree/master/tests](https://github.com/mojombo/toml/tree/master/tests).

    If called in list context, `from_toml` produces a (`hash`,
    `error_string`) tuple, where `error_string` is `undef` on
    non-errors. If there is an error, then `hash` will be undefined and
    `error_string` will contains (scant) details about said error.

- to\_toml

    `to_toml` transforms a perl data structure into toml-formatted
    string.

# AUTHOR

Darren Chamberlain <darren@cpan.org>

# CONTRIBUTORS

- Tokuhiro Matsuno <tokuhirom@cpan.org>
- Matthias Bethke <matthias@towiski.de>
- Sergey Romanov <complefor@rambler.ru>
- karupanerura <karupa@cpan.org>
