class projects::font_ubuntu (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ){

    repository { "${my_homedir}/src/puppet-font_ubuntu":
        source  => 'wbs75/puppet-font_ubuntu',
    }

    File {
        owner => 'root',
        group => 'admin',
        mode  => '1575',
    }

    file {"/Library/Fonts":
        ensure    =>    link,
        recurse   =>    true,
        source    =>    "${my_homedir}/src/puppet-font_ubuntu/ubuntu_font_family",
        require => Repository["${my_homedir}/src/puppet-font_ubuntu"],
        mode  => '0644',
    }

}
