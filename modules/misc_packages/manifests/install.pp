# @summary Install packages
#
# This class will install packages
#
# @example
#   include misc_packages::install
class misc_packages::install (
  # Check or alter packages to be installed via hiera yaml files
  $packages = lookup('misc_packages::packages', Array[String], 'unique')
) {
  # ensure_packages comes from puppetlabs-stdlib module
  # This stops puppet failures from occurring in case packages are referenced 
  # in multiple places
  ensure_packages(
    $packages, {
      ensure => installed,
    }
  )
}
