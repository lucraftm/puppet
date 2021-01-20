# frozen_string_literal: true

require 'spec_helper'

describe 'cis_linux_2_0_0::disable_freevxfs_1_1_1_2' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
