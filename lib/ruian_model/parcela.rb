# == Schema Information
#
# Table name: rn_parcela
#
#  id                 :integer          not null, primary key
#  nespravny          :boolean
#  katuz_kod          :integer
#  druh_pozemku_kod   :integer
#  druh_cislovani_kod :integer
#  kmenove_cislo      :integer
#  poddeleni_cisla    :integer
#  vymera_parcely     :integer
#  id_trans_ruian     :integer
#  zpusob_vyu_poz_kod :integer
#  rizeni_id          :integer
#  plati_od           :date
#  definicni_bod      :geometry
#  hranice            :geometry
#  item_timestamp     :datetime
#  deleted            :boolean          default(FALSE)
#

# Land Lot (using Czech name to correspond with RUIAN)
class Parcela < ActiveRecord::Base
  establish_connection :ruian_db
  self.table_name = 'rn_parcela'

  # See http://www.cuzk.cz/Katastr-nemovitosti/Poskytovani-udaju-z-KN/Ciselniky-ISKN/Ciselniky-k-nemovitosti.aspx#SC_D_POZEMKU
  # http://www.cuzk.cz/Predpisy/Ostatni-dokumenty/Aktuality-WEB/Katastralni-vyhlasky/Priloha-KatV-k-podpisu-P-a-do-Sbirky-zakonu-%281%29.aspx
  DRUH_POZEMKU = {
    2 => ['orná půda', 'orná půda'],
    3 => ['chmelnice', 'chmelnice'],
    4 => ['vinice', 'vinice'],
    5 => ['zahrada', 'zahrada'],
    6 => ['ovocný sad', 'ovoc. sad'],
    7 => ['trvalý travní porost', 'travní p.'],
    8 => ['trvalý travní porost', 'travní p.'],
    10 => ['lesní pozemek', 'lesní poz.'],
    11 => ['vodní plocha', 'vodní pl.'],
    13 => ['zastavěná plocha a nádvoří', 'zast. pl.'],
    14 => ['ostatní plocha', 'ostat.pl.']
  }
  DRUH_POZEMKU_NAZVY = DRUH_POZEMKU.values.flatten

  belongs_to :katastralni_uzemi, foreign_key: 'katuz_kod'
  has_many :stavebni_objekty, foreign_key: 'identifikacni_parcela_id'

  def to_address
    res = 'parc.č. '
    res << "st. " if druh_cislovani_kod == 1
    res << "#{kmenove_cislo}"
    res << "/#{poddeleni_cisla}" if poddeleni_cisla
    res << " (#{DRUH_POZEMKU[druh_pozemku_kod][1]})"
    res
  end

  def cuzk_url
    # http://nahlizenidokn.cuzk.cz/MapaIdentifikace.aspx?l=KN?x=-742664?y=-1044239
    "http://vdp.cuzk.cz/vdp/ruian/vlastnici?typ=pa&id=#{id}"
  end
end
