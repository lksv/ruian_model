require 'spec_helper'

describe RuianModel do
  it 'has a version number' do
    expect(RuianModel::VERSION).not_to be nil
  end

  it '.setup configure DB and load models' do
    expect(ActiveRecord::Base.configurations).to be_empty
    expect(defined? Obec).to be_falsy
    RuianModel.setup
    expect(ActiveRecord::Base.configurations).not_to be_empty
    expect { defined? Obec.first }.to_not raise_error
  end
end
