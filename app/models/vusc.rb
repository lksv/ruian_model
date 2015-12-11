# == Schema Information
#
# Table name: rn_vusc
#
#  kod            :integer          not null, primary key
#  nazev          :string
#  nespravny      :boolean
#  regsoudr_kod   :integer
#  id_trans_ruian :integer
#  nuts_lau       :string
#  plati_od       :date
#  nz_id_globalni :integer
#  zmena_grafiky  :boolean
#  definicni_bod  :geometry
#  hranice        :geometry
#  item_timestamp :datetime
#  deleted        :boolean          default(FALSE)
#


# Vyšší územně samosprávný celek -> ORP -> POU -> Obec
class Vusc < ActiveRecord::Base
  establish_connection :ruian_db
  self.table_name = 'rn_vusc'
  self.primary_key = 'kod'
  has_many :orps, foreign_key: 'vusc_kod'
  has_many :okresy, foreign_key: 'vusc_kod'
  has_many :obce, through: :okresy
end
