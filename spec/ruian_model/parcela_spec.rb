require 'spec_helper'

describe Parcela do
  describe '#to_address' do
    before do
      skip 'Ruian DB is not loaded.' unless Parcela.exists?(3101787710)
    end
    context 'without "st." e.g. druh_cislovani_kod = 2' do
      it 'do not show "st."' do
        subject = Parcela.find(3101787710)
        expect(subject.to_address).to eq 'parc.č. st. 204 (zast. pl.)'
      end
    end

    context 'with "st." (druh_cislovani_kod = 1)' do
      it 'without poddeleni_cisla' do
        subject = Parcela.find(3101787710)
        expect(subject.to_address).to eq 'parc.č. st. 204 (zast. pl.)'
      end

      it 'with poddeleni_cisla' do
        subject = Parcela.find(2910447710)
        expect(subject.to_address).to eq 'parc.č. st. 301/2 (zast. pl.)'
      end
    end

    describe 'druh pozemku' do
      it 'shows "druh pozemku" in brackets"' do
        subject = Parcela.find(1991860710)
        expect(subject.to_address).to eq 'parc.č. 182/40 (orná půda)'
        subject.druh_pozemku_kod = 14
        expect(subject.to_address).to eq 'parc.č. 182/40 (ostat.pl.)'
      end
    end
  end
end
