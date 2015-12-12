# == Schema Information
#
# Table name: rn_okres
#
#  kod            :integer          not null, primary key
#  nazev          :string
#  nespravny      :boolean
#  vusc_kod       :integer
#  kraj_1960_kod  :integer
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

class Okres < ActiveRecord::Base
  establish_connection :ruian_db
  self.table_name = 'rn_okres'
  self.primary_key = 'kod'
  belongs_to :kraj, foreign_key: 'kraj_1960_kod', primary_key: 'kod'
  belongs_to :vusc, foreign_key: 'vusc_kod', primary_key: 'kod'
  has_many :obce, foreign_key: 'okres_kod', inverse_of: :okres
  has_many :documents
end
