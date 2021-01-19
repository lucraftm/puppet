# @summary Install packages that are commonly used but may not be present
#
# This class will ensure the specified packages are present on a system
#
# @example
#   include misc_packages
class misc_packages {
  include misc_packages::install
}
