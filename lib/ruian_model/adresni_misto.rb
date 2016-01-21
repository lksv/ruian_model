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

  delegate :hranice, :definicni_bod, :cuzk_url, to: :stavebni_objekt

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

  # Converts AdresniMisto to human readable addres, defined by:
  # [Vyhláška č. 359/2011 Sb., § 6](https://www.zakonyprolidi.cz/cs/2011-359)
  # Do not forget include all necessary fields:
  # AdresniMisto.includes(
  #   ulice: :obec,
  #   stavebni_objekt: [
  #     momc: :obec,
  #     cast_obce: :obec,
  #     parcela: :katastralni_uzemi
  #   ]
  # )
  def to_address
    cislo_orientacni = cislo_orientacni_hodnota.to_s
    cislo_orientacni << cislo_orientacni_pismeno.to_s if cislo_orientacni_pismeno

    ulice_nazev = ulice.try!(:nazev)

    obec = ulice.try!(:obec) || stavebni_objekt.obec

    obec_nazev = obec.try(:nazev)

    cast_obce = stavebni_objekt.cast_obce
    cast_obce_nazev = cast_obce.try!(:nazev)

    if stavebni_objekt.obec.nazev == 'Praha'
      p stavebni_objekt
      # 1. V praze
      [
        "#{ulice_nazev} #{cislo_domovni}/#{cislo_orientacni}",
        # RUIAN data is not valid: StavebniObjekt.find(27562247).parcela == nil
        # therefore #try!
        stavebni_objekt.parcela.try!(:katastralni_uzemi).try!(:nazev),
        "#{adrp_psc} #{obec_nazev}" # TODO cislo mestskeho obvodu
      ]
    elsif ulice && cast_obce_nazev != obec_nazev
      # 2. V místě, kde se užívá uliční systém a název obce není shodný s názvem části obce
      [
        "#{ulice_nazev} #{cislo_domovni}/#{cislo_orientacni}",
        cast_obce_nazev,
        "#{adrp_psc} #{obec_nazev}"
      ]
    elsif ulice && cast_obce_nazev == obec_nazev
      # 3. V místě, kde se užívá uliční systém a název obce je shodný s názvem části obce
      [
        "#{ulice_nazev} #{cislo_domovni}",
        "#{adrp_psc} #{obec_nazev}"
      ]
    elsif !ulice && cast_obce_nazev != obec_nazev
      # 4. V místě, kde se neužívá uliční systém a název obce a její části nejsou shodné
      [
        "#{cast_obce_nazev} #{cislo_domovni}",
        "#{adrp_psc} #{obec_nazev}"
      ]
    elsif !ulice && cast_obce_nazev == obec_nazev
      # 5. V místě, kde se neužívá uliční systém a název obce a její části jsou shodné
      cislo_domovni_prefix = case stavebni_objekt.typ_kod
        when 1 then 'č.p.'
        when 2 then 'č.e.'
        when 3 then 'bez č.p./č.e.'
        else
          fail "Cannot construct addres for AdresniMisto.id=#{id}: unknown typ_kod"
        end
      [
        "#{cislo_domovni_prefix} #{cislo_domovni}",
        "#{adrp_psc} #{obec_nazev}"
      ]
    else
      fail "Cannot construct addres for AdresniMisto.id=#{id}"
    end
  end

end
