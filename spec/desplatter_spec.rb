require 'spec_helper'

RSpec.describe Desplatter do
  let(:test_class) {

  }

  class Test
    include Desplatter

    def test_method(name, age, email)
      desplat
    end
  end

  let!(:test_instance) { Test.new }

  before do
    test_instance.test_method("James", 23, "james@workplacearcade.com")
  end

  context "Setting instance variables" do
    it 'sets the name instance variable' do
      expect(test_instance.instance_variable_get(:@name)).to eq "James"
    end

    it 'sets the age instance variable' do
      expect(test_instance.instance_variable_get(:@age)).to eq 23
    end

    it 'sets the email instance variable' do
      expect(test_instance.instance_variable_get(:@email)).to eq "james@workplacearcade.com"
    end
  end

  context "attr_accessors" do
    it 'has an attr_accessor for name' do
      expect(test_instance.name).to eq "James"
    end

    it 'has an attr_accessor for age' do
      expect(test_instance.age).to eq 23
    end

    it 'has an attr_accessor for email' do
      expect(test_instance.email).to eq "james@workplacearcade.com"
    end
  end
end
