# == Schema Information
#
# Table name: rn_cast_obce
#
#  kod             :integer          not null, primary key
#  nazev           :string
#  nespravny       :boolean
#  obec_kod        :integer
#  mluv_char_pad_2 :string
#  mluv_char_pad_3 :string
#  mluv_char_pad_4 :string
#  mluv_char_pad_5 :string
#  mluv_char_pad_6 :string
#  mluv_char_pad_7 :string
#  id_trans_ruian  :integer
#  zmena_grafiky   :boolean
#  plati_od        :date
#  nz_id_globalni  :integer
#  definicni_bod   :geometry
#  hranice         :geometry
#  item_timestamp  :datetime
#  deleted         :boolean          default(FALSE)
#

class CastObce < ActiveRecord::Base
  establish_connection :ruian_db
  self.table_name = 'rn_cast_obce'
  self.primary_key = 'kod'
  belongs_to :obec, foreign_key: 'obec_kod', primary_key: 'kod'
  has_many :stavebni_objekty, foreign_key: 'cobce_kod'
end
