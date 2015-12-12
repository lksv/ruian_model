# == Schema Information
#
# Table name: rn_obec
#
#  kod                   :integer          not null, primary key
#  nazev                 :string
#  nespravny             :boolean
#  okres_kod             :integer
#  pou_kod               :integer
#  nuts_lau              :string
#  mluv_char_pad_2       :string
#  mluv_char_pad_3       :string
#  mluv_char_pad_4       :string
#  mluv_char_pad_5       :string
#  mluv_char_pad_6       :string
#  mluv_char_pad_7       :string
#  zmena_grafiky         :boolean
#  cleneni_sm_rozsah_kod :integer
#  cleneni_sm_typ_kod    :integer
#  status_kod            :integer
#  vlajka_text           :string
#  vlajka_obrazek        :binary
#  znak_text             :string
#  znak_obrazek          :binary
#  id_trans_ruian        :integer
#  plati_od              :date
#  nz_id_globalni        :integer
#  definicni_bod         :geometry
#  hranice               :geometry
#  item_timestamp        :datetime
#  deleted               :boolean          default(FALSE)
#

class Obec < ActiveRecord::Base
  establish_connection :ruian_db
  self.table_name = 'rn_obec'
  self.primary_key = 'kod'
  belongs_to :okres,
             foreign_key: 'okres_kod',
             primary_key: 'kod',
             inverse_of: :obce
  belongs_to :pou, foreign_key: 'pou_kod', primary_key: 'kod'
  has_many :casti_obci, foreign_key: 'obec_kod'
  has_many :katastralni_uzemi, foreign_key: 'obec_kod'
  has_many :ulice, foreign_key: 'obec_kod'
  has_many :momcs, foreign_key: 'obec_kod'

  delegate :vusc, to: :okres
end
