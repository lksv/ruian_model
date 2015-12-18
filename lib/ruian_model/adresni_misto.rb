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
  belongs_to :stavebni_objekt,
             foreign_key: 'stavobj_kod',
             inverse_of: :adresni_mista
  belongs_to :ulice, foreign_key: 'ulice_kod'

  delegate :hranice, :definicni_bod, to: :stavebni_objekt

  scope :by_ku, ->(ku) {
    joins(stavebni_objekt: {parcela: :katastralni_uzemi})
      .where('rn_katastralni_uzemi.nazev IN (?)', Array.wrap(ku))
  }

  scope :by_obec, ->(obec) {
    joins(stavebni_objekt: {parcela: {katastralni_uzemi: :obec}})
      .where('rn_obec.nazev IN (?)', Array.wrap(obec))
  }

  scope :by_cast_obce, ->(cast_obce) {
    joins(stavebni_objekt: :cast_obce )
      .where('rn_cast_obce.nazev IN (?)', Array.wrap(cast_obce))
  }

  scope :by_momc, ->(momc) {
    joins(stavebni_objekt: :momc)
      .where('rn_momc.nazev IN (?)', momc)
  }

  scope :by_ulice, ->(ulice) {
    joins(:ulice).where('rn_ulice.nazev IN (?)', Array.wrap(ulice))
  }

  scope :by_cislo_evidencni, ->(cislo_evidencni) {
    joins(:stavebni_objekt).where(
      cislo_domovni: cislo_evidencni,
      rn_stavebni_objekt: { typ_kod: 2 }
    )
  }

  scope :by_cislo, ->(cislo_popisne, cislo_orientacni_hodnota, cislo_orientacni_pismeno) {
    res = all
    res = res.joins(:stavebni_objekt).where(cislo_domovni: cislo_popisne, rn_stavebni_objekt: { typ_kod: 1}) if cislo_popisne.present?
    res = res.where(cislo_orientacni_hodnota: cislo_orientacni_hodnota) if cislo_orientacni_hodnota.present?
    res = res.where(cislo_orientacni_pismeno: cislo_orientacni_pismeno.present? ? cislo_orientacni_pismeno : nil) if cislo_orientacni_hodnota.present?
    res
  }


end
