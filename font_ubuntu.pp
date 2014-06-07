class projects::font_ubuntu (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ){

    File {
        owner => 'root',
        group => 'wheel',
        mode  => '0644',
    }

    boxen::project { 'font_ubuntu':
        dir     => "${my_homedir}/src/puppet-font_ubuntu",
        source  => 'https://github.com/wbs75/puppet-font_ubuntu',
    }


    file {"/Library/Fonts":
      ensure =>     'directory',
      mode  =>      '0644',
      recurse =>    true,
      source =>     "${my_homedir}/src/puppet-font_ubuntu/ubuntu_font_family"
    }

}
