describe Obec do
  let(:subject) { Obec.new }

  # NOTE: I am testing structure not behaviour - I known, it is not TDD way
  # but this gem is only about the proper ORM mapping

  it 'belongs_to okres' do
    expect(subject.okres).to be nil

    okres = Okres.new
    okres.obce << subject
    expect(subject.okres).to be okres
  end

  it 'belongs_to pou' do
    expect(subject.pou).to be nil
  end

  it 'has_many casti_obci' do
    expect(subject.casti_obci).to eq []
  end

  it 'has_many katastralni_uzemi' do
    expect(subject.katastralni_uzemi).to eq []
  end

  it 'has_many ulice' do
    expect(subject.ulice).to eq []
  end

  it 'has_many momcs' do
    expect(subject.momcs).to eq []
  end

  it '#vusc delegates to okres' do
    vusc = double('vusc')
    okres = double('Okres', vusc: vusc)
    expect(subject).to receive(:okres).and_return(okres)
    expect(subject.vusc).to eq vusc
  end
end
