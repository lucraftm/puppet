# @summary 1.5.3 Ensure address space layout randomization (ASLR) is enabled (Scored)
#
# 1.5.3 Ensure address space layout randomization (ASLR) is enabled
# -----------------------------------------------------------------
#
# Description:
# Address space layout randomization (ASLR) is an exploit mitigation technique which
# randomly arranges the address space of key data areas of a process.
# Rationale:
# Randomly placing virtual memory regions will make it difficult to write memory page
# exploits as the memory placement will be consistently shifting.
# 
# CIS Controls:
# - Version 6
#   - 8.4 Enable Anti-exploitation Features (i.e. DEP, ASLR, EMET)
#     Enable anti-exploitation features such as Data Execution Prevention (DEP), Address
#     Space Layout Randomization (ASLR), virtualization/containerization, etc. For increased
#     protection, deploy capabilities such as Enhanced Mitigation Experience Toolkit (EMET)
#     that can be configured to apply these protections to a broader set of applications and
#     executables.
# - Version 7
#   - 8.3 Enable Operating System Anti-Exploitation Features/ Deploy Anti-Exploit
#     Technologies
#     Enable anti-exploitation features such as Data Execution Prevention (DEP) or Address
#     Space Layout Randomization (ASLR) that are available in an operating system or deploy
#     appropriate toolkits that can be configured to apply protection to a broader set of
#     applications and executables.
#
# @example
#   include cis_linux_2_0_0::enable_aslr_1_5_3
class cis_linux_2_0_0::enable_aslr_1_5_3 (
  Boolean $apply_cis_control = lookup('cis_linux_2_0_0::enable_aslr_1_5_3::apply_cis_control')
) {

  if $apply_cis_control {

    include cis_linux_2_0_0::ensure_sysctl_dir_exists

    file { '/etc/sysctl.d/enable_aslr.conf':
      ensure  => present,
      source  => 'puppet:///modules/cis_linux_2_0_0/enable_aslr.conf',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => File['/etc/sysctl.d'],
    }
    exec { 'Activate kernel.randomize_va_space=2':
      command  => 'sysctl -w kernel.randomize_va_space=2',
      path     => '/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin',
      unless   => 'if [[ `sysctl kernel.randomize_va_space | cut -d = -f 2` != " 2"  ]] ; then exit 1; else exit 0; fi',
      provider => 'shell',
    }
  }
}
