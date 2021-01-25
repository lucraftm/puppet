# frozen_string_literal: true

require 'spec_helper'

describe 'cis_linux_2_0_0::disable_xinetd_2_1_10' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
