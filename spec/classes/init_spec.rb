require 'spec_helper'
describe 'guardian' do

  context 'with defaults for all parameters' do
    it { should contain_class('guardian') }
  end
end
