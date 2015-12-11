# == Schema Information
#
# Table name: adresni_posta
#
#  id         :integer          not null, primary key
#  psc        :string(255)
#  nazev      :string(255)
#  plati_od   :datetime
#  plati_do   :datetime
#  created_at :datetime
#  updated_at :datetime
#

# Ciselniky ISUI UI_ADRESNI_POSTA
# see vendor/adresni_posta/ directory
class AdresniPosta < ActiveRecord::Base
end
