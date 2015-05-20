require 'spec_helper'
describe 'mysql_hardening' do

  context 'with defaults for all parameters' do
    it { should contain_class('mysql_hardening') }
  end
end
