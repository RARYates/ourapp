# frozen_string_literal: true

require 'spec_helper'

describe 'ourapp::user0' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_class('ourapp') }
      it { is_expected.to contain_file('/var/www/html/user0.html') }
      it { is_expected.to contain_ourapp__index('user0') }
    end
  end
end
