require 'spec_helper'
require 'rails_helper'

describe 'config' do
  context 'sparql' do
    it 'should be in file' do
      expect(defined?(SemanticCMS.sparql)).to_not be_nil
    end

    it 'should have host' do
      expect(defined?(SemanticCMS.sparql.host)).to_not be_nil
    end
  end
end
