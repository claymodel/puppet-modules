# Define bind::conf
#
# General bind main configuration file's inline modification define
# Use with caution, it's still at experimental stage and may break in untested circumstances
# Engine, pattern end line parameters can be tweaked for better behaviour
#
# Usage:
# bind::conf    { "mynetworks":  value => "127.0.0.0/8 10.42.42.0/24" }
#
define bind::conf ($value) {

    require bind::params

    config { "named_conf_$name":
        file      => "${bind::params::configfile}",
        line      => "$name $value",
        pattern   => "^$name ",
        engine    => "replaceline",
        notify    => Service["bind"],
        require   => File["namedconf"],
    }

}
