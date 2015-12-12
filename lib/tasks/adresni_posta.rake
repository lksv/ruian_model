namespace :adresni_posta do
  desc 'Loads all "adresni_posta" to DB'
  task :load => :environment do |t, args|
    CSV.open(File.join(Rails.root, 'vendor/adresni_posta/UI_ADRESNI_POSTA.csv'), col_sep: ';').each_with_index do |row, idx|
      next if idx == 0
      psc, nazev, plati_od, plati_od = row
      psc = Integer(psc.gsub(/\s+/, ''))
      plati_od = DateTime.parse(plati_od) if plati_od
      plati_do = DateTime.parse(plati_do) if plati_do
      AdresniPosta.find_or_create_by!(nazev: nazev) do |am|
        am.psc = psc
        am.plati_do = plati_od
        am.plati_od = plati_do
        puts "Saving: #{am.inspect}"
      end
    end
  end
end
