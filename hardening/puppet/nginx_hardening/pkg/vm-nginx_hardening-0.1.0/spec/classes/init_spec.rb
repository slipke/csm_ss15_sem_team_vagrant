require 'spec_helper'
describe 'nginx_hardening' do

  context 'with defaults for all parameters' do
    it { should contain_class('nginx_hardening') }
  end
end
