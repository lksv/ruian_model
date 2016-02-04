# == Schema Information
#
# Table name: rn_stavebni_objekt
#
#  kod                      :integer          not null, primary key
#  nespravny                :boolean
#  identifikacni_parcela_id :integer
#  momc_kod                 :integer
#  cobce_kod                :integer
#  budova_id                :integer
#  cisla_domovni            :integer          is an Array
#  dokonceni                :date
#  je_vytah_kod             :integer
#  zmena_grafiky            :boolean
#  druh_konstrukce_kod      :integer
#  zmena_detailu            :boolean
#  obestaveny_prostor       :integer
#  pocet_bytu               :integer
#  pocet_podlazi            :integer
#  podlahova_plocha         :integer
#  pripoj_el_energie        :boolean
#  pripoj_kanal_sit_kod     :integer
#  pripoj_plyn_kod          :integer
#  pripoj_vodovod_kod       :integer
#  typ_kod                  :integer
#  zastavena_plocha         :integer
#  zpusob_vytapeni_kod      :integer
#  zpusob_vyuziti_kod       :integer
#  id_trans_ruian           :integer
#  plati_od                 :date
#  nz_id_globalni           :integer
#  definicni_bod            :geometry
#  hranice                  :geometry
#  item_timestamp           :datetime
#  deleted                  :boolean          default(FALSE)
#

class StavebniObjekt < ActiveRecord::Base
  establish_connection :ruian_db
  self.table_name = 'rn_stavebni_objekt'
  self.primary_key = 'kod'

  belongs_to :cast_obce, foreign_key: 'cobce_kod'
  belongs_to :parcela, foreign_key: 'identifikacni_parcela_id'
  belongs_to :momc, foreign_key: 'momc_kod'
  has_many :adresni_mista,
           foreign_key: 'stavobj_kod',
           inverse_of: :stavebni_objekt
  #belongs_to :momc

  # cannot easily delegate to obec, is coulde be accesed by:
  #  * cast_obce.obec
  #  * momc.obec
  #  * parcela.katastralni_uzemi.obec
  def obec
    cast_obce.try!(:obec) ||
    momc.try!(:obec) ||
    katastralni_uzemi.try!(:obec)
  end

  def katastralni_uzemi
    parcela.try!(:katastralni_uzemi)
  end

  def cuzk_url
    "http://vdp.cuzk.cz/vdp/ruian/vlastnici?typ=so&id=#{id}"
  end
end
