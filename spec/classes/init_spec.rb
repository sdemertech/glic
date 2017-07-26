require 'spec_helper'
describe 'glic' do

  context 'with defaults for all parameters' do
    it { should contain_class('glic') }
  end
end
