# == Schema Information
#
# Table name: rn_kraj_1960
#
#  kod            :integer          not null, primary key
#  nazev          :string
#  nespravny      :boolean
#  stat_kod       :integer
#  id_trans_ruian :integer
#  plati_od       :date
#  nz_id_globalni :integer
#  zmena_grafiky  :boolean
#  definicni_bod  :geometry
#  hranice        :geometry
#  item_timestamp :datetime
#  deleted        :boolean          default(FALSE)
#

class Kraj < ActiveRecord::Base
  establish_connection :ruian_db
  self.table_name = 'rn_kraj_1960'
  self.primary_key = 'kod'
  has_many :okresy, foreign_key: 'kraj_1960_kod'
end
