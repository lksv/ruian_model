# == Schema Information
#
# Table name: rn_katastralni_uzemi
#
#  kod             :integer          not null, primary key
#  nazev           :string
#  nespravny       :boolean
#  obec_kod        :integer
#  ma_dkm          :boolean
#  mluv_char_pad_2 :string
#  mluv_char_pad_3 :string
#  mluv_char_pad_4 :string
#  mluv_char_pad_5 :string
#  mluv_char_pad_6 :string
#  mluv_char_pad_7 :string
#  id_trans_ruian  :integer
#  plati_od        :date
#  nz_id_globalni  :integer
#  rizeni_id       :integer
#  definicni_bod   :geometry
#  hranice         :geometry
#  item_timestamp  :datetime
#  deleted         :boolean          default(FALSE)
#

class KatastralniUzemi < ActiveRecord::Base
  establish_connection :ruian_db
  self.table_name = 'rn_katastralni_uzemi'
  self.primary_key = 'kod'
  belongs_to :obec, foreign_key: 'obec_kod'
  has_many :parcely, foreign_key: 'katuz_kod'
end
