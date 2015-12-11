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

#File.open('public/parcela.json', 'w+') { |f| f.puts Parcela.all_geojson }
#
class Parcela < ActiveRecord::Base
  establish_connection :ruian_db
  self.table_name = 'rn_parcela'

  belongs_to :katastralni_uzemi, foreign_key: 'katuz_kod'
  has_many :stavebni_objekty, foreign_key: 'identifikacni_parcela_id'
end
