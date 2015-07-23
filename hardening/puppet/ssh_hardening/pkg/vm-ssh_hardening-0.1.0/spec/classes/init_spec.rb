require 'spec_helper'
describe 'ssh_hardening' do

  context 'with defaults for all parameters' do
    it { should contain_class('ssh_hardening') }
  end
end
