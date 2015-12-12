describe AdresniMisto do
  let(:subject) { AdresniMisto.new }

  # NOTE: I am testing structure not behaviour - I known, it is not TDD way
  # but this gem is only about the proper ORM mapping

  it 'belongs_to stavebni_objekt' do
    expect(subject.stavebni_objekt).to be nil
    subject.stavebni_objekt = StavebniObjekt.new
    stavebni_objekt = StavebniObjekt.new
    stavebni_objekt.adresni_mista << subject
    expect(subject.stavebni_objekt).to be stavebni_objekt
  end

  it 'belongs_to ulice' do
    expect(subject.ulice).to be nil
  end

  it '#hranice delegates to stavebni_objekt' do
    stavebni_objekt = StavebniObjekt.new
    expect(stavebni_objekt).to receive(:hranice).and_return(true)
    subject.stavebni_objekt = stavebni_objekt
    expect(subject.hranice).to eq true
  end

  it '#definicni_bod delegates to stavebni_objekt' do
    stavebni_objekt = StavebniObjekt.new
    expect(stavebni_objekt).to receive(:definicni_bod).and_return(true)
    subject.stavebni_objekt = stavebni_objekt
    expect(subject.definicni_bod).to eq true
  end
end
