# == Schema Information
#
# Table name: rn_pou
#
#  kod              :integer          not null, primary key
#  nazev            :string
#  nespravny        :boolean
#  orp_kod          :integer
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


# Povereny Obecni Urad
class Pou < ActiveRecord::Base
  establish_connection :ruian_db
  self.table_name = 'rn_pou'
  self.primary_key = 'kod'
  belongs_to :orp, foreign_key: 'orp_kod', primary_key: 'kod'
  has_many :obce, foreign_key: 'pou_kod'
end
