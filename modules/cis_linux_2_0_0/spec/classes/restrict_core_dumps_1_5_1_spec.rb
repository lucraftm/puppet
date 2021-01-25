# frozen_string_literal: true

require 'spec_helper'

describe 'cis_linux_2_0_0::restrict_core_dumps_1_5_1' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
