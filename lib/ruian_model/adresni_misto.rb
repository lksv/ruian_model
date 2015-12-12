# == Schema Information
#
# Table name: rn_adresni_misto
#
#  kod                      :integer          not null, primary key
#  nespravny                :boolean
#  adrp_psc                 :integer
#  ulice_kod                :integer
#  vo_kod                   :integer
#  stavobj_kod              :integer
#  cislo_domovni            :integer
#  cislo_orientacni_hodnota :integer
#  cislo_orientacni_pismeno :string
#  id_trans_ruian           :integer
#  plati_od                 :date
#  zmena_grafiky            :boolean
#  nz_id_globalni           :integer
#  definicni_bod            :geometry
#  zachranka                :geometry
#  hasici                   :geometry
#  item_timestamp           :datetime
#  deleted                  :boolean          default(FALSE)
#

class AdresniMisto < ActiveRecord::Base
  establish_connection :ruian_db
  self.table_name = 'rn_adresni_misto'
  self.primary_key = 'kod'
  belongs_to :stavebni_objekt, foreign_key: 'stavobj_kod'
  belongs_to :ulice, foreign_key: 'ulice_kod'

  delegate :hranice, :definicni_bod, to: :stavebni_objekt
end
