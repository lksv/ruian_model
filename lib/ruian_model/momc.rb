# == Schema Information
#
# Table name: rn_momc
#
#  kod             :integer          not null, primary key
#  nazev           :string
#  nespravny       :boolean
#  obec_kod        :integer
#  mop_kod         :integer
#  spravobv_kod    :integer
#  mluv_char_pad_2 :string
#  mluv_char_pad_3 :string
#  mluv_char_pad_4 :string
#  mluv_char_pad_5 :string
#  mluv_char_pad_6 :string
#  mluv_char_pad_7 :string
#  zmena_grafiky   :boolean
#  vlajka_text     :string
#  vlajka_obrazek  :binary
#  znak_text       :string
#  znak_obrazek    :binary
#  id_trans_ruian  :integer
#  plati_od        :date
#  nz_id_globalni  :integer
#  definicni_bod   :geometry
#  hranice         :geometry
#  item_timestamp  :datetime
#  deleted         :boolean          default(FALSE)
#

class Momc < ActiveRecord::Base
  establish_connection :ruian_db
  self.table_name = 'rn_momc'
  self.primary_key = 'kod'
  belongs_to :obec, foreign_key: 'obec_kod'
  has_many :documents
end
