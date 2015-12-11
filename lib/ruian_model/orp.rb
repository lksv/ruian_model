# == Schema Information
#
# Table name: rn_orp
#
#  kod              :integer          not null, primary key
#  nazev            :string
#  nespravny        :boolean
#  vusc_kod         :integer
#  spravni_obec_kod :integer
#  id_trans_ruian   :integer
#  plati_od         :date
#  nz_id_globalni   :integer
#  zmena_grafiky    :boolean
#  definicni_bod    :geometry
#  hranice          :geometry
#  item_timestamp   :datetime
#  deleted          :boolean          default(FALSE)
#


# Obec s rozšířenou působností
class Orp < ActiveRecord::Base
  establish_connection :ruian_db
  self.table_name = 'rn_orp'
  self.primary_key = 'kod'
  belongs_to :vusc, foreign_key: 'vusc_kod', primary_key: 'kod'
  has_many :pous, foreign_key: 'orp_kod'
end
