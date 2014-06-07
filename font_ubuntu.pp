class projects::font_ubuntu (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ){

    File {
        owner => $my_username,
        group => 'admin',
        mode  => '0644',
    }

    boxen::project { 'font_ubuntu':
        dir     => "${my_homedir}/src/font_ubuntu",
        source  => 'https://github.com/wbs75/puppet-font_ubuntu',
    }


    file {"${my_homedir}/Library/Fonts":
      ensure => 'directory',
      recurse => true,
      source => "${my_homedir}/src/font_ubuntu"
    }

}
