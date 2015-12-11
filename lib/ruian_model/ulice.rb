# == Schema Information
#
# Table name: rn_ulice
#
#  kod            :integer          not null, primary key
#  nazev          :string
#  nespravny      :boolean
#  obec_kod       :integer
#  id_trans_ruian :integer
#  plati_od       :date
#  nz_id_globalni :integer
#  zmena_grafiky  :boolean
#  definicni_cara :geometry
#  item_timestamp :datetime
#  deleted        :boolean          default(FALSE)
#

class Ulice < ActiveRecord::Base
  establish_connection :ruian_db
  self.table_name = 'rn_ulice'
  self.primary_key = 'kod'
  has_many :adresni_mista, foreign_key: 'ulice_kod'
  belongs_to :obec, foreign_key: 'obec_kod'
end
