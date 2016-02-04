describe AdresniMisto do
  let(:subject) { AdresniMisto.new }

  # NOTE: I am testing structure not behaviour - I known, it is not TDD way
  # but this gem is only about the proper ORM mapping

  describe 'associations' do
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

  describe '#katastralni_uzemi' do
    it 'delegates to stavebni_objekt' do
      subject.stavebni_objekt = StavebniObjekt.new
      expect(subject.stavebni_objekt).to receive(:katastralni_uzemi) { 'KU' }
      expect(subject.katastralni_uzemi).to eq 'KU'
    end
  end

  describe '#to_address' do
    before do
      skip 'Ruian DB is not loaded.' if AdresniMisto.count < 100_000
    end

    context 'address "1. V praze"' do
      it 'Arnošta Valenty 670/31, 19800 Praha 9' do
        expect(AdresniMisto.find(25829661).to_address).to eq(
          ['Arnošta Valenty 670/31', 'Černý Most', '19800 Praha']
        )
      end
    end
    context 'address "2. V místě, kde se užívá uliční systém a název obce není shodný s názvem části obce"' do
      it 'Lhenická 1120/1, České Budějovice 2' do
        expect(AdresniMisto.find(23353317).to_address).to eq(
          ['Lhenická 1120/1', 'České Budějovice 2', '37005 České Budějovice']
        )
      end
    end
    context 'address "3. V místě, kde se užívá uliční systém a název obce je shodný s názvem části obce"' do
      it 'Žamberecká 339, 516 01 Vamberk' do
        expect(AdresniMisto.find(9828389).to_address).to eq(
          ['Žamberecká 339', '51601 Vamberk']
        )
      end
    end
    context 'address "4. V místě, kde se neužívá uliční systém a název obce a její části nejsou shodné"' do
      it 'Dražkovice 106, 533 33 Pardubice' do
        expect(AdresniMisto.find(7674848).to_address).to eq(
          ['Dražkovice 106', '53333 Pardubice']
        )
      end
    end
    context 'address "5. V místě, kde se neužívá uliční systém a název obce a její části jsou shodné"' do
      it 'č.p. 111, 503 33 Praskačka' do
        expect(AdresniMisto.find(15795322).to_address).to eq(
          ['č.p. 111', '50333 Praskačka']
        )
      end
    end
  end
end
