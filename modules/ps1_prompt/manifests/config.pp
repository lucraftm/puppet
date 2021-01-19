# @summary To add required file to /etc/profile.d to set command prompt
#
# To add required file to /etc/profile.d to set command prompt
#
# @example
#   include ps1_prompt::config
class ps1_prompt::config (

  # See hiera for colour code mapping
  Enum['0;30','0;31','0;32','0;33','0;34','0;35','0;36',
       '1;30','1;31','1;32','1;33','1;34','1;35','1;36'] 
    $user_colour = lookup('ps1_prompt::config::user_colour', String),
  Enum['0;30','0;31','0;32','0;33','0;34','0;35','0;36',
       '1;30','1;31','1;32','1;33','1;34','1;35','1;36'] 
    $hostname_colour = lookup('ps1_prompt::config::hostname_colour', String),
  Enum['0;30','0;31','0;32','0;33','0;34','0;35','0;36',
       '1;30','1;31','1;32','1;33','1;34','1;35','1;36']
    $pwd_colour = lookup('ps1_prompt::config::pwd_colour', String),
  Enum['0;30','0;31','0;32','0;33','0;34','0;35','0;36',
       '1;30','1;31','1;32','1;33','1;34','1;35','1;36']
    $divider_colour = lookup('ps1_prompt::config::divider_colour', String),

) {

  # Added in case, for whatever reason, /etc/profile.d does not exist
  file { '/etc/profile.d':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  # Create the profile script from epp template
  file { '/etc/profile.d/900-PS1.sh':
    ensure  => present,
    content => epp('ps1_prompt/900-PS1.sh.epp'),
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

}
